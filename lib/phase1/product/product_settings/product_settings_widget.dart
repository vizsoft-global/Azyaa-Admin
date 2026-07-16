import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_settings_model.dart';
export 'product_settings_model.dart';

class ProductSettingsWidget extends StatefulWidget {
  const ProductSettingsWidget({super.key});

  static String routeName = 'ProductSettings';
  static String routePath = '/azyaa-ProductSettings';

  @override
  State<ProductSettingsWidget> createState() => _ProductSettingsWidgetState();
}

class _ProductSettingsWidgetState extends State<ProductSettingsWidget> {
  late ProductSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSettingsModel());

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
        title: 'ProductSettings',
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
                                  menuname: ' Product Settings',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<SettingsRecord>>(
                                    stream: querySettingsRecord(
                                      queryBuilder: (settingsRecord) =>
                                          settingsRecord.where(
                                        'type',
                                        isEqualTo: 'Company',
                                      ),
                                      singleRecord: true,
                                    ),
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
                                      List<SettingsRecord>
                                          customerSettingsRecordList =
                                          snapshot.data!;
                                      final customerSettingsRecord =
                                          customerSettingsRecordList.isNotEmpty
                                              ? customerSettingsRecordList.first
                                              : null;

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
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
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
                                                              'k31qf1uw' /* Product Settings */,
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
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .theme
                                                                        .themeMain
                                                                        .primary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
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
                                                        14.0, 0.0, 14.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                  child: SingleChildScrollView(
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'rp2qtii0' /* Product Permission */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
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
                                                              child: Wrap(
                                                                spacing: 8.0,
                                                                runSpacing:
                                                                    16.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context).width >=
                                                                            1200.0
                                                                        ? 360.0
                                                                        : 300.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: SwitchListTile
                                                                            .adaptive(
                                                                          value: _model.estimateShippingDaysValue ??= customerSettingsRecord!
                                                                              .settingsProduct
                                                                              .estmaitedShipping,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.estimateShippingDaysValue = newValue);
                                                                            if (newValue) {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  estmaitedShipping: true,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  estmaitedShipping: false,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            }
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ejznkkh1' /* Estimate Shipping Days */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppState().theme.themeMain.primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          activeTrackColor: FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primary,
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context).width >=
                                                                            1200.0
                                                                        ? 360.0
                                                                        : 300.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: SwitchListTile
                                                                            .adaptive(
                                                                          value: _model.shortDescriptionValue ??= customerSettingsRecord!
                                                                              .settingsProduct
                                                                              .procurementCost,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.shortDescriptionValue = newValue);
                                                                            if (newValue) {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  procurementCost: true,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  procurementCost: false,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            }
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ybhz1rfp' /* Procurement Cost */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppState().theme.themeMain.primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          activeTrackColor: FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primary,
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context).width >=
                                                                            1200.0
                                                                        ? 360.0
                                                                        : 300.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: SwitchListTile
                                                                            .adaptive(
                                                                          value: _model.descriptionValue ??= customerSettingsRecord!
                                                                              .settingsProduct
                                                                              .procurementPrice,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.descriptionValue = newValue);
                                                                            if (newValue) {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  procurementPrice: true,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  procurementPrice: false,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            }
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '7aatow0r' /* Procurement Price */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppState().theme.themeMain.primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          activeTrackColor: FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primary,
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                          contentPadding:
                                                                              EdgeInsets.all(0.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context).width >=
                                                                            1200.0
                                                                        ? 360.0
                                                                        : 300.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: SwitchListTile
                                                                            .adaptive(
                                                                          value: _model.skuValue ??= customerSettingsRecord!
                                                                              .settingsProduct
                                                                              .comparePrice,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.skuValue = newValue);
                                                                            if (newValue) {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  comparePrice: true,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              await customerSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsProduct: createSettingsProductStruct(
                                                                                  comparePrice: false,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            }
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'so1125su' /* Compare Cost */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppState().theme.themeMain.primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          activeTrackColor: FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primary,
                                                                          dense:
                                                                              true,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context).width >=
                                                                              1200.0
                                                                          ? 360.0
                                                                          : 300.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile.adaptive(
                                                                            value: _model.estimateShippingNoDaysIfOrderedValue ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.estimateShippingNoDaysIfOrderedValue = newValue);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'hmzyj5qo' /* Estimate Shipping No. Days (If... */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                            contentPadding:
                                                                                EdgeInsets.all(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context).width >=
                                                                              1200.0
                                                                          ? 360.0
                                                                          : 300.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile.adaptive(
                                                                            value: _model.productPriceValue ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.productPriceValue = newValue);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '1ibcjqff' /* Product Price */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                            contentPadding:
                                                                                EdgeInsets.all(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context).width >=
                                                                              1200.0
                                                                          ? 360.0
                                                                          : 300.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile.adaptive(
                                                                            value: _model.compareatPriceOptionalValue ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.compareatPriceOptionalValue = newValue);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'uvsstscy' /* Compare at Price (Optional) */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                            contentPadding:
                                                                                EdgeInsets.all(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context).width >=
                                                                              1200.0
                                                                          ? 360.0
                                                                          : 300.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              SwitchListTile.adaptive(
                                                                            value: _model.weightgmValue ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.weightgmValue = newValue);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'p84y95dl' /* Weight (gm) */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
                                                                            contentPadding:
                                                                                EdgeInsets.all(0.0),
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .addToStart(
                                                  SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(height: 16.0)),
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
