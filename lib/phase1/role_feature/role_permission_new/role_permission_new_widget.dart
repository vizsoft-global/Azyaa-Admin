import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/role_feature/role_switch/role_switch_widget.dart';
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'role_permission_new_model.dart';
export 'role_permission_new_model.dart';

class RolePermissionNewWidget extends StatefulWidget {
  const RolePermissionNewWidget({
    super.key,
    required this.role,
  });

  final DocumentReference? role;

  static String routeName = 'Role-PermissionNew';
  static String routePath = '/azyaa-permissions';

  @override
  State<RolePermissionNewWidget> createState() =>
      _RolePermissionNewWidgetState();
}

class _RolePermissionNewWidgetState extends State<RolePermissionNewWidget> {
  late RolePermissionNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RolePermissionNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
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

    return Title(
        title: 'Role-PermissionNew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).background,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<RolesRecord>(
                            stream: RolesRecord.getDocument(widget.role!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 2.0,
                                    height: 2.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final rowRolesRecord = snapshot.data!;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.azyaaSidebarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: AzyaaSidebarWidget(
                                      menuname: 'UserRole',
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: StreamBuilder<
                                          List<PermissionsRecord>>(
                                        stream: queryPermissionsRecord(
                                          queryBuilder: (permissionsRecord) =>
                                              permissionsRecord
                                                  .orderBy('permission_id'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<PermissionsRecord>
                                              customerPermissionsRecordList =
                                              snapshot.data!;

                                          return Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .backgroundpage,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: Color(0xFFE6E7EB),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .safePop();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_back,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0p31pm1x' /* Permissions */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .theme
                                                                            .themeMain
                                                                            .primary,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .notificatioAlertModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            NotificatioAlertWidget(),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 8.0))
                                                        .addToEnd(SizedBox(
                                                            width: 12.0)),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 0.0,
                                                                14.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                        ),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${rowRolesRecord.roleInfo.name}${FFLocalizations.of(context).getVariableText(
                                                                        enText:
                                                                            ' Access',
                                                                        arText:
                                                                            'وصول',
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              12.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final permisionList = customerPermissionsRecordList
                                                                          .where((e) =>
                                                                              e.parentId <
                                                                              1000)
                                                                          .toList();

                                                                      return Wrap(
                                                                        spacing:
                                                                            8.0,
                                                                        runSpacing:
                                                                            16.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: List.generate(
                                                                            permisionList.length,
                                                                            (permisionListIndex) {
                                                                          final permisionListItem =
                                                                              permisionList[permisionListIndex];
                                                                          return Stack(
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width >= 1200.0 ? 360.0 : 300.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: RoleSwitchWidget(
                                                                                  key: Key('Keyc5o_${permisionListIndex}_of_${permisionList.length}'),
                                                                                  permission: permisionListItem,
                                                                                  role: rowRolesRecord,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width >= 1200.0 ? 308.0 : 250.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  color: Color(0x00000000),
                                                                                  child: ExpandableNotifier(
                                                                                    initialExpanded: false,
                                                                                    child: ExpandablePanel(
                                                                                      header: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'r8okvwdn' /*   */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      collapsed: Container(),
                                                                                      expanded: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                                            0.0,
                                                                                            valueOrDefault<double>(
                                                                                              MediaQuery.sizeOf(context).width >= 1200.0 ? 24.0 : 48.0,
                                                                                              0.0,
                                                                                            ),
                                                                                            0.0,
                                                                                            0.0),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final actionList = customerPermissionsRecordList.where((e) => e.parentId == permisionListItem.permissionId).toList();

                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: List.generate(actionList.length, (actionListIndex) {
                                                                                                final actionListItem = actionList[actionListIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: RoleSwitchWidget(
                                                                                                    key: Key('Keyptx_${actionListIndex}_of_${actionList.length}'),
                                                                                                    permission: actionListItem,
                                                                                                    role: rowRolesRecord,
                                                                                                  ),
                                                                                                );
                                                                                              }).divide(SizedBox(height: 12.0)),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      theme: ExpandableThemeData(
                                                                                        tapHeaderToExpand: true,
                                                                                        tapBodyToExpand: false,
                                                                                        tapBodyToCollapse: false,
                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                        hasIcon: true,
                                                                                        expandIcon: Icons.keyboard_arrow_down,
                                                                                        collapseIcon: Icons.keyboard_arrow_up,
                                                                                        iconSize: 34.0,
                                                                                        iconColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 36.0, 0.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .addToStart(
                                                      SizedBox(height: 16.0))
                                                  .addToEnd(
                                                      SizedBox(height: 16.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
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
                    wrapWithModel(
                      model: _model.azyaaResponsiveModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AzyaaResponsiveWidget(),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
