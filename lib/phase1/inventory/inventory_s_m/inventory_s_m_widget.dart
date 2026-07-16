import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/inventory/enquiry/enquiry_widget.dart';
import '/phase1/inventory/enquiry_view/enquiry_view_widget.dart';
import '/phase1/inventory/new_request_add/new_request_add_widget.dart';
import '/phase1/inventory/request_accept/request_accept_widget.dart';
import '/phase1/inventory/request_popup_option/request_popup_option_widget.dart';
import '/phase1/inventory/timeline_for_inventory/timeline_for_inventory_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'inventory_s_m_model.dart';
export 'inventory_s_m_model.dart';

class InventorySMWidget extends StatefulWidget {
  const InventorySMWidget({super.key});

  static String routeName = 'Inventory-SM';
  static String routePath = '/azyaa-inventory-sm';

  @override
  State<InventorySMWidget> createState() => _InventorySMWidgetState();
}

class _InventorySMWidgetState extends State<InventorySMWidget> {
  late InventorySMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventorySMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
      }
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

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
        title: 'Inventory-SM',
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.azyaaSidebarModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: AzyaaSidebarWidget(
                                  menuname: 'Stock Management',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<
                                      List<InventorymovementlogRecord>>(
                                    stream: queryInventorymovementlogRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<InventorymovementlogRecord>
                                          inventorInventorymovementlogRecordList =
                                          snapshot.data!;

                                      return Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundpage,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Color(0xFFE6E7EB),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.safePop();
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
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
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
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'n2kx137a' /* Stock Management */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState()
                                                                    .theme
                                                                    .themeMain
                                                                    .primary,
                                                                fontSize: 20.0,
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
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3gh3aimx' /* Export */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFE3E3E3),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qynmxkwu' /* Import */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFE3E3E3),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        await showDialog(
                                                          barrierColor:
                                                              Color(0x7B000000),
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        600.0,
                                                                    child:
                                                                        NewRequestAddWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'x8sz1j1p' /* Add New Request */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FFAppState()
                                                            .theme
                                                            .themeMain
                                                            .primaryButtoncolor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FFAppState()
                                                                      .theme
                                                                      .themeMain
                                                                      .primaryButtonTextColor,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FFAppState()
                                                              .theme
                                                              .themeMain
                                                              .primaryButtonBorder!,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
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
                                                    .divide(
                                                        SizedBox(width: 8.0))
                                                    .addToEnd(
                                                        SizedBox(width: 12.0)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'uef66x44' /* Pending */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '21s0z92q' /* Accepted */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '84xdtupd' /* Declined */,
                                                                )),
                                                                ChipData(FFAppState()
                                                                            .currentUserRoleKey ==
                                                                        'super_admin'
                                                                    ? FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                        enText:
                                                                            'Archived',
                                                                        arText:
                                                                            'مؤرشف',
                                                                      )
                                                                    : '')
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.choiceChipsValue =
                                                                          val?.firstOrNull),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          12.0,
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
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                iconSize: 0.0,
                                                                labelPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
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
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                iconSize: 0.0,
                                                                labelPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              chipSpacing: 8.0,
                                                              rowSpacing: 8.0,
                                                              multiselect:
                                                                  false,
                                                              initialized: _model
                                                                      .choiceChipsValue !=
                                                                  null,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'v775mn0w' /* Pending */,
                                                                  )
                                                                ],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 180.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child: SwitchListTile
                                                                        .adaptive(
                                                                      value: _model
                                                                              .switchListTileValue ??=
                                                                          true,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        safeSetState(() =>
                                                                            _model.switchListTileValue =
                                                                                newValue);
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'wvxfzqxr' /* Auto-Approval */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      activeTrackColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      dense:
                                                                          true,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .trailing,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 200.0,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .searchTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .searchFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'hyh9y2q9' /* Search... */,
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).border,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).border,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      suffixIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .ksearch,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .searchTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .buttonBorder,
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                icon: Icon(
                                                                  Icons
                                                                      .format_list_bulleted,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (_model
                                                                          .styleName ==
                                                                      'List') {
                                                                    _model.styleName =
                                                                        'Grid';
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.styleName =
                                                                        'List';
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                        ),
                                                      ),
                                                      if ((FFAppState()
                                                                  .currentUserRoleKey ==
                                                              'super_admin') &&
                                                          ((_model.choiceChipsValue ==
                                                                  'Pending') ||
                                                              (_model.choiceChipsValue ==
                                                                  'Declined') ||
                                                              (_model.choiceChipsValue ==
                                                                  'Archived') ||
                                                              (_model.choiceChipsValue ==
                                                                  'قيد الانتظار') ||
                                                              (_model.choiceChipsValue ==
                                                                  'انخفض') ||
                                                              (_model.choiceChipsValue ==
                                                                  'مؤرشف')))
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: (FFAppState()
                                                                          .currentUserRoleKey ==
                                                                      'super_admin') &&
                                                                  ((_model.choiceChipsValue == 'Pending') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'Declined') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'Archived') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'قيد الانتظار') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'انخفض') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'مؤرشف')),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final inventorymovemt =
                                                                      inventorInventorymovementlogRecordList
                                                                          .where((e) =>
                                                                              () {
                                                                                if ((_model.choiceChipsValue == 'Pending') || (_model.choiceChipsValue == 'قيد الانتظار')) {
                                                                                  return (e.requestInfo.requestStatus == 'Pending');
                                                                                } else if ((_model.choiceChipsValue == 'Archived') || (_model.choiceChipsValue == 'مؤرشف')) {
                                                                                  return ((e.requestInfo.requestStatus == 'Cancelled') || (e.enquiryInfo.status == 'Cancelled'));
                                                                                } else {
                                                                                  return (e.requestInfo.requestStatus == 'Declined');
                                                                                }
                                                                              }())
                                                                          .toList();
                                                                  if (inventorymovemt
                                                                      .isEmpty) {
                                                                    return EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'c3kc8qqj' /* Stock updates are pending! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'b2ccjhmu' /* Items listed here are waiting ... */,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return FlutterFlowDataTable<
                                                                      InventorymovementlogRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController1,
                                                                    data:
                                                                        inventorymovemt,
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 50.0,
                                                                                decoration: BoxDecoration(),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'jsa8v7o0' /* Product */,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        fixedWidth:
                                                                            180.0,
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'cazaecr9' /* Product ID */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '44osj931' /* Qty */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ib2j8t72' /* Request Type */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.1
                                                                                : 0.1),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'eax0y1am' /* Request Date */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'gezuneik' /* Status */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'rifpnejr' /* Pref. ETA */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'fuiafn9w' /*   */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    dataRowBuilder: (inventorymovemtItem,
                                                                            inventorymovemtIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      cells: [
                                                                        StreamBuilder<
                                                                            ProductsRecord>(
                                                                          stream:
                                                                              ProductsRecord.getDocument(inventorymovemtItem.productRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final rowProductsRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      getCORSProxyUrl(
                                                                                        rowProductsRecord.productInfo.galleryImage.firstOrNull!,
                                                                                      ),
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          FFLocalizations.of(context).getVariableText(
                                                                                            enText: () {
                                                                                              if (rowProductsRecord.productInfoCustomTranslate.name.en != '') {
                                                                                                return rowProductsRecord.productInfoCustomTranslate.name.en;
                                                                                              } else if (rowProductsRecord.productInfoTranslate.name.en != '') {
                                                                                                return rowProductsRecord.productInfoTranslate.name.en;
                                                                                              } else {
                                                                                                return rowProductsRecord.productInfo.name;
                                                                                              }
                                                                                            }(),
                                                                                            arText: () {
                                                                                              if (rowProductsRecord.productInfoCustomTranslate.name.ar != '') {
                                                                                                return rowProductsRecord.productInfoCustomTranslate.name.ar;
                                                                                              } else if (rowProductsRecord.productInfoTranslate.name.ar != '') {
                                                                                                return rowProductsRecord.productInfoTranslate.name.ar;
                                                                                              } else {
                                                                                                return rowProductsRecord.productInfo.name;
                                                                                              }
                                                                                            }(),
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                lineHeight: 1.5,
                                                                                              ),
                                                                                        )),
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                          desktop: false,
                                                                                        ))
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).background,
                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ne9ldzb2' /* White / XS  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            );
                                                                          },
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          inventorymovemtItem
                                                                              .productId,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Text(
                                                                          inventorymovemtItem
                                                                              .productQuantity
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          inventorymovemtItem
                                                                              .requestInfo
                                                                              .requestType,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            inventorymovemtItem.createdAt!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                () {
                                                                              if (inventorymovemtItem.requestInfo.requestStatus == 'Pending') {
                                                                                return Color(0x1AB6BA30);
                                                                              } else if (inventorymovemtItem.requestInfo.requestStatus == 'Declined') {
                                                                                return FlutterFlowTheme.of(context).azyaaDeclineBG;
                                                                              } else {
                                                                                return FlutterFlowTheme.of(context).azyaaDeclineBG;
                                                                              }
                                                                            }(),
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                2.0,
                                                                                12.0,
                                                                                2.0),
                                                                            child: SelectionArea(
                                                                                child: Text(
                                                                              inventorymovemtItem.requestInfo.requestStatus,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: () {
                                                                                      if (inventorymovemtItem.requestInfo.requestStatus == 'Pending') {
                                                                                        return Color(0xFFB6BA30);
                                                                                      } else if (inventorymovemtItem.requestInfo.requestStatus == 'Declined') {
                                                                                        return FlutterFlowTheme.of(context).azyaaDecline;
                                                                                      } else {
                                                                                        return FlutterFlowTheme.of(context).azyaaDecline;
                                                                                      }
                                                                                    }(),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            )),
                                                                          ),
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            inventorymovemtItem.requestInfo.adminPreferredDate!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Visibility(
                                                                          visible:
                                                                              (_model.choiceChipsValue == 'Pending') || (_model.choiceChipsValue == 'قيد الانتظار'),
                                                                          child:
                                                                              Builder(
                                                                            builder: (context) =>
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showAlignedDialog(
                                                                                  barrierColor: Color(0x7B000000),
                                                                                  context: context,
                                                                                  isGlobal: false,
                                                                                  avoidOverflow: false,
                                                                                  targetAnchor: AlignmentDirectional(-10.0, 6.0).resolve(Directionality.of(context)),
                                                                                  followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  builder: (dialogContext) {
                                                                                    return Material(
                                                                                      color: Colors.transparent,
                                                                                      child: WebViewAware(
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: RequestPopupOptionWidget(
                                                                                            invMovementDoc: inventorymovemtItem,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.more_vert,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ]
                                                                          .map((c) =>
                                                                              DataCell(c))
                                                                          .toList(),
                                                                    ),
                                                                    emptyBuilder:
                                                                        () =>
                                                                            EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'c3kc8qqj' /* Stock updates are pending! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'b2ccjhmu' /* Items listed here are waiting ... */,
                                                                      ),
                                                                    ),
                                                                    paginated:
                                                                        true,
                                                                    selectable:
                                                                        false,
                                                                    hidePaginator:
                                                                        false,
                                                                    showFirstLastButtons:
                                                                        true,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    headingRowHeight:
                                                                        40.0,
                                                                    dataRowHeight:
                                                                        60.0,
                                                                    columnSpacing:
                                                                        16.0,
                                                                    headingRowColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    addHorizontalDivider:
                                                                        true,
                                                                    addTopAndBottomDivider:
                                                                        true,
                                                                    hideDefaultHorizontalDivider:
                                                                        false,
                                                                    horizontalDividerColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .border,
                                                                    horizontalDividerThickness:
                                                                        1.0,
                                                                    addVerticalDivider:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if ((FFAppState()
                                                                  .currentUserRoleKey ==
                                                              'super_admin') &&
                                                          ((FFAppState()
                                                                      .currentUserRoleKey ==
                                                                  'super_admin') &&
                                                              ((_model.choiceChipsValue ==
                                                                      'Accepted') ||
                                                                  (_model.choiceChipsValue ==
                                                                      'مقبول'))))
                                                        Expanded(
                                                          child: StreamBuilder<
                                                              List<
                                                                  DeliveryRecord>>(
                                                            stream:
                                                                queryDeliveryRecord(
                                                              queryBuilder:
                                                                  (deliveryRecord) =>
                                                                      deliveryRecord
                                                                          .where(
                                                                'type',
                                                                isEqualTo:
                                                                    'inventory',
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
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
                                                              List<DeliveryRecord>
                                                                  acceptedSuperadminDeliveryRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                                                                    Visibility(
                                                                  visible: (FFAppState()
                                                                              .currentUserRoleKey ==
                                                                          'super_admin') &&
                                                                      ((_model.choiceChipsValue ==
                                                                              'Accepted') ||
                                                                          (_model.choiceChipsValue ==
                                                                              'مقبول')),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final movementList = inventorInventorymovementlogRecordList
                                                                          .where((e) =>
                                                                              e.requestInfo.requestStatus ==
                                                                              'Accepted')
                                                                          .toList()
                                                                          .map((e) =>
                                                                              e)
                                                                          .toList();
                                                                      if (movementList
                                                                          .isEmpty) {
                                                                        return EmptyWidget(
                                                                          messageOne:
                                                                              FFLocalizations.of(context).getText(
                                                                            'mjezb56x' /* Looks like an empty space */,
                                                                          ),
                                                                          messageTwo:
                                                                              FFLocalizations.of(context).getText(
                                                                            'u4zc0sy3' /* These items are now live and r... */,
                                                                          ),
                                                                        );
                                                                      }

                                                                      return FlutterFlowDataTable<
                                                                          InventorymovementlogRecord>(
                                                                        controller:
                                                                            _model.paginatedDataTableController2,
                                                                        data:
                                                                            movementList,
                                                                        columnsBuilder:
                                                                            (onSortChanged) =>
                                                                                [
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 50.0,
                                                                                    decoration: BoxDecoration(),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      's44b58fd' /* Product */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF616161),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 16.0)),
                                                                              ),
                                                                            ),
                                                                            fixedWidth:
                                                                                160.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'oc9fxggj' /* SKU */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '06rjbrre' /* Qty */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'pdtvkhdl' /* Request Type */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'f7tej9qj' /* Status */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'qabbyjn5' /* Pref. ETA */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ojku1uuo' /*  Des. ETA */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'dm9c0gr7' /* Fulfill Status */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            fixedWidth:
                                                                                100.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'zj13oxwa' /*   */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            fixedWidth:
                                                                                250.0,
                                                                          ),
                                                                        ],
                                                                        dataRowBuilder: (movementListItem,
                                                                                movementListIndex,
                                                                                selected,
                                                                                onSelectChanged) =>
                                                                            DataRow(
                                                                          cells:
                                                                              [
                                                                            StreamBuilder<ProductsRecord>(
                                                                              stream: ProductsRecord.getDocument(movementListItem.productRef!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }

                                                                                final rowProductsRecord = snapshot.data!;

                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 50.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          getCORSProxyUrl(
                                                                                            rowProductsRecord.productInfo.galleryImage.firstOrNull!,
                                                                                          ),
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              FFLocalizations.of(context).getVariableText(
                                                                                                enText: () {
                                                                                                  if (rowProductsRecord.productInfoCustomTranslate.name.en != '') {
                                                                                                    return rowProductsRecord.productInfoCustomTranslate.name.en;
                                                                                                  } else if (rowProductsRecord.productInfoTranslate.name.en != '') {
                                                                                                    return rowProductsRecord.productInfoTranslate.name.en;
                                                                                                  } else {
                                                                                                    return rowProductsRecord.productInfo.name;
                                                                                                  }
                                                                                                }(),
                                                                                                arText: () {
                                                                                                  if (rowProductsRecord.productInfoCustomTranslate.name.ar != '') {
                                                                                                    return rowProductsRecord.productInfoCustomTranslate.name.ar;
                                                                                                  } else if (rowProductsRecord.productInfoTranslate.name.ar != '') {
                                                                                                    return rowProductsRecord.productInfoTranslate.name.ar;
                                                                                                  } else {
                                                                                                    return rowProductsRecord.productInfo.name;
                                                                                                  }
                                                                                                }(),
                                                                                              ),
                                                                                              maxLines: 2,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            )),
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                              desktop: false,
                                                                                            ))
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).background,
                                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'i8j7uuuq' /* White / XS  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ].divide(SizedBox(height: 6.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              movementListItem.productId,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            )),
                                                                            Text(
                                                                              movementListItem.enquiryInfo.enquiryId != '' ? '${movementListItem.productQuantity.toString()} (${movementListItem.enquiryInfo.affectedQuanity.toString()})' : movementListItem.productQuantity.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              movementListItem.enquiryInfo.enquiryId != '' ? '${movementListItem.requestInfo.requestType} (Enquiry)' : movementListItem.requestInfo.requestType,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            )),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x20067647),
                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 10.0, 4.0),
                                                                                child: SelectionArea(
                                                                                    child: Text(
                                                                                  () {
                                                                                    if (movementListItem.enquiryInfo.fulfillStatus == 'Received') {
                                                                                      return 'Enquiry Closed';
                                                                                    } else if (movementListItem.enquiryInfo.enquiryId != '') {
                                                                                      return 'Enquiry';
                                                                                    } else if (movementListItem.requestInfo.fulfillStatus == 'Received') {
                                                                                      return 'Received';
                                                                                    } else {
                                                                                      return movementListItem.requestInfo.requestStatus;
                                                                                    }
                                                                                  }(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF067647),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                )),
                                                                              ),
                                                                            ),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              dateTimeFormat(
                                                                                "yMMMd",
                                                                                movementListItem.requestInfo.adminPreferredDate!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            )),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              dateTimeFormat(
                                                                                "yMMMd",
                                                                                movementListItem.requestInfo.designerPreferredNotes!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            )),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    if (movementListItem.enquiryInfo.enquiryId == '')
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              () {
                                                                                                if (movementListItem.requestInfo.fulfillStatus == 'DeliveryPartnerAssigned') {
                                                                                                  return 'Shipping';
                                                                                                } else if (movementListItem.requestInfo.fulfillStatus == 'Cancelled') {
                                                                                                  return 'Cancelled';
                                                                                                } else {
                                                                                                  return movementListItem.requestInfo.fulfillStatus;
                                                                                                }
                                                                                              }(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: () {
                                                                                                      if (movementListItem.requestInfo.fulfillStatus == 'Processing') {
                                                                                                        return FlutterFlowTheme.of(context).azyaaProcessing;
                                                                                                      } else if (movementListItem.requestInfo.fulfillStatus == 'Ready to pickup') {
                                                                                                        return FlutterFlowTheme.of(context).azyaaAccepted;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).tertiary;
                                                                                                      }
                                                                                                    }(),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          if ((movementListItem.requestInfo.fulfillStatus == 'DeliveryPartnerAssigned') || (movementListItem.requestInfo.fulfillStatus == 'Received') || ((movementListItem.requestDeliveryInfo.deliveryRef != null) && (movementListItem.requestInfo.fulfillStatus == 'Cancelled')))
                                                                                            Builder(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  _model.logisticsResponseDoc = await queryLogisticsResponseRecordOnce(
                                                                                                    queryBuilder: (logisticsResponseRecord) => logisticsResponseRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: movementListItem.requestDeliveryInfo.deliveryId,
                                                                                                    ),
                                                                                                    singleRecord: true,
                                                                                                  ).then((s) => s.firstOrNull);
                                                                                                  await showAlignedDialog(
                                                                                                    barrierColor: Color(0x7B000000),
                                                                                                    context: context,
                                                                                                    isGlobal: false,
                                                                                                    avoidOverflow: false,
                                                                                                    targetAnchor: AlignmentDirectional(-20.0, 13.0).resolve(Directionality.of(context)),
                                                                                                    followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    builder: (dialogContext) {
                                                                                                      return Material(
                                                                                                        color: Colors.transparent,
                                                                                                        child: WebViewAware(
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: 300.0,
                                                                                                              child: TimelineForInventoryWidget(
                                                                                                                logisticsDoc: _model.logisticsResponseDoc!,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  FFIcons.kpickup,
                                                                                                  color: FFAppState().theme.themeMain.primaryText,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                      ),
                                                                                    if (movementListItem.enquiryInfo.enquiryId != '')
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (movementListItem.enquiryInfo.enquiryId != '')
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                () {
                                                                                                  if (movementListItem.enquiryInfo.fulfillStatus == 'DeliveryPartnerAssigned') {
                                                                                                    return 'Enquiry Shipping';
                                                                                                  } else if (movementListItem.enquiryInfo.fulfillStatus == 'Received') {
                                                                                                    return 'Enquiry Closed';
                                                                                                  } else {
                                                                                                    return movementListItem.enquiryInfo.fulfillStatus;
                                                                                                  }
                                                                                                }(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((movementListItem.enquiryInfo.fulfillStatus == 'DeliveryPartnerAssigned') || (movementListItem.enquiryInfo.fulfillStatus == 'Received') || ((movementListItem.enquiryDeliveryInfo.deliveryRef != null) && (movementListItem.enquiryInfo.fulfillStatus == 'Cancelled')))
                                                                                            Builder(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  _model.logisticsResponseenquiryDoc = await queryLogisticsResponseRecordOnce(
                                                                                                    queryBuilder: (logisticsResponseRecord) => logisticsResponseRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: movementListItem.enquiryDeliveryInfo.deliveryId,
                                                                                                    ),
                                                                                                    singleRecord: true,
                                                                                                  ).then((s) => s.firstOrNull);
                                                                                                  await showDialog(
                                                                                                    barrierColor: Color(0x7B000000),
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                        child: WebViewAware(
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: 300.0,
                                                                                                              child: TimelineForInventoryWidget(
                                                                                                                logisticsDoc: _model.logisticsResponseenquiryDoc!,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  FFIcons.kpickup,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (movementListItem.requestInfo.fulfillStatus == 'DeliveryPartnerAssigned')
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                      enText: 'Did you recevie products?',
                                                                                                      arText: 'هل استلمت المنتجات؟',
                                                                                                    )),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Cancel',
                                                                                                          arText: 'يلغي',
                                                                                                        )),
                                                                                                      ),
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Confirm',
                                                                                                          arText: 'يتأكد',
                                                                                                        )),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          await movementListItem.reference.update(createInventorymovementlogRecordData(
                                                                                            updateAt: getCurrentTimestamp,
                                                                                            requestInfo: createInventoryRequestInfoStruct(
                                                                                              fulfillStatus: 'Received',
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));

                                                                                          await movementListItem.inventoryRef!.update({
                                                                                            ...createInventoryRecordData(
                                                                                              updatedAt: getCurrentTimestamp,
                                                                                            ),
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'stock_on_hand': FieldValue.increment(movementListItem.productQuantity),
                                                                                                'stock': FieldValue.increment(movementListItem.productQuantity),
                                                                                                'restock_request_raised_ref': FieldValue.delete(),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          return;
                                                                                        }
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '3pqkrv3w' /* Received  */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: Color(0xFF29845A),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF29845A),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  if (movementListItem.requestInfo.fulfillStatus == 'Ready to pickup')
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          InventoryShippingLabelWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'invmovemntRef': serializeParam(
                                                                                              movementListItem.reference,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'type': serializeParam(
                                                                                              'restock',
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '9ov4m9sf' /* Create Pickup Request */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  if (movementListItem.requestInfo.fulfillStatus != 'Received')
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        var _shouldSetState = false;
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                      enText: 'Are you sure you want to cancel request?',
                                                                                                      arText: 'هل أنت متأكد أنك تريد إلغاء الطلب؟',
                                                                                                    )),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Cancel',
                                                                                                          arText: 'يلغي',
                                                                                                        )),
                                                                                                      ),
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Confirm',
                                                                                                          arText: 'يتأكد',
                                                                                                        )),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          if (movementListItem.requestDeliveryInfo.deliveryRef != null) {
                                                                                            _model.settingRCancelDoc = await querySettingsRecordOnce(
                                                                                              queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                'type',
                                                                                                isEqualTo: 'Company',
                                                                                              ),
                                                                                              singleRecord: true,
                                                                                            ).then((s) => s.firstOrNull);
                                                                                            _shouldSetState = true;
                                                                                            if ((_model.settingRCancelDoc?.settingsLogisticsInfo.environment != 'test') && (getCurrentTimestamp >= _model.settingRCancelDoc!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                                              _model.getAccessKeyCanReq = await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                                                env: 'prod',
                                                                                                clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                                                clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                                                url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                                              );

                                                                                              _shouldSetState = true;
                                                                                              if ((_model.getAccessKeyCanReq?.succeeded ?? true)) {
                                                                                                await _model.settingRCancelDoc!.reference.update(createSettingsRecordData(
                                                                                                  settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                                    prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                                      (_model.getAccessKeyCanReq?.jsonBody ?? ''),
                                                                                                    ),
                                                                                                    prodKeyValidTime: functions.addHours(getCurrentTimestamp, 5),
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                              } else {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return WebViewAware(
                                                                                                      child: AlertDialog(
                                                                                                        content: Text('Logistics server busy try again later'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                            child: Text('Ok'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }
                                                                                            _model.settingsupdatedCanReq = await querySettingsRecordOnce(
                                                                                              queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                'type',
                                                                                                isEqualTo: 'Company',
                                                                                              ),
                                                                                              singleRecord: true,
                                                                                            ).then((s) => s.firstOrNull);
                                                                                            _shouldSetState = true;
                                                                                            _model.apiResultRCancel = await PrimeExpressDeliveryGroup.cancelDeliveryCall.call(
                                                                                              trackID: acceptedSuperadminDeliveryRecordList.where((e) => e.reference == movementListItem.requestDeliveryInfo.deliveryRef).toList().firstOrNull?.deliveryTrackingId,
                                                                                              env: _model.settingsupdatedCanReq?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'pord',
                                                                                              key: _model.settingsupdatedCanReq?.settingsLogisticsInfo.environment == 'test' ? _model.settingsupdatedCanReq?.settingsLogisticsInfo.testKey : _model.settingsupdatedCanReq?.settingsLogisticsInfo.prodKey,
                                                                                              url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                                            );

                                                                                            _shouldSetState = true;
                                                                                            if ((_model.apiResultRCancel?.succeeded ?? true)) {
                                                                                              await movementListItem.reference.update(createInventorymovementlogRecordData(
                                                                                                updateAt: getCurrentTimestamp,
                                                                                                requestInfo: createInventoryRequestInfoStruct(
                                                                                                  fulfillStatus: 'Cancelled',
                                                                                                  requestStatus: 'Cancelled',
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));

                                                                                              await movementListItem.inventoryRef!.update({
                                                                                                ...createInventoryRecordData(
                                                                                                  updatedAt: getCurrentTimestamp,
                                                                                                ),
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'restock_request_raised_ref': FieldValue.delete(),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            } else {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                        enText: 'Cancel Shipping API failed, retry again.',
                                                                                                        arText: 'فشلت عملية إلغاء الشحن API، أعد المحاولة مرة أخرى',
                                                                                                      )),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                          child: Text('Ok'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                              if (_shouldSetState) safeSetState(() {});
                                                                                              return;
                                                                                            }
                                                                                          } else {
                                                                                            await movementListItem.reference.update(createInventorymovementlogRecordData(
                                                                                              updateAt: getCurrentTimestamp,
                                                                                              requestInfo: createInventoryRequestInfoStruct(
                                                                                                fulfillStatus: 'Cancelled',
                                                                                                requestStatus: 'Cancelled',
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));

                                                                                            await movementListItem.inventoryRef!.update({
                                                                                              ...createInventoryRecordData(
                                                                                                updatedAt: getCurrentTimestamp,
                                                                                              ),
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'restock_request_raised_ref': FieldValue.delete(),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          }

                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                          return;
                                                                                        }

                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '2lrd3wva' /* Cancel  */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  if ((movementListItem.enquiryInfo.fulfillStatus == 'Enquiry open') && (movementListItem.requestInfo.requestType == 'Restock'))
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          InventoryShippingLabelWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'invmovemntRef': serializeParam(
                                                                                              movementListItem.reference,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'type': serializeParam(
                                                                                              'enquiry',
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'pq3mboxb' /* Create Return Order */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).border,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  if ((movementListItem.requestInfo.fulfillStatus == 'Received') && (movementListItem.enquiryInfo.status == '') && (movementListItem.requestInfo.requestType == 'Restock'))
                                                                                    Builder(
                                                                                      builder: (context) => FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          _model.productDoc = await ProductsRecord.getDocumentOnce(movementListItem.productRef!);
                                                                                          await showDialog(
                                                                                            barrierColor: Color(0x7B000000),
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 600.0,
                                                                                                      child: EnquiryWidget(
                                                                                                        invMovementDoc: movementListItem,
                                                                                                        productDoc: _model.productDoc!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'pgn4g43x' /* Enquiry */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 1.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).border,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  if ((movementListItem.enquiryInfo.fulfillStatus == 'Enquiry open') && (movementListItem.requestInfo.requestType == 'Restock'))
                                                                                    Builder(
                                                                                      builder: (context) => FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await showDialog(
                                                                                            barrierColor: Color(0x7B000000),
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 600.0,
                                                                                                      child: EnquiryViewWidget(
                                                                                                        invMovementDoc: movementListItem,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'tu1fnszu' /* View Enquiry */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 1.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).border,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  if ((movementListItem.enquiryInfo.status != '') && ((movementListItem.enquiryInfo.fulfillStatus == 'Enquiry open') || (movementListItem.enquiryInfo.fulfillStatus == 'DeliveryPartnerAssigned')))
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        var _shouldSetState = false;
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                      enText: 'Are you sure you want to cancel enquiry request?',
                                                                                                      arText: 'هل أنت متأكد أنك تريد إلغاء طلب الاستفسار؟',
                                                                                                    )),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Cancel',
                                                                                                          arText: 'يلغي',
                                                                                                        )),
                                                                                                      ),
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                          enText: 'Confirm',
                                                                                                          arText: 'يتأكد',
                                                                                                        )),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          if (movementListItem.enquiryDeliveryInfo.deliveryRef != null) {
                                                                                            _model.settingEnqCancelDoc = await querySettingsRecordOnce(
                                                                                              queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                'type',
                                                                                                isEqualTo: 'Company',
                                                                                              ),
                                                                                              singleRecord: true,
                                                                                            ).then((s) => s.firstOrNull);
                                                                                            _shouldSetState = true;
                                                                                            if ((_model.settingRCancelDoc?.settingsLogisticsInfo.environment != 'test') && (getCurrentTimestamp >= _model.settingRCancelDoc!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                                              _model.getAccessKeyCanEnq = await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                                                env: 'prod',
                                                                                                clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                                                clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                                                url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                                              );

                                                                                              _shouldSetState = true;
                                                                                              if ((_model.getAccessKeyCanEnq?.succeeded ?? true)) {
                                                                                                await _model.settingRCancelDoc!.reference.update(createSettingsRecordData(
                                                                                                  settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                                    prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                                      (_model.getAccessKeyCanEnq?.jsonBody ?? ''),
                                                                                                    ),
                                                                                                    prodKeyValidTime: functions.addHours(getCurrentTimestamp, 5),
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                              } else {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return WebViewAware(
                                                                                                      child: AlertDialog(
                                                                                                        content: Text('Logistics server busy try again later'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                            child: Text('Ok'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }
                                                                                            _model.settingsupdatedCanEnq = await querySettingsRecordOnce(
                                                                                              queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                'type',
                                                                                                isEqualTo: 'Company',
                                                                                              ),
                                                                                              singleRecord: true,
                                                                                            ).then((s) => s.firstOrNull);
                                                                                            _shouldSetState = true;
                                                                                            _model.apiResultEnqCancel = await PrimeExpressDeliveryGroup.cancelDeliveryCall.call(
                                                                                              trackID: acceptedSuperadminDeliveryRecordList.where((e) => e.reference == movementListItem.enquiryDeliveryInfo.deliveryRef).toList().firstOrNull?.deliveryTrackingId,
                                                                                              env: _model.settingsupdatedCanEnq?.settingsLogisticsInfo.environment == 'test' ? 'test' : '',
                                                                                              key: _model.settingsupdatedCanEnq?.settingsLogisticsInfo.environment == 'test' ? _model.settingsupdatedCanEnq?.settingsLogisticsInfo.testKey : _model.settingsupdatedCanEnq?.settingsLogisticsInfo.prodKey,
                                                                                              url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                                            );

                                                                                            _shouldSetState = true;
                                                                                            if ((_model.apiResultEnqCancel?.succeeded ?? true)) {
                                                                                              await movementListItem.reference.update(createInventorymovementlogRecordData(
                                                                                                updateAt: getCurrentTimestamp,
                                                                                                enquiryInfo: createEnquiryInfoStruct(
                                                                                                  fulfillStatus: 'Cancelled',
                                                                                                  status: 'Cancelled',
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));

                                                                                              await movementListItem.inventoryRef!.update({
                                                                                                ...createInventoryRecordData(
                                                                                                  updatedAt: getCurrentTimestamp,
                                                                                                ),
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'restock_request_raised_ref': FieldValue.delete(),
                                                                                                    'stock_unavailable': FieldValue.increment(-(movementListItem.enquiryInfo.affectedQuanity)),
                                                                                                    'stock_on_hand': FieldValue.increment(movementListItem.enquiryInfo.affectedQuanity),
                                                                                                    'stock': FieldValue.increment(movementListItem.enquiryInfo.affectedQuanity),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            } else {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                        enText: 'Cancel Shipping API failed, retry again.',
                                                                                                        arText: 'فشلت عملية إلغاء الشحن API، أعد المحاولة مرة أخرى',
                                                                                                      )),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                          child: Text('Ok'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                              if (_shouldSetState) safeSetState(() {});
                                                                                              return;
                                                                                            }
                                                                                          } else {
                                                                                            await movementListItem.reference.update(createInventorymovementlogRecordData(
                                                                                              updateAt: getCurrentTimestamp,
                                                                                              enquiryInfo: createEnquiryInfoStruct(
                                                                                                fulfillStatus: 'Cancelled',
                                                                                                status: 'Cancelled',
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));

                                                                                            await movementListItem.inventoryRef!.update({
                                                                                              ...createInventoryRecordData(
                                                                                                updatedAt: getCurrentTimestamp,
                                                                                              ),
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'restock_request_raised_ref': FieldValue.delete(),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          }

                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                          return;
                                                                                        }

                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'refsyj8l' /* Cancel Enquiry */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ].map((c) => DataCell(c)).toList(),
                                                                        ),
                                                                        emptyBuilder:
                                                                            () =>
                                                                                EmptyWidget(
                                                                          messageOne:
                                                                              FFLocalizations.of(context).getText(
                                                                            'mjezb56x' /* Looks like an empty space */,
                                                                          ),
                                                                          messageTwo:
                                                                              FFLocalizations.of(context).getText(
                                                                            'u4zc0sy3' /* These items are now live and r... */,
                                                                          ),
                                                                        ),
                                                                        paginated:
                                                                            true,
                                                                        selectable:
                                                                            false,
                                                                        hidePaginator:
                                                                            false,
                                                                        showFirstLastButtons:
                                                                            true,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        headingRowHeight:
                                                                            40.0,
                                                                        dataRowHeight:
                                                                            60.0,
                                                                        columnSpacing:
                                                                            16.0,
                                                                        headingRowColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        addHorizontalDivider:
                                                                            true,
                                                                        addTopAndBottomDivider:
                                                                            true,
                                                                        hideDefaultHorizontalDivider:
                                                                            false,
                                                                        horizontalDividerColor:
                                                                            FlutterFlowTheme.of(context).border,
                                                                        horizontalDividerThickness:
                                                                            1.0,
                                                                        addVerticalDivider:
                                                                            false,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      if ((FFAppState()
                                                                  .currentUserRoleKey ==
                                                              'designer') &&
                                                          ((_model.choiceChipsValue ==
                                                                  'Pending') ||
                                                              (_model.choiceChipsValue ==
                                                                  'قيد الانتظار')))
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: (FFAppState()
                                                                          .currentUserRoleKey ==
                                                                      'designer') &&
                                                                  ((_model.choiceChipsValue ==
                                                                          'Pending') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'قيد الانتظار')),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final desginermovementList = inventorInventorymovementlogRecordList
                                                                      .where((e) =>
                                                                          (e.designerUid ==
                                                                              currentUserUid) &&
                                                                          (e.requestInfo.requestStatus ==
                                                                              'Pending'))
                                                                      .toList()
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();
                                                                  if (desginermovementList
                                                                      .isEmpty) {
                                                                    return EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'jhv0uxue' /* Nothing to show... yet! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '30c6kjow' /* Data will appear once added or... */,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return FlutterFlowDataTable<
                                                                      InventorymovementlogRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController3,
                                                                    data:
                                                                        desginermovementList,
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 50.0,
                                                                                decoration: BoxDecoration(),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '2oxh0ays' /* Product */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ),
                                                                        fixedWidth:
                                                                            180.0,
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3rsjupq7' /* SKU */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.12
                                                                                : 0.1),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'wxvc9ojk' /* Qty */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.12
                                                                                : 0.08),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '90wylp49' /* Request Type */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.12
                                                                                : 0.1),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '9d9uke9k' /* Request Date */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.12
                                                                                : 0.08),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '4zwpsmec' /* Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.12
                                                                                : 0.08),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '5a5wmoga' /* Pref. ETA */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.12
                                                                                : 0.08),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'j1rbg2xf' /*   */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth: MediaQuery.sizeOf(context).width *
                                                                            (MediaQuery.sizeOf(context).width <= 1200.0
                                                                                ? 0.19
                                                                                : 0.2),
                                                                      ),
                                                                    ],
                                                                    dataRowBuilder: (desginermovementListItem,
                                                                            desginermovementListIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      cells: [
                                                                        StreamBuilder<
                                                                            ProductsRecord>(
                                                                          stream:
                                                                              ProductsRecord.getDocument(desginermovementListItem.productRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final rowProductsRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      getCORSProxyUrl(
                                                                                        rowProductsRecord.productInfo.galleryImage.firstOrNull!,
                                                                                      ),
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      fit: BoxFit.cover,
                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            FFLocalizations.of(context).getVariableText(
                                                                                              enText: () {
                                                                                                if (rowProductsRecord.productInfoCustomTranslate.name.en != '') {
                                                                                                  return rowProductsRecord.productInfoCustomTranslate.name.en;
                                                                                                } else if (rowProductsRecord.productInfoTranslate.name.en != '') {
                                                                                                  return rowProductsRecord.productInfoTranslate.name.en;
                                                                                                } else {
                                                                                                  return rowProductsRecord.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                              arText: () {
                                                                                                if (rowProductsRecord.productInfoCustomTranslate.name.ar != '') {
                                                                                                  return rowProductsRecord.productInfoCustomTranslate.name.ar;
                                                                                                } else if (rowProductsRecord.productInfoTranslate.name.ar != '') {
                                                                                                  return rowProductsRecord.productInfoTranslate.name.ar;
                                                                                                } else {
                                                                                                  return rowProductsRecord.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            'Name',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                lineHeight: 1.5,
                                                                                              ),
                                                                                        )),
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                          desktop: false,
                                                                                        ))
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).background,
                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'qjg0clce' /* White / XS  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            );
                                                                          },
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          desginermovementListItem
                                                                              .productId,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Text(
                                                                          desginermovementListItem
                                                                              .productQuantity
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          desginermovementListItem
                                                                              .requestInfo
                                                                              .requestType,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            desginermovementListItem.createdAt!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: desginermovementListItem.requestInfo.requestStatus == 'Pending'
                                                                                ? FlutterFlowTheme.of(context).azyaaPendingBG
                                                                                : FlutterFlowTheme.of(context).azyaaDeclineBG,
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                2.0,
                                                                                12.0,
                                                                                2.0),
                                                                            child:
                                                                                Text(
                                                                              desginermovementListItem.requestInfo.requestStatus,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: desginermovementListItem.requestInfo.requestStatus == 'Pending' ? FlutterFlowTheme.of(context).azyaaPending : FlutterFlowTheme.of(context).azyaaDecline,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            desginermovementListItem.requestInfo.adminPreferredDate!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            if (_model.choiceChipsValue ==
                                                                                'Pending')
                                                                              Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await showDialog(
                                                                                      barrierColor: Color(0x7B000000),
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 600.0,
                                                                                                child: RequestAcceptWidget(
                                                                                                  invMovementRef: desginermovementListItem.reference,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '314h1pnd' /* Accept */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 30.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 1.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (_model.choiceChipsValue ==
                                                                                'Pending')
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text('Are you sure'),
                                                                                              content: Text('Do you want to reject request'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('Cancel'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('Confirm'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (confirmDialogResponse) {
                                                                                    await desginermovementListItem.reference.update(createInventorymovementlogRecordData(
                                                                                      updateAt: getCurrentTimestamp,
                                                                                      requestInfo: createInventoryRequestInfoStruct(
                                                                                        requestStatus: 'Declined',
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  } else {
                                                                                    return;
                                                                                  }
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '5rcq3kpk' /* Decline */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                      ),
                                                                                  elevation: 1.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ]
                                                                          .map((c) =>
                                                                              DataCell(c))
                                                                          .toList(),
                                                                    ),
                                                                    emptyBuilder:
                                                                        () =>
                                                                            EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'jhv0uxue' /* Nothing to show... yet! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '30c6kjow' /* Data will appear once added or... */,
                                                                      ),
                                                                    ),
                                                                    paginated:
                                                                        true,
                                                                    selectable:
                                                                        false,
                                                                    hidePaginator:
                                                                        false,
                                                                    showFirstLastButtons:
                                                                        true,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.8,
                                                                    headingRowHeight:
                                                                        40.0,
                                                                    dataRowHeight:
                                                                        60.0,
                                                                    columnSpacing:
                                                                        16.0,
                                                                    headingRowColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    addHorizontalDivider:
                                                                        true,
                                                                    addTopAndBottomDivider:
                                                                        true,
                                                                    hideDefaultHorizontalDivider:
                                                                        false,
                                                                    horizontalDividerColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .border,
                                                                    horizontalDividerThickness:
                                                                        1.0,
                                                                    addVerticalDivider:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if ((FFAppState()
                                                                  .currentUserRoleKey ==
                                                              'designer') &&
                                                          ((_model.choiceChipsValue ==
                                                                  'Declined') ||
                                                              (_model.choiceChipsValue ==
                                                                  'انخفض')))
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: (FFAppState()
                                                                          .currentUserRoleKey ==
                                                                      'designer') &&
                                                                  ((_model.choiceChipsValue ==
                                                                          'Declined') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'انخفض')),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final desginermovementList = inventorInventorymovementlogRecordList
                                                                      .where((e) =>
                                                                          (e.designerUid ==
                                                                              currentUserUid) &&
                                                                          (e.requestInfo.requestStatus ==
                                                                              'Declined'))
                                                                      .toList()
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();
                                                                  if (desginermovementList
                                                                      .isEmpty) {
                                                                    return EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '9njsdae4' /* Nothing to show... yet! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'y9r8kq0v' /* Data will appear once added or... */,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return FlutterFlowDataTable<
                                                                      InventorymovementlogRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController4,
                                                                    data:
                                                                        desginermovementList,
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 50.0,
                                                                                decoration: BoxDecoration(),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '2b5m6558' /* Product */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ),
                                                                        fixedWidth:
                                                                            180.0,
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '2k2abha9' /* SKU */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'gkd5a07h' /* Qty */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0p939276' /* Request Type */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'lzli3a16' /* Request Date */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'sqscz0cr' /* Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '1qgymomc' /* Pref. ETA */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    dataRowBuilder: (desginermovementListItem,
                                                                            desginermovementListIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      cells: [
                                                                        StreamBuilder<
                                                                            ProductsRecord>(
                                                                          stream:
                                                                              ProductsRecord.getDocument(desginermovementListItem.productRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final rowProductsRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      getCORSProxyUrl(
                                                                                        rowProductsRecord.productInfo.galleryImage.firstOrNull!,
                                                                                      ),
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      fit: BoxFit.cover,
                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            FFLocalizations.of(context).getVariableText(
                                                                                              enText: () {
                                                                                                if (rowProductsRecord.productInfoCustomTranslate.name.en != '') {
                                                                                                  return rowProductsRecord.productInfoCustomTranslate.name.en;
                                                                                                } else if (rowProductsRecord.productInfoTranslate.name.en != '') {
                                                                                                  return rowProductsRecord.productInfoTranslate.name.en;
                                                                                                } else {
                                                                                                  return rowProductsRecord.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                              arText: () {
                                                                                                if (rowProductsRecord.productInfoCustomTranslate.name.ar != '') {
                                                                                                  return rowProductsRecord.productInfoCustomTranslate.name.ar;
                                                                                                } else if (rowProductsRecord.productInfoTranslate.name.ar != '') {
                                                                                                  return rowProductsRecord.productInfoTranslate.name.ar;
                                                                                                } else {
                                                                                                  return rowProductsRecord.productInfo.name;
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            'Name',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                lineHeight: 1.5,
                                                                                              ),
                                                                                        )),
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                          desktop: false,
                                                                                        ))
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).background,
                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'gphbmef0' /* White / XS  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            );
                                                                          },
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          desginermovementListItem
                                                                              .productId,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Text(
                                                                          desginermovementListItem
                                                                              .productQuantity
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          desginermovementListItem
                                                                              .requestInfo
                                                                              .requestType,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            desginermovementListItem.createdAt!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).azyaaDeclineBG,
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                2.0,
                                                                                12.0,
                                                                                2.0),
                                                                            child:
                                                                                Text(
                                                                              desginermovementListItem.requestInfo.requestStatus,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).azyaaDecline,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            desginermovementListItem.requestInfo.adminPreferredDate!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ]
                                                                          .map((c) =>
                                                                              DataCell(c))
                                                                          .toList(),
                                                                    ),
                                                                    emptyBuilder:
                                                                        () =>
                                                                            EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '9njsdae4' /* Nothing to show... yet! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'y9r8kq0v' /* Data will appear once added or... */,
                                                                      ),
                                                                    ),
                                                                    paginated:
                                                                        true,
                                                                    selectable:
                                                                        false,
                                                                    hidePaginator:
                                                                        false,
                                                                    showFirstLastButtons:
                                                                        true,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.8,
                                                                    headingRowHeight:
                                                                        40.0,
                                                                    dataRowHeight:
                                                                        60.0,
                                                                    columnSpacing:
                                                                        16.0,
                                                                    headingRowColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    addHorizontalDivider:
                                                                        true,
                                                                    addTopAndBottomDivider:
                                                                        true,
                                                                    hideDefaultHorizontalDivider:
                                                                        false,
                                                                    horizontalDividerColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .border,
                                                                    horizontalDividerThickness:
                                                                        1.0,
                                                                    addVerticalDivider:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if ((FFAppState()
                                                                  .currentUserRoleKey ==
                                                              'designer') &&
                                                          (valueOrDefault<bool>(
                                                                _model.choiceChipsValue ==
                                                                    'Accepted',
                                                                true,
                                                              ) ||
                                                              (_model.choiceChipsValue ==
                                                                  'مقبول')))
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: (FFAppState()
                                                                          .currentUserRoleKey ==
                                                                      'designer') &&
                                                                  ((_model.choiceChipsValue ==
                                                                          'Accepted') ||
                                                                      (_model.choiceChipsValue ==
                                                                          'مقبول')),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final productList = inventorInventorymovementlogRecordList
                                                                      .where((e) =>
                                                                          (e.designerUid ==
                                                                              currentUserUid) &&
                                                                          (e.requestInfo.requestStatus ==
                                                                              'Accepted'))
                                                                      .toList()
                                                                      .sortedList(
                                                                          keyOf: (e) => e
                                                                              .updateAt!,
                                                                          desc:
                                                                              true)
                                                                      .toList();
                                                                  if (productList
                                                                      .isEmpty) {
                                                                    return EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'kfps38jq' /* This space feels lonely */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'qlps4yub' /* Feed it with some data. */,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return FlutterFlowDataTable<
                                                                      InventorymovementlogRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController5,
                                                                    data:
                                                                        productList,
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'lfyphiel' /* Product */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF616161),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        fixedWidth:
                                                                            150.0,
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'sg89l3zw' /* SKU */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '7jyinin4' /* Qty */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'xw3ijku3' /* Request Type */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'hjpf78z4' /* Request Date */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'xyvm7ko3' /* Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'oxu5zt15' /* Pref. ETA */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'yc2yw2mi' /*  Des. ETA */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '58057gv0' /* Fulfill Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '6gnt7doh' /*   */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF616161),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        fixedWidth:
                                                                            130.0,
                                                                      ),
                                                                    ],
                                                                    dataRowBuilder: (productListItem,
                                                                            productListIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      cells: [
                                                                        StreamBuilder<
                                                                            ProductsRecord>(
                                                                          stream:
                                                                              ProductsRecord.getDocument(productListItem.productRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final rowProductsRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      getCORSProxyUrl(
                                                                                        rowProductsRecord.productInfo.galleryImage.firstOrNull!,
                                                                                      ),
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      fit: BoxFit.cover,
                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          FFLocalizations.of(context).getVariableText(
                                                                                            enText: () {
                                                                                              if (rowProductsRecord.productInfoCustomTranslate.name.en != '') {
                                                                                                return rowProductsRecord.productInfoCustomTranslate.name.en;
                                                                                              } else if (rowProductsRecord.productInfoTranslate.name.en != '') {
                                                                                                return rowProductsRecord.productInfoTranslate.name.en;
                                                                                              } else {
                                                                                                return rowProductsRecord.productInfo.name;
                                                                                              }
                                                                                            }(),
                                                                                            arText: () {
                                                                                              if (rowProductsRecord.productInfoCustomTranslate.name.ar != '') {
                                                                                                return rowProductsRecord.productInfoCustomTranslate.name.ar;
                                                                                              } else if (rowProductsRecord.productInfoTranslate.name.ar != '') {
                                                                                                return rowProductsRecord.productInfoTranslate.name.ar;
                                                                                              } else {
                                                                                                return rowProductsRecord.productInfo.name;
                                                                                              }
                                                                                            }(),
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                lineHeight: 1.5,
                                                                                              ),
                                                                                        )),
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                          desktop: false,
                                                                                        ))
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).background,
                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'j4t3dalj' /* White / XS  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            );
                                                                          },
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          productListItem
                                                                              .productId,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Text(
                                                                          productListItem.enquiryInfo.enquiryId != ''
                                                                              ? '${productListItem.productQuantity.toString()} (${productListItem.enquiryInfo.affectedQuanity.toString()})'
                                                                              : productListItem.productQuantity.toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          productListItem.enquiryInfo.enquiryId != ''
                                                                              ? '${productListItem.requestInfo.requestType} (Enquiry)'
                                                                              : productListItem.requestInfo.requestType,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        )),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            productListItem.createdAt!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x20067647),
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                2.0,
                                                                                12.0,
                                                                                2.0),
                                                                            child:
                                                                                Text(
                                                                              () {
                                                                                if (productListItem.enquiryInfo.fulfillStatus == 'Received') {
                                                                                  return 'Enquiry Closed';
                                                                                } else if (productListItem.requestInfo.fulfillStatus == 'Received') {
                                                                                  return 'Received';
                                                                                } else {
                                                                                  return 'Accepted';
                                                                                }
                                                                              }(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF067647),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            productListItem.requestInfo.adminPreferredDate!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            productListItem.requestInfo.designerPreferredNotes!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              desktop: false,
                                                                            ))
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'psj85tlb' /* Processing */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFFC08700),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            Stack(
                                                                              children: [
                                                                                if ((productListItem.enquiryInfo.enquiryId == '') &&
                                                                                    responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                  Text(
                                                                                    productListItem.requestInfo.fulfillStatus,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: () {
                                                                                            if (productListItem.requestInfo.fulfillStatus == 'Processing') {
                                                                                              return FlutterFlowTheme.of(context).azyaaProcessing;
                                                                                            } else if (productListItem.requestInfo.fulfillStatus == 'Ready to pickup') {
                                                                                              return FlutterFlowTheme.of(context).azyaaAccepted;
                                                                                            } else {
                                                                                              return Color(0x00000000);
                                                                                            }
                                                                                          }(),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                Text(
                                                                                  () {
                                                                                    if (productListItem.enquiryInfo.fulfillStatus == 'DeliveryPartnerAssigned') {
                                                                                      return 'Enquiry Shipping';
                                                                                    } else if (productListItem.enquiryInfo.fulfillStatus == 'Enquiry open') {
                                                                                      return 'Enquiry open';
                                                                                    } else if (productListItem.enquiryInfo.fulfillStatus == 'Received') {
                                                                                      return 'Enquiry Received';
                                                                                    } else if (productListItem.enquiryInfo.fulfillStatus == 'Cancelled') {
                                                                                      return 'Enquiry Cancelled';
                                                                                    } else if (productListItem.requestInfo.fulfillStatus == 'Received') {
                                                                                      return 'Recevied';
                                                                                    } else if (productListItem.requestInfo.fulfillStatus == 'Cancelled') {
                                                                                      return 'Request Cancelled';
                                                                                    } else {
                                                                                      return 'Processing';
                                                                                    }
                                                                                  }(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              desktop: false,
                                                                            ))
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x1A303030),
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'd7zzgaxp' /* Enquiry Open */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              if ((productListItem.requestInfo.requestStatus == 'Accepted') && (productListItem.requestInfo.fulfillStatus == 'Processing'))
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {},
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'aw45i9fy' /* Ready to Pickup */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 30.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: Color(0xFF29845A),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: Colors.white,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 1.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              if (((productListItem.enquiryInfo.fulfillStatus == 'Enquiry open') || (productListItem.enquiryInfo.fulfillStatus == 'DeliveryPartnerAssigned')) && (productListItem.requestInfo.fulfillStatus == 'Received'))
                                                                                Builder(
                                                                                  builder: (context) => FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await showDialog(
                                                                                        barrierColor: Color(0x7B000000),
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 600.0,
                                                                                                  child: EnquiryViewWidget(
                                                                                                    invMovementDoc: productListItem,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'l3yu6wxt' /* View Enquiry */,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 30.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if ((productListItem.enquiryInfo.fulfillStatus == 'DeliveryPartnerAssigned') && (productListItem.requestInfo.fulfillStatus == 'Received'))
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                  enText: 'Did you recevie products?',
                                                                                                  arText: 'هل استلمت المنتجات؟',
                                                                                                )),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                    child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                      enText: 'Cancel',
                                                                                                      arText: 'يلغي',
                                                                                                    )),
                                                                                                  ),
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                    child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                      enText: 'Confirm',
                                                                                                      arText: 'يتأكد',
                                                                                                    )),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      await productListItem.reference.update(createInventorymovementlogRecordData(
                                                                                        updateAt: getCurrentTimestamp,
                                                                                        enquiryInfo: createEnquiryInfoStruct(
                                                                                          fulfillStatus: 'Received',
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                      ));

                                                                                      await productListItem.inventoryRef!.update({
                                                                                        ...createInventoryRecordData(
                                                                                          updatedAt: getCurrentTimestamp,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'stock_unavailable': FieldValue.increment(-(productListItem.enquiryInfo.affectedQuanity)),
                                                                                            'enquiry_raised_ref': FieldValue.delete(),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                    } else {
                                                                                      return;
                                                                                    }
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'zkobunny' /* Recevied Enquiry */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 30.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: Colors.white,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 1.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ]
                                                                          .map((c) =>
                                                                              DataCell(c))
                                                                          .toList(),
                                                                    ),
                                                                    emptyBuilder:
                                                                        () =>
                                                                            EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'kfps38jq' /* This space feels lonely */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'qlps4yub' /* Feed it with some data. */,
                                                                      ),
                                                                    ),
                                                                    paginated:
                                                                        true,
                                                                    selectable:
                                                                        false,
                                                                    hidePaginator:
                                                                        false,
                                                                    showFirstLastButtons:
                                                                        true,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.8,
                                                                    headingRowHeight:
                                                                        40.0,
                                                                    dataRowHeight:
                                                                        60.0,
                                                                    columnSpacing:
                                                                        16.0,
                                                                    headingRowColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    addHorizontalDivider:
                                                                        true,
                                                                    addTopAndBottomDivider:
                                                                        true,
                                                                    hideDefaultHorizontalDivider:
                                                                        false,
                                                                    horizontalDividerColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .border,
                                                                    horizontalDividerThickness:
                                                                        1.0,
                                                                    addVerticalDivider:
                                                                        false,
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
                                          ]
                                              .addToStart(
                                                  SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
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
                  wrapWithModel(
                    model: _model.themeStatusCheckerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ThemeStatusCheckerWidget(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
