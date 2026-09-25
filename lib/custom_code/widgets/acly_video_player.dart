// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AclyVideoPlayer extends StatefulWidget {
  const AclyVideoPlayer({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
    required this.videoType,
    required this.autoPlay,
    required this.showControls,
  });

  final double? width;
  final double? height;
  final String videoUrl;
  final String videoType;
  final bool autoPlay;
  final bool showControls;

  @override
  State<AclyVideoPlayer> createState() => _AclyVideoPlayerState();
}

class _AclyVideoPlayerState extends State<AclyVideoPlayer> {
  static const String _volumeKey = 'acly_video_player_volume';

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  bool _showControls = true;
  double _volume = 1.0;
  double _previousVolume = 1.0;
  Timer? _hideTimer;
  bool _isInitialized = false;
  bool _isFullscreen = false;

  // Performance optimization
  VoidCallback? _listener;
  bool _wasPlaying = false;
  Duration _lastPosition = Duration.zero;

  // Double-tap seek
  DateTime? _lastTapTime;
  static const Duration _doubleTapWindow = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _loadVolume();

    _controller = widget.videoType == 'asset'
        ? VideoPlayerController.asset(widget.videoUrl)
        : VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    _initializeVideoPlayerFuture = _initializeController();
  }

  Future<void> _loadVolume() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedVolume = prefs.getDouble(_volumeKey);
      if (savedVolume != null && mounted) {
        setState(() {
          _volume = savedVolume;
          _previousVolume = savedVolume > 0 ? savedVolume : 1.0;
        });
      }
    } catch (e) {
      debugPrint('Error loading volume: $e');
    }
  }

  Future<void> _saveVolume(double volume) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_volumeKey, volume);
    } catch (e) {
      debugPrint('Error saving volume: $e');
    }
  }

  Future<void> _initializeController() async {
    try {
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.setVolume(_volume);

      // Create optimized listener
      _listener = () {
        if (!mounted) return;

        // Only rebuild when playback state changes
        if (_controller.value.isPlaying != _wasPlaying) {
          if (mounted) {
            setState(() {
              _wasPlaying = _controller.value.isPlaying;
            });
          }
        }

        // Only update position display every second to reduce rebuilds
        final currentPosition = _controller.value.position;
        if ((currentPosition - _lastPosition).inSeconds >= 1) {
          if (mounted) {
            setState(() {
              _lastPosition = currentPosition;
            });
          }
        }

        // Auto-hide controls when playing
        if (_controller.value.isPlaying && _showControls) {
          _hideControls();
        }
      };

      _controller.addListener(_listener!);

      if (mounted) {
        setState(() {
          _isInitialized = true;
          if (widget.autoPlay) {
            _controller.play().then((_) {
              _startHideTimer();
            });
          }
        });
      }
    } catch (e) {
      debugPrint('Error initializing video: $e');
      rethrow;
    }
  }

  void _hideControls() {
    if (mounted && _showControls) {
      setState(() {
        _showControls = false;
      });
    }
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    if (!_showControls) {
      return;
    }

    if (mounted) {
      setState(() {
        _showControls = true;
      });
    }

    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        _hideControls();
      }
    });
  }

  void _handleTap() {
    final now = DateTime.now();

    if (_lastTapTime != null &&
        now.difference(_lastTapTime!) < _doubleTapWindow) {
      // This is a double tap - ignore for single tap handler
      return;
    }

    _lastTapTime = now;

    // Delay single tap action to allow double tap detection
    Future.delayed(_doubleTapWindow, () {
      if (_lastTapTime == now) {
        // Still the same tap - execute single tap
        if (mounted) {
          setState(() {
            _showControls = !_showControls;
            if (_showControls && _controller.value.isPlaying) {
              _startHideTimer();
            }
          });
        }
      }
    });
  }

  void _handleDoubleTap(TapDownDetails details) {
    if (!_isInitialized) return;

    final screenWidth = context.size?.width ?? 0;
    final tapPosition = details.globalPosition.dx;
    final currentPosition = _controller.value.position;
    final maxDuration = _controller.value.duration;

    Duration newPosition;

    if (tapPosition < screenWidth / 2) {
      // Double-tap left side: rewind 10 seconds
      newPosition = currentPosition - const Duration(seconds: 10);
      _controller
          .seekTo(newPosition > Duration.zero ? newPosition : Duration.zero);
    } else {
      // Double-tap right side: forward 10 seconds
      newPosition = currentPosition + const Duration(seconds: 10);
      _controller.seekTo(newPosition < maxDuration ? newPosition : maxDuration);
    }

    // Show controls briefly
    if (mounted) {
      setState(() {
        _showControls = true;
      });
    }
    _startHideTimer();
  }

  void _togglePlayPause() {
    if (!_isInitialized) return;

    if (mounted) {
      setState(() {
        if (_controller.value.isPlaying) {
          _controller.pause();
        } else {
          _controller.play().then((_) {
            _startHideTimer();
          });
        }
      });
    }
  }

  void _toggleMute() {
    if (mounted) {
      setState(() {
        if (_volume > 0) {
          _previousVolume = _volume;
          _volume = 0;
        } else {
          _volume = _previousVolume;
        }
        _controller.setVolume(_volume);
      });
      _saveVolume(_volume);
    }
  }

  void _updateVolume(double value) {
    if (mounted) {
      setState(() {
        _volume = value;
        _controller.setVolume(_volume);
      });
      _saveVolume(value);
    }
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });

    if (_isFullscreen) {
      // Enter fullscreen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      // Exit fullscreen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    // Reset system UI on dispose
    if (_isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    _hideTimer?.cancel();

    // Critical: Remove listener to prevent memory leak
    if (_listener != null) {
      _controller.removeListener(_listener!);
    }

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return _buildErrorDisplay(snapshot.error.toString());
              }
              return _buildVideoPlayer();
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFF740F),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return GestureDetector(
      onTap: _handleTap,
      onDoubleTapDown: _handleDoubleTap,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Video player
            VideoPlayer(_controller),

            // Buffering indicator
            if (_controller.value.isBuffering)
              const CircularProgressIndicator(
                color: Color(0xFFFF740F),
                strokeWidth: 3,
              ),

            // Controls overlay
            if (widget.showControls)
              AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: _buildControls(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Stack(
      children: [
        // Play/Pause button overlay
        Positioned.fill(
          child: GestureDetector(
            onTap: _togglePlayPause,
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Bottom controls bar
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Time, sound, and fullscreen controls
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
                  child: Row(
                    children: [
                      // Time display
                      Text(
                        '${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),

                      // Volume controls
                      _buildVolumeControls(),

                      // Fullscreen toggle
                      IconButton(
                        icon: Icon(
                          _isFullscreen
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: _toggleFullscreen,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),

                // Progress bar
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  colors: VideoProgressColors(
                    playedColor: const Color(0xFFFF740F),
                    bufferedColor: Colors.white.withOpacity(0.5),
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVolumeControls() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            _volume == 0
                ? Icons.volume_off
                : _volume < 0.5
                    ? Icons.volume_down
                    : Icons.volume_up,
            color: Colors.white,
            size: 24,
          ),
          onPressed: _toggleMute,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 100,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: const Color(0xFFFF740F),
              inactiveTrackColor: Colors.white.withOpacity(0.2),
              thumbColor: const Color(0xFFFF740F),
            ),
            child: Slider(
              value: _volume,
              min: 0.0,
              max: 1.0,
              onChanged: _updateVolume,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorDisplay(String error) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'Error loading video',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                error,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _initializeVideoPlayerFuture = _initializeController();
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF740F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
