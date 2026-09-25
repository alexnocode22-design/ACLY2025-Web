import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_chats_widget.dart';
import '/components_client/app_bar_client_chat/app_bar_client_chat_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_chats_model.dart';
export 'client_chats_model.dart';

class ClientChatsWidget extends StatefulWidget {
  const ClientChatsWidget({
    super.key,
    String? userID,
  }) : this.userID = userID ?? '';

  final String userID;

  static String routeName = 'ClientChats';
  static String routePath = 'clientChats';

  @override
  State<ClientChatsWidget> createState() => _ClientChatsWidgetState();
}

class _ClientChatsWidgetState extends State<ClientChatsWidget> {
  late ClientChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientChatsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      _model.checkUnreadMessagesChats = await ChatMessagesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'recipient_id',
              currentUserUid,
            )
            .eqOrNull(
              'message_read',
              false,
            ),
      );
      if (_model.checkUnreadMessagesChats!.length < 1) {
        FFAppState().unreadChatMessages = false;
        safeSetState(() {});
        return;
      } else {
        FFAppState().unreadChatMessages = true;
        safeSetState(() {});
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF9F5),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                    child: FutureBuilder<List<ChatsRow>>(
                      future: ChatsTable().queryRows(
                        queryFn: (q) => q
                            .containsOrNull(
                              'chat_members',
                              '{${currentUserUid}}',
                            )
                            .order('last_message_time'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          );
                        }
                        List<ChatsRow> chatListViewChatsRowList =
                            snapshot.data!;

                        if (chatListViewChatsRowList.isEmpty) {
                          return NoChatsWidget();
                        }

                        return ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: chatListViewChatsRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, chatListViewIndex) {
                            final chatListViewChatsRow =
                                chatListViewChatsRowList[chatListViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 13.0, 16.0, 0.0),
                              child: FutureBuilder<List<UserProfileRow>>(
                                future: UserProfileTable().querySingleRow(
                                  queryFn: (q) => q
                                      .neqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      )
                                      .inFilterOrNull(
                                        'user_id',
                                        chatListViewChatsRow.chatMembers,
                                      ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                      ),
                                    );
                                  }
                                  List<UserProfileRow>
                                      chatContainerUserProfileRowList =
                                      snapshot.data!;

                                  final chatContainerUserProfileRow =
                                      chatContainerUserProfileRowList.isNotEmpty
                                          ? chatContainerUserProfileRowList
                                              .first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 13.0, 5.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      chatContainerUserProfileRow
                                                          ?.userPhoto,
                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                    ),
                                                    width: 35.0,
                                                    height: 35.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      chatContainerUserProfileRow
                                                          ?.userName,
                                                      'Нет имени',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  53.0, 8.0, 14.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              chatListViewChatsRow.lastMessage,
                                              'Нет текста',
                                            ).maybeHandleOverflow(
                                              maxChars: 40,
                                              replacement: '…',
                                            ),
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF2C2C2C),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 14.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    functions.utczToMoscowTime(
                                                        chatListViewChatsRow
                                                            .lastMessageTime),
                                                    '01:01',
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF2C2C2C),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    53.0, 0.0, 0.0, 19.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().chatUserName =
                                                    chatContainerUserProfileRow!
                                                        .userName!;

                                                context.pushNamed(
                                                  ClientChatWithTrainerWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'chatID': serializeParam(
                                                      chatListViewChatsRow.id,
                                                      ParamType.int,
                                                    ),
                                                    'chatMembers':
                                                        serializeParam(
                                                      chatListViewChatsRow
                                                          .chatMembers,
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: 130.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF7B43CE),
                                                      Color(0xFFFF740F)
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.69, -1.0),
                                                    end: AlignmentDirectional(
                                                        -0.69, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/messages-2.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Ответить',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width >=
                                                                    360.0
                                                                ? 12.0
                                                                : 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.tapBarClientModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TapBarClientWidget(),
                  ),
                ),
              wrapWithModel(
                model: _model.appBarClientChatModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarClientChatWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
