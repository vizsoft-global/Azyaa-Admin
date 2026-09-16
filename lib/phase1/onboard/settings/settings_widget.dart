import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/onboard/location/location_widget.dart';
import '/phase1/onboard/theme/theme_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'Settings';
  static String routePath = '/azyaa-settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
      }
    });

    _model.titleFocusNode1 ??= FocusNode();

    _model.skuFocusNode1 ??= FocusNode();

    _model.titleFocusNode2 ??= FocusNode();

    _model.skuFocusNode2 ??= FocusNode();

    _model.titleFocusNode3 ??= FocusNode();

    _model.formUrlFocusNode ??= FocusNode();

    _model.titleFocusNode4 ??= FocusNode();

    _model.skuFocusNode3 ??= FocusNode();

    _model.privacyFocusNode ??= FocusNode();

    _model.termsFocusNode ??= FocusNode();

    _model.titleFocusNode5 ??= FocusNode();

    _model.disclaimerFocusNode ??= FocusNode();

    _model.titleFocusNode6 ??= FocusNode();

    _model.skuFocusNode4 ??= FocusNode();

    _model.titleFocusNode7 ??= FocusNode();

    _model.skuFocusNode5 ??= FocusNode();

    _model.whatsappFocusNode1 ??= FocusNode();

    _model.whatsappFocusNode2 ??= FocusNode();

    _model.nameFocusNode ??= FocusNode();

    _model.titleFocusNode8 ??= FocusNode();

    _model.addressFocusNode ??= FocusNode();

    _model.cityFocusNode ??= FocusNode();

    _model.regionFocusNode ??= FocusNode();

    _model.buildingFocusNode ??= FocusNode();

    _model.blockFocusNode ??= FocusNode();

    _model.productionKeyFocusNode ??= FocusNode();

    _model.testKeyFocusNode1 ??= FocusNode();

    _model.shippngChargesinKuwaitFocusNode1 ??= FocusNode();

    _model.testKeyFocusNode2 ??= FocusNode();

    _model.shippngChargesinKuwaitFocusNode2 ??= FocusNode();

    _model.testKeyFocusNode3 ??= FocusNode();

    _model.shippngChargesinKuwaitFocusNode3 ??= FocusNode();

    _model.shippngChargesinGCC1FocusNode ??= FocusNode();

    _model.shippngChargesinGCC2FocusNode ??= FocusNode();

    _model.titleFocusNode9 ??= FocusNode();

    _model.skuFocusNode6 ??= FocusNode();

    _model.loyaltyRupeeFocusNode ??= FocusNode();

    _model.loyaltyPointNorFocusNode ??= FocusNode();

    _model.promotionDaysFocusNode ??= FocusNode();

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
        title: 'Settings',
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
                                  menuname: 'Settings',
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
                                          userInfoSettingsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final userInfoSettingsRecord =
                                          userInfoSettingsRecordList.isNotEmpty
                                              ? userInfoSettingsRecordList.first
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
                                                        Expanded(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3ncsbudp' /* Settings */,
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
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              HomeSettingWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'benacsko' /* Homepage options */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
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
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .theme
                                                                            .themeMain
                                                                            .primaryButtonTextColor,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppState()
                                                                  .theme
                                                                  .themeMain
                                                                  .primaryButtonBorder!,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                          FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ztxye4xw' /* Save changes */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                    updateOnChange: true,
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
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (FFAppState()
                                                                        .currentUserPermission
                                                                        .contains(
                                                                            _model.permissionKeyPayment) ==
                                                                    true)
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '6ryidm9e' /* Payment Gateway */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.productTypeValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.productTypeValue ??= userInfoSettingsRecord?.settingsPaymentInfo.where((e) => e.isPrimaryStatus == true).toList().firstOrNull?.paymentName,
                                                                            ),
                                                                            options:
                                                                                userInfoSettingsRecord!.settingsPaymentInfo.map((e) => e.paymentName).toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.productTypeValue = val);
                                                                              _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                              _model.paymentName = _model.productTypeValue;
                                                                              _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                              while (_model.count! > 0) {
                                                                                if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                  _model.updateAllPaymentInfoAtIndex(
                                                                                    (_model.count!) - 1,
                                                                                    (e) => e..isPrimaryStatus = true,
                                                                                  );
                                                                                  _model.count = (_model.count!) - 1;
                                                                                } else {
                                                                                  _model.updateAllPaymentInfoAtIndex(
                                                                                    (_model.count!) - 1,
                                                                                    (e) => e..isPrimaryStatus = false,
                                                                                  );
                                                                                  _model.count = (_model.count!) - 1;
                                                                                }
                                                                              }

                                                                              await userInfoSettingsRecord.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                      _model.allPaymentInfo,
                                                                                    ),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              safeSetState(() {
                                                                                _model.productTypeValueController?.value = _model.productTypeValue!;
                                                                                _model.productTypeValue = _model.productTypeValue!;
                                                                              });
                                                                            },
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                36.0,
                                                                            maxHeight:
                                                                                120.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'lr89mr9b' /* Select... */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FFAppState().theme.themeMain.primary,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            borderWidth:
                                                                                1.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                24.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                      visualDensity: VisualDensity.compact,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                      ),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValue1 ??= userInfoSettingsRecord.settingsPaymentInfo.where((e) => e.isPrimaryStatus == true).toList().firstOrNull!.isProductionStatus,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.checkboxValue1 = newValue!);
                                                                                      if (newValue!) {
                                                                                        _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                                        _model.paymentName = _model.productTypeValue;
                                                                                        _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                                        while (_model.count! > 0) {
                                                                                          if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                            _model.updateAllPaymentInfoAtIndex(
                                                                                              (_model.count!) - 1,
                                                                                              (e) => e..isProductionStatus = true,
                                                                                            );
                                                                                            safeSetState(() {});
                                                                                            break;
                                                                                          } else {
                                                                                            _model.count = (_model.count!) - 1;
                                                                                          }
                                                                                        }

                                                                                        await userInfoSettingsRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                                _model.allPaymentInfo,
                                                                                              ),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      } else {
                                                                                        _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                                        _model.paymentName = _model.productTypeValue;
                                                                                        _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                                        while (_model.count! > 0) {
                                                                                          if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                            _model.updateAllPaymentInfoAtIndex(
                                                                                              (_model.count!) - 1,
                                                                                              (e) => e..isProductionStatus = false,
                                                                                            );
                                                                                            safeSetState(() {});
                                                                                            break;
                                                                                          } else {
                                                                                            _model.count = (_model.count!) - 1;
                                                                                          }
                                                                                        }

                                                                                        await userInfoSettingsRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                                _model.allPaymentInfo,
                                                                                              ),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      }
                                                                                    },
                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                        ? BorderSide(
                                                                                            width: 2,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          )
                                                                                        : null,
                                                                                    activeColor: FFAppState().theme.themeMain.primary,
                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'srnpa2yh' /* Production Mode */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'i7ze7snj' /* Test Credentials */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.titleTextController1 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord.settingsPaymentInfo.where((e) => e.isPrimaryStatus == true).toList().firstOrNull?.testSecretKey,
                                                                                      ),
                                                                                      focusNode: _model.titleFocusNode1,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.titleTextController1',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                                          _model.paymentName = _model.productTypeValue;
                                                                                          _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                                          while (_model.count! > 0) {
                                                                                            if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                              _model.updateAllPaymentInfoAtIndex(
                                                                                                (_model.count!) - 1,
                                                                                                (e) => e..testSecretKey = _model.titleTextController1.text,
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                              break;
                                                                                            } else {
                                                                                              _model.count = (_model.count!) - 1;
                                                                                            }
                                                                                          }

                                                                                          await userInfoSettingsRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                                  _model.allPaymentInfo,
                                                                                                ),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '962ynedk' /* Test Credentials */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
                                                                                        suffixIcon: _model.titleTextController1!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.titleTextController1?.clear();
                                                                                                  _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                                                  _model.paymentName = _model.productTypeValue;
                                                                                                  _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                                                  while (_model.count! > 0) {
                                                                                                    if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                                      _model.updateAllPaymentInfoAtIndex(
                                                                                                        (_model.count!) - 1,
                                                                                                        (e) => e..testSecretKey = _model.titleTextController1.text,
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                      break;
                                                                                                    } else {
                                                                                                      _model.count = (_model.count!) - 1;
                                                                                                    }
                                                                                                  }

                                                                                                  await userInfoSettingsRecord.reference.update({
                                                                                                    ...mapToFirestore(
                                                                                                      {
                                                                                                        'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                                          _model.allPaymentInfo,
                                                                                                        ),
                                                                                                      },
                                                                                                    ),
                                                                                                  });
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      validator: _model.titleTextController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'c92mddwp' /* Production Credentials */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.skuTextController1 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord.settingsPaymentInfo.where((e) => e.isPrimaryStatus == true).toList().firstOrNull?.productionSecretKey,
                                                                                      ),
                                                                                      focusNode: _model.skuFocusNode1,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.skuTextController1',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                                          _model.paymentName = _model.productTypeValue;
                                                                                          _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                                          while (_model.count! > 0) {
                                                                                            if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                              _model.updateAllPaymentInfoAtIndex(
                                                                                                (_model.count!) - 1,
                                                                                                (e) => e..productionSecretKey = _model.skuTextController1.text,
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                              break;
                                                                                            } else {
                                                                                              _model.count = (_model.count!) - 1;
                                                                                            }
                                                                                          }

                                                                                          await userInfoSettingsRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                                  _model.allPaymentInfo,
                                                                                                ),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'r2ndt6nq' /* Production Credentials */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
                                                                                        suffixIcon: _model.skuTextController1!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.skuTextController1?.clear();
                                                                                                  _model.allPaymentInfo = userInfoSettingsRecord.settingsPaymentInfo.toList().cast<SettingsPaymentInfoStruct>();
                                                                                                  _model.paymentName = _model.productTypeValue;
                                                                                                  _model.count = userInfoSettingsRecord.settingsPaymentInfo.length;
                                                                                                  while (_model.count! > 0) {
                                                                                                    if (_model.paymentName == _model.allPaymentInfo.elementAtOrNull((_model.count!) - 1)?.paymentName) {
                                                                                                      _model.updateAllPaymentInfoAtIndex(
                                                                                                        (_model.count!) - 1,
                                                                                                        (e) => e..productionSecretKey = _model.skuTextController1.text,
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                      break;
                                                                                                    } else {
                                                                                                      _model.count = (_model.count!) - 1;
                                                                                                    }
                                                                                                  }

                                                                                                  await userInfoSettingsRecord.reference.update({
                                                                                                    ...mapToFirestore(
                                                                                                      {
                                                                                                        'settings_payment_info': getSettingsPaymentInfoListFirestoreData(
                                                                                                          _model.allPaymentInfo,
                                                                                                        ),
                                                                                                      },
                                                                                                    ),
                                                                                                  });
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      validator: _model.skuTextController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .currentUserPermission
                                                                        .contains(
                                                                            _model.permissionKeyCompany) ==
                                                                    true)
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '0itoqf3f' /* Company Settings */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'y5f4mo3t' /* Company Name */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.titleTextController2 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.companyName,
                                                                                        ),
                                                                                        focusNode: _model.titleFocusNode2,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.titleTextController2',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                companyName: _model.titleTextController2.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'kbw9y4rt' /* Company Name */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLength: 30,
                                                                                        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                        cursorColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        validator: _model.titleTextController2Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '6mkuuyca' /* Website */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.skuTextController2 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.companyWebsite,
                                                                                        ),
                                                                                        focusNode: _model.skuFocusNode2,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.skuTextController2',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                companyWebsite: _model.skuTextController2.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'fsiagouy' /* Website */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        cursorColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        validator: _model.skuTextController2Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '670bap5o' /* Email */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.titleTextController3 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.contactEmail,
                                                                                        ),
                                                                                        focusNode: _model.titleFocusNode3,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.titleTextController3',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                contactEmail: _model.titleTextController3.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '36l26suy' /* Email */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLength: 40,
                                                                                        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                        keyboardType: TextInputType.emailAddress,
                                                                                        cursorColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        validator: _model.titleTextController3Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'tw3kmugc' /* Form URL */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.formUrlTextController ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.contactFormUrl,
                                                                                        ),
                                                                                        focusNode: _model.formUrlFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.formUrlTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                contactFormUrl: _model.formUrlTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'cm9orysk' /* Form URL */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        cursorColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        validator: _model.formUrlTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'wvisod8n' /* Phone Number */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.titleTextController4 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.phoneNumber,
                                                                                        ),
                                                                                        focusNode: _model.titleFocusNode4,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.titleTextController4',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                phoneNumber: _model.titleTextController4.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'oe2qeww4' /* Phone Number */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLength: 12,
                                                                                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                        cursorColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        validator: _model.titleTextController4Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '92w8tw6b' /* Phone OTP Type */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.skuTextController3 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.phoneOtpType,
                                                                                        ),
                                                                                        focusNode: _model.skuFocusNode3,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.skuTextController3',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                phoneOtpType: _model.skuTextController3.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        readOnly: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).background,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        validator: _model.skuTextController3Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'xprir25z' /* Privacy Policy */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.privacyTextController ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.privacyPolicy,
                                                                                        ),
                                                                                        focusNode: _model.privacyFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.privacyTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                privacyPolicy: _model.privacyTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '9fw5k23w' /* Privacy Policy */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLines: 10,
                                                                                        cursorColor: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primary,
                                                                                          FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                        validator: _model.privacyTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '7crkfr0w' /* Terms & Conditions */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.termsTextController ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.termsCondition,
                                                                                        ),
                                                                                        focusNode: _model.termsFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.termsTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                termsCondition: _model.termsTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'fv6g7pmz' /* Terms & Conditions */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLines: 10,
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.termsTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'sxyvl6fk' /* Address */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.titleTextController5 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.address,
                                                                                        ),
                                                                                        focusNode: _model.titleFocusNode5,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.titleTextController5',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                address: _model.titleTextController5.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'm12k8u12' /* Street, city */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLines: 3,
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.titleTextController5Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'kdqfgw37' /* Disclaimer */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.disclaimerTextController ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.disclaimer,
                                                                                        ),
                                                                                        focusNode: _model.disclaimerFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.disclaimerTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                disclaimer: _model.disclaimerTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'g2y9enpb' /* Disclaimer */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        maxLines: 3,
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.disclaimerTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'n06wl47p' /* Social Links */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'rqhpmn2o' /* Facebook */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.titleTextController6 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.socialMediaFacebook,
                                                                                        ),
                                                                                        focusNode: _model.titleFocusNode6,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.titleTextController6',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                socialMediaFacebook: _model.titleTextController6.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'khun6cqx' /* Facebook */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.titleTextController6Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'azsh9hir' /* Instagram */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.skuTextController4 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.socialMediaInstagram,
                                                                                        ),
                                                                                        focusNode: _model.skuFocusNode4,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.skuTextController4',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                socialMediaInstagram: _model.skuTextController4.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'o05yogjo' /* Instagram */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.skuTextController4Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '3vzrpd1r' /* Linkedin */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.titleTextController7 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.socialMediaLinkedin,
                                                                                        ),
                                                                                        focusNode: _model.titleFocusNode7,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.titleTextController7',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                socialMediaLinkedin: _model.titleTextController7.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'aaimifef' /* Linkedin */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.titleTextController7Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '22z78y6l' /* Twitter */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.skuTextController5 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.socialMediaTwitter,
                                                                                        ),
                                                                                        focusNode: _model.skuFocusNode5,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.skuTextController5',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                socialMediaTwitter: _model.skuTextController5.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'n2t601hg' /* Twitter */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        cursorColor: FFAppState().theme.themeMain.primary,
                                                                                        validator: _model.skuTextController5Validator.asValidator(context),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'daxp0zbx' /* Whatsapp */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.whatsappTextController1 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.whatsapp,
                                                                                      ),
                                                                                      focusNode: _model.whatsappFocusNode1,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.whatsappTextController1',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              whatsapp: _model.whatsappTextController1.text,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'fwzksmd2' /* Whatsapp */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: FFAppState().theme.themeMain.primary,
                                                                                      validator: _model.whatsappTextController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'qfpbjqyb' /* Whatsapp */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      TextFormField(
                                                                                        controller: _model.whatsappTextController2 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.whatsapp,
                                                                                        ),
                                                                                        focusNode: _model.whatsappFocusNode2,
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        validator: _model.whatsappTextController2Validator.asValidator(context),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Container(
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'p8mmhp6g' /* Azyaa Wherehouse Details */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'xbz5ut59' /* Name */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.nameTextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                                      ),
                                                                                      focusNode: _model.nameFocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.nameTextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          if (_model.nameTextController.text.trim().isEmpty) {
                                                                                            return;
                                                                                          }
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                shippingName: _model.nameTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'lgtlw3d2' /* Name */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      maxLength: 30,
                                                                                      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.nameTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'jq756i7f' /* Phone Number */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.titleTextController8 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                                      ),
                                                                                      focusNode: _model.titleFocusNode8,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.titleTextController8',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          if (_model.titleTextController8.text.trim().isEmpty) {
                                                                                            return;
                                                                                          }
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                shippingPhone: _model.titleTextController8.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'wpmc0zgu' /* Phone Number */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      maxLength: 12,
                                                                                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                      keyboardType: TextInputType.number,
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.titleTextController8Validator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'smukgpvt' /* Address */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.addressTextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                                      ),
                                                                                      focusNode: _model.addressFocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.addressTextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          if (_model.addressTextController.text.trim().isEmpty) {
                                                                                            return;
                                                                                          }
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                addressLine1: _model.addressTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'pzj83iz7' /* Street, */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.addressTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'o3ssvbzg' /* City */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.cityTextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                                      ),
                                                                                      focusNode: _model.cityFocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.cityTextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          if (_model.cityTextController.text.trim().isEmpty) {
                                                                                            return;
                                                                                          }
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                city: _model.cityTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '692mqzgf' /* City */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.cityTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'gmqdvcuw' /* Regoin */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.regionTextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.state,
                                                                                      ),
                                                                                      focusNode: _model.regionFocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.regionTextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                state: _model.regionTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'b5nm130n' /* Region */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.regionTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '7yonh9ex' /* Country */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    FlutterFlowDropDown<String>(
                                                                                      controller: _model.countryValueController ??= FormFieldController<String>(
                                                                                        _model.countryValue ??= userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country != null && userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country != '' ? userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country : 'Kuwait',
                                                                                      ),
                                                                                      options: functions.getCountryList(),
                                                                                      onChanged: (val) async {
                                                                                        safeSetState(() => _model.countryValue = val);
                                                                                        _model.apiResultCountryISO = await CountryISOCall.call(
                                                                                          name: _model.countryValue,
                                                                                          url: isWeb ? 'https://proxy.vizsoft.in/https://restcountries.com/v3.1/name' : 'https://restcountries.com/v3.1/name',
                                                                                        );

                                                                                        if ((_model.apiResultCountryISO?.succeeded ?? true)) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                country: _model.countryValue,
                                                                                                countryISO: valueOrDefault<String>(
                                                                                                  CountryISOCall.iso(
                                                                                                    (_model.apiResultCountryISO?.jsonBody ?? ''),
                                                                                                  )?.firstOrNull,
                                                                                                  'KW',
                                                                                                ),
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      height: 35.0,
                                                                                      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.secondaryText,
                                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'jm7gsscz' /* Select... */,
                                                                                      ),
                                                                                      searchHintText: FFLocalizations.of(context).getText(
                                                                                        'xitfqop7' /* Search... */,
                                                                                      ),
                                                                                      searchCursorColor: FlutterFlowTheme.of(context).alternate,
                                                                                      icon: Icon(
                                                                                        Icons.keyboard_arrow_down_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 2.0,
                                                                                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      borderWidth: 0.0,
                                                                                      borderRadius: 8.0,
                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                      hidesUnderline: true,
                                                                                      isOverButton: false,
                                                                                      isSearchable: true,
                                                                                      isMultiSelect: false,
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ue4lp2du' /* Building */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.buildingTextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.building,
                                                                                      ),
                                                                                      focusNode: _model.buildingFocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.buildingTextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                building: _model.buildingTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'mp6hwge4' /* Building */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.buildingTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'a9cr07d3' /* Location */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
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
                                                                                                      width: 800.0,
                                                                                                      child: LocationWidget(
                                                                                                        settingsDoc: userInfoSettingsRecord!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.latLong != null
                                                                                            ? userInfoSettingsRecord!.settingsCompanyInfo.wearhouseAddress.latLong!.toString()
                                                                                            : FFLocalizations.of(context).getVariableText(
                                                                                                enText: 'Set Location',
                                                                                                arText: 'تعيين الموقع',
                                                                                              ),
                                                                                        options: FFButtonOptions(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          height: 36.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FFAppState().theme.themeMain.primaryButtoncolor,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child: Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'svaddrblk' /* Block */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.blockTextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.block,
                                                                                      ),
                                                                                      focusNode: _model.blockFocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.blockTextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                block: _model.blockTextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'svaddrblkh' /* Enter block */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      validator: _model.blockTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '93142ib1' /* Logistics Details */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '2mv65l1m' /* Environmental */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                              visualDensity: VisualDensity.compact,
                                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                          child: Checkbox(
                                                                                            value: _model.checkboxValue2 ??= userInfoSettingsRecord?.settingsLogisticsInfo.environment == 'test' ? false : true,
                                                                                            onChanged: (newValue) async {
                                                                                              safeSetState(() => _model.checkboxValue2 = newValue!);
                                                                                              if (newValue!) {
                                                                                                await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                  settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                                    environment: 'prod',
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                              } else {
                                                                                                await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                  settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                                    environment: 'test',
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                              }
                                                                                            },
                                                                                            side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                ? BorderSide(
                                                                                                    width: 2,
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  )
                                                                                                : null,
                                                                                            activeColor: FFAppState().theme.themeMain.primary,
                                                                                            checkColor: FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'w8ealwc4' /* Production Mode */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().theme.themeMain.primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'bj8h9i4h' /* Production Key */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      TextFormField(
                                                                                        controller: _model.productionKeyTextController ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                                        ),
                                                                                        focusNode: _model.productionKeyFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.productionKeyTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                  shippingPhone: _model.productionKeyTextController.text,
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '2xkmj9wc' /* Production Key */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
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
                                                                                        maxLength: 12,
                                                                                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                        buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                        validator: _model.productionKeyTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '7av5rwzx' /* Test Key */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.testKeyTextController1 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsLogisticsInfo.testKey,
                                                                                      ),
                                                                                      focusNode: _model.testKeyFocusNode1,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.testKeyTextController1',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                addressLine1: _model.testKeyTextController1.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '4i2fyl8c' /* Test Key */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
                                                                                        suffixIcon: _model.testKeyTextController1!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.testKeyTextController1?.clear();
                                                                                                  await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                    settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                      wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                        addressLine1: _model.testKeyTextController1.text,
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  ));
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.testKeyTextController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'lri5xeb8' /* Shippng Charges in Kuwait */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.shippngChargesinKuwaitTextController1 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                                        ),
                                                                                        focusNode: _model.shippngChargesinKuwaitFocusNode1,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.shippngChargesinKuwaitTextController1',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                  city: _model.shippngChargesinKuwaitTextController1.text,
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'o2o94ocu' /* Shippng Charges in Kuwait */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
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
                                                                                        validator: _model.shippngChargesinKuwaitTextController1Validator.asValidator(context),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ddmm3foj' /* Production Key */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.testKeyTextController2 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsLogisticsInfo.prodKey,
                                                                                      ),
                                                                                      focusNode: _model.testKeyFocusNode2,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.testKeyTextController2',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                addressLine1: _model.testKeyTextController2.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'g3ctl7ed' /* Production Key */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.testKeyTextController2Validator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'c7n9ifmf' /* Shippng Charges in Kuwait */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.shippngChargesinKuwaitTextController2 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                                        ),
                                                                                        focusNode: _model.shippngChargesinKuwaitFocusNode2,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.shippngChargesinKuwaitTextController2',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                  city: _model.shippngChargesinKuwaitTextController2.text,
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '12oncnbh' /* Shippng Charges in Kuwait */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
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
                                                                                        validator: _model.shippngChargesinKuwaitTextController2Validator.asValidator(context),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'm3imx7ps' /* Test Key */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextFormField(
                                                                                        controller: _model.testKeyTextController3 ??= TextEditingController(
                                                                                          text: userInfoSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                                        ),
                                                                                        focusNode: _model.testKeyFocusNode3,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.testKeyTextController3',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                              settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                                wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                  addressLine1: _model.testKeyTextController3.text,
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        textInputAction: TextInputAction.next,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'bozio3r8' /* Test Key */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          contentPadding: EdgeInsets.all(13.0),
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
                                                                                        validator: _model.testKeyTextController3Validator.asValidator(context),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'czkzaatt' /* Shippng Charges in Kuwait */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.shippngChargesinKuwaitTextController3 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsLogisticsInfo.shippingChargeKuwait.toString(),
                                                                                      ),
                                                                                      focusNode: _model.shippngChargesinKuwaitFocusNode3,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.shippngChargesinKuwaitTextController3',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                city: _model.shippngChargesinKuwaitTextController3.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '3z7pr1i3' /* Shippng Charges in Kuwait */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.shippngChargesinKuwaitTextController3Validator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'gi1a32sp' /* Shippng Charges for 1st Half K... */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.shippngChargesinGCC1TextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsLogisticsInfo.shippingChargeGcc.toString(),
                                                                                      ),
                                                                                      focusNode: _model.shippngChargesinGCC1FocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.shippngChargesinGCC1TextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                postalCode: _model.shippngChargesinGCC1TextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'dly7e4hr' /* Shippng Charges in GCC1 */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.shippngChargesinGCC1TextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'm79xqhjf' /* Shippng Charges for next each ... */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.shippngChargesinGCC2TextController ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsLogisticsInfo.shippingChargeGccExtra.toString(),
                                                                                      ),
                                                                                      focusNode: _model.shippngChargesinGCC2FocusNode,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.shippngChargesinGCC2TextController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsCompanyInfo: createSettingsCompanyInfoStruct(
                                                                                              wearhouseAddress: createUserShippingaddressInfoStruct(
                                                                                                postalCode: _model.shippngChargesinGCC2TextController.text,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '7yyd05v4' /* Shippng Charges in GCC2 */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      cursorColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                      validator: _model.shippngChargesinGCC2TextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ihiipppr' /* Admin Panel Color Theme */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  FFAppState().adminFlow = AdminFlowStruct();
                                                                                  await showDialog(
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
                                                                                              child: ThemeWidget(
                                                                                                status: 'new',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'yuyu4mjn' /* Add */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FFAppState().theme.themeMain.primaryButtoncolor,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 24.0)),
                                                                        ),
                                                                        Wrap(
                                                                          spacing:
                                                                              0.0,
                                                                          runSpacing:
                                                                              0.0,
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
                                                                          children: [
                                                                            StreamBuilder<List<ThemeRecord>>(
                                                                              stream: queryThemeRecord(
                                                                                queryBuilder: (themeRecord) => themeRecord.orderBy('theme_createdAt', descending: true),
                                                                              ),
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
                                                                                List<ThemeRecord> listThemeRecordList = snapshot.data!;

                                                                                return Wrap(
                                                                                  spacing: 16.0,
                                                                                  runSpacing: 16.0,
                                                                                  alignment: WrapAlignment.start,
                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                  direction: Axis.horizontal,
                                                                                  runAlignment: WrapAlignment.start,
                                                                                  verticalDirection: VerticalDirection.down,
                                                                                  clipBehavior: Clip.none,
                                                                                  children: List.generate(listThemeRecordList.length, (listIndex) {
                                                                                    final listThemeRecord = listThemeRecordList[listIndex];
                                                                                    return Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().adminFlow = AdminFlowStruct();
                                                                                          FFAppState().updateAdminFlowStruct(
                                                                                            (e) => e..adminThemeAe = listThemeRecord.themeInfo,
                                                                                          );
                                                                                          await showDialog(
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
                                                                                                      child: ThemeWidget(
                                                                                                        status: 'update',
                                                                                                        themeId: listThemeRecord.themeId,
                                                                                                        themeDoc: listThemeRecord,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 80.0,
                                                                                          height: 80.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                listThemeRecord.themeId.toString(),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                      ),
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 8.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 16.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (FFAppState()
                                                                        .currentUserPermission
                                                                        .contains(
                                                                            _model.permissionKeyAppUpdater) ==
                                                                    true)
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '657zpn7l' /* App Update Notifier */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                          ),
                                                                                          color: valueOrDefault<Color>(
                                                                                            FFAppState().theme.themeMain.primaryText,
                                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).buttonBorder,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(8.0),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    child: SwitchListTile.adaptive(
                                                                                      value: _model.switchListTileValue ??= userInfoSettingsRecord!.settingsAppVersionInfo.dismissibleStatus,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.switchListTileValue = newValue);
                                                                                        if (newValue) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsAppVersionInfo: createSettingsAppVersionInfoStruct(
                                                                                              dismissibleStatus: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsAppVersionInfo: createSettingsAppVersionInfoStruct(
                                                                                              dismissibleStatus: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      title: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'nx8wa5fx' /* Update Dismissible Status */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      activeColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.secondaryBackground,
                                                                                        FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      activeTrackColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      dense: true,
                                                                                      controlAffinity: ListTileControlAffinity.trailing,
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(6.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'xxaikeiv' /* Android app version */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().theme.themeMain.primaryText,
                                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                    ),
                                                                                  ),
                                                                                  TextFormField(
                                                                                    controller: _model.titleTextController9 ??= TextEditingController(
                                                                                      text: userInfoSettingsRecord?.settingsAppVersionInfo.androidVersionInt.toString(),
                                                                                    ),
                                                                                    focusNode: _model.titleFocusNode9,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.titleTextController9',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () async {
                                                                                        await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                          settingsAppVersionInfo: createSettingsAppVersionInfoStruct(
                                                                                            androidVersionInt: int.tryParse(_model.titleTextController9.text),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                      },
                                                                                    ),
                                                                                    autofocus: false,
                                                                                    textInputAction: TextInputAction.next,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      contentPadding: EdgeInsets.all(13.0),
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
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    maxLength: 30,
                                                                                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                    validator: _model.titleTextController9Validator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'n8imf0bv' /* IOS app version */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    TextFormField(
                                                                                      controller: _model.skuTextController6 ??= TextEditingController(
                                                                                        text: userInfoSettingsRecord?.settingsAppVersionInfo.iosVersionInt.toString(),
                                                                                      ),
                                                                                      focusNode: _model.skuFocusNode6,
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.skuTextController6',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () async {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsAppVersionInfo: createSettingsAppVersionInfoStruct(
                                                                                              iosVersionInt: int.tryParse(_model.skuTextController6.text),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                      ),
                                                                                      autofocus: false,
                                                                                      textInputAction: TextInputAction.next,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsets.all(13.0),
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.skuTextController6Validator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Container(
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'rm7qy85f' /* Loyalty Points */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primaryText,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.loyaltySwitchValue ??= userInfoSettingsRecord?.settingsLoyalty.settingsIsLoyaltyStatus == true,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.loyaltySwitchValue = newValue);
                                                                                  if (newValue) {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsLoyalty: createSettingsLoyaltyStruct(
                                                                                        settingsIsLoyaltyStatus: true,
                                                                                        settingsLoyaltyUpdatedAt: getCurrentTimestamp,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  } else {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsLoyalty: createSettingsLoyaltyStruct(
                                                                                        settingsIsLoyaltyStatus: false,
                                                                                        settingsLoyaltyUpdatedAt: getCurrentTimestamp,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  }
                                                                                },
                                                                                activeColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                activeTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.primary,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                inactiveTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.alternate,
                                                                                  FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                inactiveThumbColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                        if (_model.loyaltySwitchValue ??
                                                                            true)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 200.0,
                                                                                  child: Stack(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 200.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.loyaltyRupeeTextController ??= TextEditingController(
                                                                                            text: userInfoSettingsRecord?.settingsLoyalty.settingsLoyaltyRupee.toString(),
                                                                                          ),
                                                                                          focusNode: _model.loyaltyRupeeFocusNode,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.loyaltyRupeeTextController',
                                                                                            Duration(milliseconds: 2000),
                                                                                            () async {
                                                                                              await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                settingsLoyalty: createSettingsLoyaltyStruct(
                                                                                                  settingsLoyaltyRupee: double.tryParse(_model.loyaltyRupeeTextController.text),
                                                                                                  settingsLoyaltyUpdatedAt: getCurrentTimestamp,
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));
                                                                                            },
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          textInputAction: TextInputAction.next,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            isDense: true,
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'kqpo75mo' /* 30 */,
                                                                                            ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            filled: true,
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            contentPadding: EdgeInsets.all(13.0),
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
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                          maxLength: 30,
                                                                                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                          keyboardType: TextInputType.number,
                                                                                          cursorColor: FFAppState().theme.themeMain.primary,
                                                                                          validator: _model.loyaltyRupeeTextControllerValidator.asValidator(context),
                                                                                          inputFormatters: [
                                                                                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'z4zs1c3k' /* KD */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        if (_model.loyaltySwitchValue ??
                                                                            true)
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 200.0,
                                                                                    child: Stack(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 200.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.loyaltyPointNorTextController ??= TextEditingController(
                                                                                              text: userInfoSettingsRecord?.settingsLoyalty.settingsLoyaltyPoint.toString(),
                                                                                            ),
                                                                                            focusNode: _model.loyaltyPointNorFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.loyaltyPointNorTextController',
                                                                                              Duration(milliseconds: 2000),
                                                                                              () async {
                                                                                                await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                  settingsLoyalty: createSettingsLoyaltyStruct(
                                                                                                    settingsLoyaltyPoint: int.tryParse(_model.loyaltyPointNorTextController.text),
                                                                                                    settingsLoyaltyUpdatedAt: getCurrentTimestamp,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                ));
                                                                                              },
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            textInputAction: TextInputAction.next,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'lywk2s2y' /* 50 */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              contentPadding: EdgeInsets.all(13.0),
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
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            maxLength: 30,
                                                                                            buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                            keyboardType: TextInputType.number,
                                                                                            cursorColor: FFAppState().theme.themeMain.primary,
                                                                                            validator: _model.loyaltyPointNorTextControllerValidator.asValidator(context),
                                                                                            inputFormatters: [
                                                                                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '7jed0rwk' /* Points  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            _model.orderCaptureResult =
                                                                                await queryOrdersRecordOnce(
                                                                              queryBuilder: (ordersRecord) => ordersRecord
                                                                                  .where(
                                                                                    'payment_status',
                                                                                    isEqualTo: 'CAPTURED',
                                                                                  )
                                                                                  .where(
                                                                                    'order_status',
                                                                                    isEqualTo: 'CAPTURED',
                                                                                  ),
                                                                            );
                                                                            if (_model.orderCaptureResult!.length >
                                                                                0) {
                                                                              _model.settingsResult = await querySettingsRecordOnce(
                                                                                queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                  'type',
                                                                                  isEqualTo: 'Company',
                                                                                ),
                                                                                singleRecord: true,
                                                                              ).then((s) => s.firstOrNull);
                                                                              if (_model.settingsResult?.settingsLoyalty.settingsIsLoyaltyStatus == true) {
                                                                                _model.idmapResult = await queryIdMapRecordOnce(
                                                                                  queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                    'type',
                                                                                    isEqualTo: 'Main',
                                                                                  ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);
                                                                                _model.orderCount = _model.orderCaptureResult?.length;
                                                                                while (_model.orderCount! > 0) {
                                                                                  if (_model.orderCaptureResult?.elementAtOrNull((_model.orderCount!) - 1)?.orderLoyalty.loyaltyStatus == false) {
                                                                                    unawaited(
                                                                                      () async {
                                                                                        await _model.orderCaptureResult!.elementAtOrNull((_model.orderCount!) - 1)!.reference.update(createOrdersRecordData(
                                                                                              orderLoyalty: createOrderLoyaltyStruct(
                                                                                                loyaltyStatus: true,
                                                                                                updatedAt: getCurrentTimestamp,
                                                                                                mainLoyaltyRupee: _model.settingsResult?.settingsLoyalty.settingsLoyaltyRupee,
                                                                                                mainLoyaltyPoint: _model.settingsResult?.settingsLoyalty.settingsLoyaltyPointMember,
                                                                                                orderCartTotal: _model.orderCaptureResult?.elementAtOrNull((_model.orderCount!) - 1)?.totalPrice,
                                                                                                orderLoyalPoint: ((_model.orderCaptureResult!.elementAtOrNull((_model.orderCount!) - 1)!.totalPrice / _model.settingsResult!.settingsLoyalty.settingsLoyaltyRupee).floor()) * _model.settingsResult!.settingsLoyalty.settingsLoyaltyPointMember,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                      }(),
                                                                                    );
                                                                                    unawaited(
                                                                                      () async {
                                                                                        await _model.orderCaptureResult!.elementAtOrNull((_model.orderCount!) - 1)!.customerRef!.update(createUsersRecordData(
                                                                                              userLoyalty: createUserLoyaltyStruct(
                                                                                                updatedAt: getCurrentTimestamp,
                                                                                                createdAt: getCurrentTimestamp,
                                                                                                fieldValues: {
                                                                                                  'loyalty_total_point': FieldValue.increment(((_model.orderCaptureResult!.elementAtOrNull((_model.orderCount!) - 1)!.totalPrice / _model.settingsResult!.settingsLoyalty.settingsLoyaltyRupee).floor()) * _model.settingsResult!.settingsLoyalty.settingsLoyaltyPointMember),
                                                                                                  'loyalty_present_point': FieldValue.increment(((_model.orderCaptureResult!.elementAtOrNull((_model.orderCount!) - 1)!.totalPrice / _model.settingsResult!.settingsLoyalty.settingsLoyaltyRupee).floor()) * _model.settingsResult!.settingsLoyalty.settingsLoyaltyPointMember),
                                                                                                  'loyalty_history': FieldValue.arrayUnion([
                                                                                                    getUserLoyaltyHistoryFirestoreData(
                                                                                                      createUserLoyaltyHistoryStruct(
                                                                                                        createdAt: getCurrentTimestamp,
                                                                                                        updatedAt: getCurrentTimestamp,
                                                                                                        status: 'active',
                                                                                                        loyaltyHistoryId: _model.idmapResult?.loyaltyHistoryId,
                                                                                                        transactionStatus: 'Credit',
                                                                                                        mainLoyaltyRupee: userInfoSettingsRecord?.settingsLoyalty.settingsLoyaltyRupee,
                                                                                                        mainLoyaltyPoint: _model.settingsResult?.settingsLoyalty.settingsLoyaltyPointMember,
                                                                                                        orderCartTotal: _model.orderCaptureResult?.elementAtOrNull((_model.orderCount!) - 1)?.totalPrice,
                                                                                                        orderLoyalPoint: ((_model.orderCaptureResult!.elementAtOrNull((_model.orderCount!) - 1)!.totalPrice / _model.settingsResult!.settingsLoyalty.settingsLoyaltyRupee).floor()) * _model.settingsResult!.settingsLoyalty.settingsLoyaltyPointMember,
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                      true,
                                                                                                    )
                                                                                                  ]),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                            ));
                                                                                      }(),
                                                                                    );

                                                                                    await _model.idmapResult!.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'loyalty_history_id': FieldValue.increment(1),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  }
                                                                                  _model.orderCount = (_model.orderCount!) - 1;
                                                                                }
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('Loyalty update successfully.'),
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
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('Loyalty not found.'),
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
                                                                              }
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text('No order found.'),
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
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '6ulzye6k' /* Save */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.themeMain.primaryButtoncolor,
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if ((FFAppState()
                                                                            .currentUserPermission
                                                                            .contains(_model
                                                                                .permissionKeyWaiter) ==
                                                                        true) &&
                                                                    (FFAppState()
                                                                            .currentUserPermission
                                                                            .contains(_model.permissionKeyAppSecert) ==
                                                                        true))
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'squb83c7' /* User App Waitlist Feature */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().theme.themeMain.primaryText,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchWaiterValue ??= userInfoSettingsRecord?.settingsSecretFeature.settingsWaitlistFeature == true,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchWaiterValue = newValue);
                                                                                  if (newValue) {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                        settingsWaitlistFeature: true,
                                                                                        settingsSecretFeature: false,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                    safeSetState(() {
                                                                                      _model.switchSecreatValue = false;
                                                                                    });
                                                                                  } else {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                        settingsWaitlistFeature: false,
                                                                                        settingsSecretFeature: userInfoSettingsRecord.settingsSecretFeature.settingsSecretFeature,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  }
                                                                                },
                                                                                activeColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                activeTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.primary,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                inactiveTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.alternate,
                                                                                  FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                inactiveThumbColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((FFAppState()
                                                                            .currentUserPermission
                                                                            .contains(_model
                                                                                .permissionKeyWaiter) ==
                                                                        true) &&
                                                                    (FFAppState()
                                                                            .currentUserPermission
                                                                            .contains(_model
                                                                                .permissionKeyAppSecert) ==
                                                                        true))
                                                                  StreamBuilder<
                                                                      List<
                                                                          SettingsRecord>>(
                                                                    stream:
                                                                        querySettingsRecord(
                                                                      queryBuilder:
                                                                          (settingsRecord) =>
                                                                              settingsRecord.where(
                                                                        'type',
                                                                        isEqualTo:
                                                                            'Company',
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                2.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                Colors.transparent,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<SettingsRecord>
                                                                          secretKeySettingsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      final secretKeySettingsRecord = secretKeySettingsRecordList
                                                                              .isNotEmpty
                                                                          ? secretKeySettingsRecordList
                                                                              .first
                                                                          : null;

                                                                      return Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '7dm61om4' /* User App Secret Key */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final codeList = secretKeySettingsRecord?.settingsSecretFeature.settingsAppAccessList.toList() ?? [];

                                                                                          return Wrap(
                                                                                            spacing: 10.0,
                                                                                            runSpacing: 10.0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.vertical,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: List.generate(codeList.length, (codeListIndex) {
                                                                                              final codeListItem = codeList[codeListIndex];
                                                                                              return Visibility(
                                                                                                visible: secretKeySettingsRecord?.settingsSecretFeature.settingsSecretFeature == true,
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  '${codeListItem.code}',
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          FFAppState().theme.themeMain.primaryText,
                                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                )),
                                                                                              );
                                                                                            }),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    if (secretKeySettingsRecord?.settingsSecretFeature.settingsSecretFeature == true)
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          FFAppState().updateAdminFlowStruct(
                                                                                            (e) => e..settingsSecretFeature = secretKeySettingsRecord?.settingsSecretFeature,
                                                                                          );
                                                                                          while (FFAppState().adminFlow.settingsSecretFeature.settingsAppAccessList.length != 10) {
                                                                                            FFAppState().updateAdminFlowStruct(
                                                                                              (e) => e..random = random_data.randomInteger(100000, 999999).toString(),
                                                                                            );
                                                                                            if (FFAppState().adminFlow.settingsSecretFeature.settingsAppAccessList.where((e) => e.code == FFAppState().adminFlow.random).toList().length == 0) {
                                                                                              FFAppState().updateAdminFlowStruct(
                                                                                                (e) => e
                                                                                                  ..updateSettingsSecretFeature(
                                                                                                    (e) => e
                                                                                                      ..updateSettingsAppAccessList(
                                                                                                        (e) => e.add(SettingsAppAccessDataStruct(
                                                                                                          createdAt: getCurrentTimestamp,
                                                                                                          updatedAt: getCurrentTimestamp,
                                                                                                          createdBy: currentUserReference,
                                                                                                          code: FFAppState().adminFlow.random,
                                                                                                          status: 'Pending',
                                                                                                          validity: functions.getDateForSubscription(functions.presentDateFromZerotime(), 5),
                                                                                                        )),
                                                                                                      ),
                                                                                                  ),
                                                                                              );
                                                                                            }
                                                                                            FFAppState().updateAdminFlowStruct(
                                                                                              (e) => e..refresh = FFAppState().adminFlow.refresh + 1,
                                                                                            );
                                                                                          }

                                                                                          await secretKeySettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsSecretFeature: updateSettingsAppAccessStruct(
                                                                                              FFAppState().adminFlow.settingsSecretFeature,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'trrhp9gk' /* Generate */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FFAppState().theme.themeMain.primaryButtoncolor,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 65.0,
                                                                                    child: Switch.adaptive(
                                                                                      value: _model.switchSecreatValue ??= secretKeySettingsRecord?.settingsSecretFeature.settingsSecretFeature == true,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.switchSecreatValue = newValue);
                                                                                        if (newValue) {
                                                                                          FFAppState().updateAdminFlowStruct(
                                                                                            (e) => e..settingsSecretFeature = secretKeySettingsRecord?.settingsSecretFeature,
                                                                                          );
                                                                                          FFAppState().updateAdminFlowStruct(
                                                                                            (e) => e
                                                                                              ..updateSettingsSecretFeature(
                                                                                                (e) => e..settingsSecretFeature = true,
                                                                                              ),
                                                                                          );

                                                                                          await secretKeySettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsSecretFeature: updateSettingsAppAccessStruct(
                                                                                              FFAppState().adminFlow.settingsSecretFeature,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));

                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                              settingsWaitlistFeature: false,
                                                                                              settingsSecretFeature: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                          safeSetState(() {
                                                                                            _model.switchWaiterValue = false;
                                                                                          });
                                                                                        } else {
                                                                                          FFAppState().updateAdminFlowStruct(
                                                                                            (e) => e..settingsSecretFeature = secretKeySettingsRecord?.settingsSecretFeature,
                                                                                          );
                                                                                          FFAppState().updateAdminFlowStruct(
                                                                                            (e) => e
                                                                                              ..updateSettingsSecretFeature(
                                                                                                (e) => e..settingsSecretFeature = false,
                                                                                              ),
                                                                                          );

                                                                                          await secretKeySettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsSecretFeature: updateSettingsAppAccessStruct(
                                                                                              FFAppState().adminFlow.settingsSecretFeature,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));

                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                              settingsWaitlistFeature: userInfoSettingsRecord.settingsSecretFeature.settingsWaitlistFeature,
                                                                                              settingsSecretFeature: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      activeColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.secondaryBackground,
                                                                                        FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      activeTrackColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primary,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      inactiveTrackColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.alternate,
                                                                                        FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                      inactiveThumbColor: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.secondaryBackground,
                                                                                        FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                Container(
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'zklxz0et' /* Custom Promotion Duration */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: FFAppState().theme.themeMain.primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 200.0,
                                                                                  child: Stack(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 200.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.promotionDaysTextController ??= TextEditingController(
                                                                                            text: valueOrDefault<String>(
                                                                                              userInfoSettingsRecord?.settingsCustomPromotionDuration.toString(),
                                                                                              '-',
                                                                                            ),
                                                                                          ),
                                                                                          focusNode: _model.promotionDaysFocusNode,
                                                                                          autofocus: false,
                                                                                          textInputAction: TextInputAction.next,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            isDense: true,
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.secondaryText,
                                                                                                    FlutterFlowTheme.of(context).secondaryText,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'ksmzbvh8' /* 10 */,
                                                                                            ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.secondaryText,
                                                                                                    FlutterFlowTheme.of(context).secondaryText,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            filled: true,
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            contentPadding: EdgeInsets.all(13.0),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                          maxLength: 30,
                                                                                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                          keyboardType: TextInputType.number,
                                                                                          cursorColor: FFAppState().theme.themeMain.primary,
                                                                                          validator: _model.promotionDaysTextControllerValidator.asValidator(context),
                                                                                          inputFormatters: [
                                                                                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'c8ygh3wc' /* Days */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                  ),
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsCustomPromotionDuration: int.tryParse(_model.promotionDaysTextController.text),
                                                                              ));
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'h4jd717y' /* Save */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 30.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.primaryButtoncolor,
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                    color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: BorderSide(
                                                                                color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                        .currentUserPermission
                                                                        .contains(
                                                                            _model.permissionKeyPayment) ==
                                                                    true)
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'k9ik1wg3' /* OTP Sent by */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    color: FFAppState().theme.themeMain.primaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.otpValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.otpValue ??= userInfoSettingsRecord?.settingsOtpService,
                                                                            ),
                                                                            options: [
                                                                              FFLocalizations.of(context).getText(
                                                                                'pk7li5xg' /* otpless */,
                                                                              ),
                                                                              FFLocalizations.of(context).getText(
                                                                                '08b9e02n' /* firebase */,
                                                                              )
                                                                            ],
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.otpValue = val);
                                                                              await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                settingsOtpService: _model.otpValue,
                                                                              ));
                                                                            },
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                36.0,
                                                                            maxHeight:
                                                                                200.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '48pd6zu6' /* Select... */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            borderWidth:
                                                                                1.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                24.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    '${FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'OTP is sent from ',
                                                                                      arText: 'تم إرسال OTP من',
                                                                                    )}${userInfoSettingsRecord?.settingsOtpService}',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: valueOrDefault<Color>(
                                                                                            FFAppState().theme.themeMain.primaryText,
                                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                  )),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .currentUserPermission
                                                                        .contains(
                                                                            _model.permissionKeyCatalog) ==
                                                                    true)
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ie2fmtfr' /* In App-purchase */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: FFAppState().theme.themeMain.primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchValue1 ??= userInfoSettingsRecord!.settingsInappPurchaseStatus,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue1 = newValue);
                                                                                  if (newValue) {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsInappPurchaseStatus: true,
                                                                                    ));
                                                                                  } else {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsInappPurchaseStatus: false,
                                                                                    ));
                                                                                  }
                                                                                },
                                                                                activeColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                activeTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.primary,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                inactiveTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.alternate,
                                                                                  FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                inactiveThumbColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Container(
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'secpfijp' /* App Catalog Mode */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                      color: FFAppState().theme.themeMain.primaryText,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Switch.adaptive(
                                                                              value: _model.switchValue2 ??= userInfoSettingsRecord!.settingsSecretFeature.settingsCatllogFeature,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.switchValue2 = newValue);
                                                                                if (newValue) {
                                                                                  await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                    settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                      settingsCatllogFeature: true,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                } else {
                                                                                  await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                    settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                      settingsCatllogFeature: false,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                }
                                                                              },
                                                                              activeColor: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.secondaryBackground,
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              activeTrackColor: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.primary,
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              inactiveTrackColor: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.alternate,
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              inactiveThumbColor: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.secondaryBackground,
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                        .currentUserPermission
                                                                        .contains(
                                                                            _model.permissionKey) ==
                                                                    true)
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ho2d7bb4' /* Category Status */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: FFAppState().theme.themeMain.primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchValue3 ??= userInfoSettingsRecord!.settingsSecretFeature.settingsCategoryFeature,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue3 = newValue);
                                                                                  if (newValue) {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                        settingsCategoryFeature: true,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  } else {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsSecretFeature: createSettingsAppAccessStruct(
                                                                                        settingsCategoryFeature: false,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  }
                                                                                },
                                                                                activeColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                activeTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.primary,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                inactiveTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.alternate,
                                                                                  FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                inactiveThumbColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .border,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'gak5yeza' /* Phone OTP Status */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: FFAppState().theme.themeMain.primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Switch.adaptive(
                                                                                value: _model.switchValue4 ??= userInfoSettingsRecord!.settingsInappPurchaseStatus,
                                                                                onChanged: (newValue) async {
                                                                                  safeSetState(() => _model.switchValue4 = newValue);
                                                                                  if (newValue) {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsPhoneOtpStatus: true,
                                                                                    ));
                                                                                  } else {
                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                      settingsPhoneOtpStatus: false,
                                                                                    ));
                                                                                  }
                                                                                },
                                                                                activeColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                activeTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.primary,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                inactiveTrackColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.alternate,
                                                                                  FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                inactiveThumbColor: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).border,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(24.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'h16lkder' /* Current App Version */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'sabouaig' /* IOS */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    userInfoSettingsRecord!.settingsAppVersionInfo.iosVersionString,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'iu4h1qv9' /* Android */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  userInfoSettingsRecord.settingsAppVersionInfo.androidVersionString,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                  ],
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
