import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_client_chat_with_trainer/app_bar_client_chat_with_trainer_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_chat_with_trainer_model.dart';
export 'client_chat_with_trainer_model.dart';

class ClientChatWithTrainerWidget extends StatefulWidget {
  const ClientChatWithTrainerWidget({
    super.key,
    required this.chatID,
    required this.chatMembers,
  });

  final int? chatID;
  final List<String>? chatMembers;

  static String routeName = 'ClientChatWithTrainer';
  static String routePath = 'clientChatWithTrainer';

  @override
  State<ClientChatWithTrainerWidget> createState() =>
      _ClientChatWithTrainerWidgetState();
}

class _ClientChatWithTrainerWidgetState
    extends State<ClientChatWithTrainerWidget> {
  late ClientChatWithTrainerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientChatWithTrainerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      await actions.markMessagesAsRead(
        widget.chatID!,
        currentUserUid,
      );
      _model.memberDataClient = await UserProfileTable().queryRows(
        queryFn: (q) => q.inFilterOrNull(
          'user_id',
          widget.chatMembers,
        ),
      );
      _model.chatWithTrainer1 = await ChatMessagesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'chat_id',
          widget.chatID,
        ),
      );
      _model.refreshTrigger = true;
      safeSetState(() {});
      await _model.messagesColumnScrollController?.animateTo(
        _model.messagesColumnScrollController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });

    _model.chatReplayTextController ??= TextEditingController();
    _model.chatReplayFocusNode ??= FocusNode();

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
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _model.messagesColumnScrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                45.0, 40.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    FFAppState().chatUserName,
                                    'Нет Имени',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize:
                                            MediaQuery.sizeOf(context).width >=
                                                    360.0
                                                ? 20.0
                                                : 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 0.0),
                            child: StreamBuilder<List<ChatMessagesRow>>(
                              stream: _model.messagesListViewSupabaseStream ??=
                                  SupaFlow.client
                                      .from("chat_messages")
                                      .stream(primaryKey: ['id'])
                                      .eqOrNull(
                                        'chat_id',
                                        widget.chatID,
                                      )
                                      .order('created_at')
                                      .limit(6)
                                      .map((list) => list
                                          .map((item) => ChatMessagesRow(item))
                                          .toList()),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Image.asset(
                                    'assets/images/logo.png',
                                  );
                                }
                                List<ChatMessagesRow>
                                    messagesListViewChatMessagesRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  reverse: true,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: messagesListViewChatMessagesRowList
                                      .length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.0),
                                  itemBuilder:
                                      (context, messagesListViewIndex) {
                                    final messagesListViewChatMessagesRow =
                                        messagesListViewChatMessagesRowList[
                                            messagesListViewIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (messagesListViewChatMessagesRow
                                                .createdbyId ==
                                            currentUserUid) {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 260.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F4F5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 20.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      5.0,
                                                      10.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .memberDataClient
                                                                        ?.where((e) =>
                                                                            messagesListViewChatMessagesRow.createdbyId ==
                                                                            e.userId)
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .memberDataClient
                                                                      ?.where((e) =>
                                                                          messagesListViewChatMessagesRow
                                                                              .createdbyId ==
                                                                          e.userId)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.userName,
                                                                  'Нет имени',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize: MediaQuery.sizeOf(context).width >=
                                                                              360.0
                                                                          ? 12.0
                                                                          : 10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        11.0,
                                                                        9.0,
                                                                        20.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.utczToMoscowTime(
                                                                    messagesListViewChatMessagesRow
                                                                        .createdAt),
                                                                '01.01.2026 01:01',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF959595),
                                                                    fontSize: MediaQuery.sizeOf(context).width >=
                                                                            360.0
                                                                        ? 10.0
                                                                        : 8.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        37.0,
                                                                        0.0,
                                                                        9.0,
                                                                        13.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    messagesListViewChatMessagesRow
                                                                        .chatText,
                                                                    'Нет текста',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 14.0
                                                                            : 12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              width: 260.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF7F1FF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 20.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      5.0,
                                                      10.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .memberDataClient
                                                                        ?.where((e) =>
                                                                            messagesListViewChatMessagesRow.createdbyId ==
                                                                            e.userId)
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .memberDataClient
                                                                      ?.where((e) =>
                                                                          messagesListViewChatMessagesRow
                                                                              .createdbyId ==
                                                                          e.userId)
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.userName,
                                                                  'Нет имени',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize: MediaQuery.sizeOf(context).width >=
                                                                              360.0
                                                                          ? 12.0
                                                                          : 10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        11.0,
                                                                        9.0,
                                                                        20.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.utczToMoscowTime(
                                                                    messagesListViewChatMessagesRow
                                                                        .createdAt),
                                                                '01.01.2026 01:01',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF959595),
                                                                    fontSize: MediaQuery.sizeOf(context).width >=
                                                                            360.0
                                                                        ? 10.0
                                                                        : 8.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        37.0,
                                                                        0.0,
                                                                        9.0,
                                                                        13.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    messagesListViewChatMessagesRow
                                                                        .chatText,
                                                                    'Нет текста',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 14.0
                                                                            : 12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  controller:
                                      _model.messagesListViewScrollController,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.chatReplayTextController,
                                  focusNode: _model.chatReplayFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Сообщение...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .chatReplayTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  if (_model.chatReplayTextController.text !=
                                          '') {
                                    _model.newMessageClient =
                                        await ChatMessagesTable().insert({
                                      'chat_id': widget.chatID,
                                      'chat_text':
                                          _model.chatReplayTextController.text,
                                      'createdby_id': currentUserUid,
                                      'recipient_id': widget.chatMembers
                                          ?.where((e) => currentUserUid != e)
                                          .toList()
                                          .firstOrNull,
                                      'message_read': false,
                                    });
                                    _shouldSetState = true;
                                    // Last Message in Chats
                                    await ChatsTable().update(
                                      data: {
                                        'last_message': _model
                                            .chatReplayTextController.text,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget.chatID,
                                      ),
                                    );
                                    safeSetState(() {
                                      _model.chatReplayTextController?.clear();
                                    });
                                    _model.chatWithTrainer2 =
                                        await ChatMessagesTable().queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'chat_id',
                                        widget.chatID,
                                      ),
                                    );
                                    _shouldSetState = true;
                                    await actions.hideKeyboard();
                                    // NOTIFICATION
                                    await NotificationsTable().insert({
                                      'user_id': widget.chatMembers
                                          ?.where((e) => currentUserUid != e)
                                          .toList()
                                          .firstOrNull,
                                      'title': 'Чаты',
                                      'body': 'У вас новое сообщение.',
                                    });
                                    await _model.messagesColumnScrollController
                                        ?.animateTo(
                                      _model.messagesColumnScrollController!
                                          .position.maxScrollExtent,
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.ease,
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('А где сообщение ?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Закрыть'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                child: Container(
                                  width: 36.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF7B43CE),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.ksend,
                                    color: Colors.white,
                                    size: 19.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                model: _model.appBarClientChatWithTrainerModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarClientChatWithTrainerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
