import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/onboard/creator_space_banner_add/creator_space_banner_add_widget.dart';
import '/phase1/onboard/creator_space_banner_edit/creator_space_banner_edit_widget.dart';
import '/phase1/onboard/home_setting_banner_add/home_setting_banner_add_widget.dart';
import '/phase1/onboard/home_setting_banner_edit/home_setting_banner_edit_widget.dart';
import '/phase1/onboard/home_setting_category/home_setting_category_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_setting_model.dart';
export 'home_setting_model.dart';

class HomeSettingWidget extends StatefulWidget {
  const HomeSettingWidget({super.key});

  static String routeName = 'home_setting';
  static String routePath = '/azyaa-home-settings';

  @override
  State<HomeSettingWidget> createState() => _HomeSettingWidgetState();
}

class _HomeSettingWidgetState extends State<HomeSettingWidget> {
  late HomeSettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSettingModel());

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
        title: 'home_setting',
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
                                            width: 2.0,
                                            height: 2.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Colors.transparent,
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
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'yvxyaqrn' /* Settings */,
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
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'aqqdmlmv' /* Homepage Options */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .theme
                                                                            .themeMain
                                                                            .secondaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
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
                                                              'mpsld715' /* Reset to default */,
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
                                                              color: Color(
                                                                  0xFFE3E3E3),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
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
                                                            onPressed:
                                                                () async {
                                                              await userInfoSettingsRecord!
                                                                  .reference
                                                                  .update(
                                                                      createSettingsRecordData(
                                                                settingsHome:
                                                                    createSettingsHomeStruct(
                                                                  settingsIsSearchStatus:
                                                                      _model
                                                                          .searchSwitchStatusValue,
                                                                  settingsIsBagStatus:
                                                                      _model
                                                                          .barSwitchStatusValue,
                                                                  settingsIsRecentviewWidgetStatus:
                                                                      _model
                                                                          .recentSwitchStatusValue,
                                                                  settingsIsRecommendedWidgetStatus:
                                                                      _model
                                                                          .recommendedSwitchStatusValue,
                                                                  settingsIsCategoryWidgetStatus:
                                                                      _model
                                                                          .categorySwitchStatusValue,
                                                                  settingsIsBannerlistWidgetStatus:
                                                                      _model
                                                                          .bannerSwitchStatusValue1,
                                                                  settingsIsNewStatus:
                                                                      _model
                                                                          .newSwitchStatusValue,
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                              context.safePop();
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ma7b0xop' /* Save changes */,
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
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.productTypeValueController1 ??=
                                                                                FormFieldController<String>(null),
                                                                            options: <String>[],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.productTypeValue1 = val),
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                36.0,
                                                                            maxHeight:
                                                                                120.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'lquu8x3v' /* Level 01 */,
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: 333.0,
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
                                                                                      value: _model.searchSwitchStatusValue ??= userInfoSettingsRecord!.settingsHome.settingsIsSearchStatus,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.searchSwitchStatusValue = newValue);
                                                                                        if (newValue) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsSearchStatus: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsSearchStatus: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      title: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'pzl2hd5n' /* Search Bar on Homepage */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
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
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: 333.0,
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
                                                                                      value: _model.barSwitchStatusValue ??= userInfoSettingsRecord!.settingsHome.settingsIsBagStatus,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.barSwitchStatusValue = newValue);
                                                                                        if (newValue) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsBagStatus: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsBagStatus: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      title: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'd8m74zi9' /* Bag on Homepage */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
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
                                                                          ].divide(SizedBox(width: 16.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 16.0)),
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
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
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
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.productTypeValueController2 ??=
                                                                                FormFieldController<String>(null),
                                                                            options: <String>[],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.productTypeValue2 = val),
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                36.0,
                                                                            maxHeight:
                                                                                120.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '8q4jy9pr' /* Level 01 */,
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
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                SwitchListTile.adaptive(
                                                                              value: _model.categorySwitchStatusValue ??= userInfoSettingsRecord!.settingsHome.settingsIsCategoryWidgetStatus,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.categorySwitchStatusValue = newValue);
                                                                                if (newValue) {
                                                                                  await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                    settingsHome: createSettingsHomeStruct(
                                                                                      settingsIsCategoryWidgetStatus: true,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                } else {
                                                                                  await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                    settingsHome: createSettingsHomeStruct(
                                                                                      settingsIsCategoryWidgetStatus: false,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                }
                                                                              },
                                                                              title: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'pnqnnoye' /* Categories on Homepage */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primaryText,
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              activeColor: FFAppState().theme.themeMain.secondaryBackground,
                                                                              activeTrackColor: FFAppState().theme.themeMain.primary,
                                                                              dense: true,
                                                                              controlAffinity: ListTileControlAffinity.trailing,
                                                                              contentPadding: EdgeInsets.all(0.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (_model.categorySwitchStatusValue ??
                                                                            true)
                                                                          Expanded(
                                                                            child:
                                                                                StreamBuilder<List<CategoryRecord>>(
                                                                              stream: queryCategoryRecord(
                                                                                queryBuilder: (categoryRecord) => categoryRecord
                                                                                    .where(
                                                                                      'status',
                                                                                      isEqualTo: 'active',
                                                                                    )
                                                                                    .orderBy('category_id', descending: true),
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
                                                                                List<CategoryRecord> gridViewCategoryRecordList = snapshot.data!;

                                                                                return GridView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                    crossAxisCount: 5,
                                                                                    crossAxisSpacing: 10.0,
                                                                                    mainAxisSpacing: 10.0,
                                                                                    childAspectRatio: 3.7,
                                                                                  ),
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: gridViewCategoryRecordList.length,
                                                                                  itemBuilder: (context, gridViewIndex) {
                                                                                    final gridViewCategoryRecord = gridViewCategoryRecordList[gridViewIndex];
                                                                                    return HomeSettingCategoryWidget(
                                                                                      key: Key('Key27a_${gridViewIndex}_of_${gridViewCategoryRecordList.length}'),
                                                                                      settings: userInfoSettingsRecord!,
                                                                                      category: gridViewCategoryRecord,
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
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
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.productTypeValueController3 ??=
                                                                                FormFieldController<String>(null),
                                                                            options: <String>[],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.productTypeValue3 = val),
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                36.0,
                                                                            maxHeight:
                                                                                120.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'qzbfc1r3' /* Level 01 */,
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
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  child: SwitchListTile.adaptive(
                                                                                    value: _model.bannerSwitchStatusValue1 ??= userInfoSettingsRecord!.settingsHome.settingsIsBannerlistWidgetStatus,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.bannerSwitchStatusValue1 = newValue);
                                                                                      if (newValue) {
                                                                                        await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                          settingsHome: createSettingsHomeStruct(
                                                                                            settingsIsBannerlistWidgetStatus: true,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                      } else {
                                                                                        await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                          settingsHome: createSettingsHomeStruct(
                                                                                            settingsIsBannerlistWidgetStatus: false,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                      }
                                                                                    },
                                                                                    title: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'qnqxbzsa' /* Main Banner Slider */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    activeColor: FFAppState().theme.themeMain.secondaryBackground,
                                                                                    activeTrackColor: FFAppState().theme.themeMain.primary,
                                                                                    dense: true,
                                                                                    controlAffinity: ListTileControlAffinity.trailing,
                                                                                    contentPadding: EdgeInsets.all(0.0),
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().updateAdminFlowStruct(
                                                                                      (e) => e
                                                                                        ..updateProduct(
                                                                                          (e) => e
                                                                                            ..updateProductInfo(
                                                                                              (e) => e
                                                                                                ..featureImage = null
                                                                                                ..featureImageId = null,
                                                                                            ),
                                                                                        ),
                                                                                    );
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
                                                                                                width: 500.0,
                                                                                                child: HomeSettingBannerAddWidget(
                                                                                                  settings: userInfoSettingsRecord!,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'xb9qrn4g' /* Add */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 30.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FFAppState().theme.themeMain.primaryButtoncolor,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final sliderList = userInfoSettingsRecord?.settingsHome.settingsBannerInfoList.toList() ?? [];

                                                                              return GridView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                  crossAxisCount: 3,
                                                                                  crossAxisSpacing: 10.0,
                                                                                  mainAxisSpacing: 10.0,
                                                                                  childAspectRatio: 2.2,
                                                                                ),
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: sliderList.length,
                                                                                itemBuilder: (context, sliderListIndex) {
                                                                                  final sliderListItem = sliderList[sliderListIndex];
                                                                                  return Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 165.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).border,
                                                                                          ),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(16.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      sliderListItem.name,
                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FFAppState().theme.themeMain.primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                    )),
                                                                                                    Container(
                                                                                                      width: 180.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        sliderListItem.shortDescription,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                              ),
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Image.network(
                                                                                                      getCORSProxyUrl(
                                                                                                        sliderListItem.featureImage,
                                                                                                      ),
                                                                                                      width: 150.0,
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(1.0, 1.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                                              child: Builder(
                                                                                                builder: (context) => Padding(
                                                                                                  padding: EdgeInsets.all(4.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderRadius: 8.0,
                                                                                                    buttonSize: 32.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    icon: Icon(
                                                                                                      Icons.edit_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      FFAppState().updateAdminFlowStruct(
                                                                                                        (e) => e
                                                                                                          ..updateProduct(
                                                                                                            (e) => e
                                                                                                              ..updateProductInfo(
                                                                                                                (e) => e
                                                                                                                  ..featureImage = sliderListItem.featureImage
                                                                                                                  ..featureImageId = sliderListItem.featureImageId,
                                                                                                              ),
                                                                                                          ),
                                                                                                      );
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
                                                                                                                  width: 500.0,
                                                                                                                  child: HomeSettingBannerEditWidget(
                                                                                                                    settings: userInfoSettingsRecord!,
                                                                                                                    index: sliderListIndex,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 32.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  icon: Icon(
                                                                                                    FFIcons.kdelete,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                      settingsHome: createSettingsHomeStruct(
                                                                                                        fieldValues: {
                                                                                                          'settings_banner_info_list': FieldValue.arrayRemove([
                                                                                                            getInfoFirestoreData(
                                                                                                              updateInfoStruct(
                                                                                                                sliderListItem,
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                              true,
                                                                                                            )
                                                                                                          ]),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 32.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  icon: Icon(
                                                                                                    Icons.translate,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    context.pushNamed(
                                                                                                      TranslationBannerWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'type': serializeParam(
                                                                                                          'settings',
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'settingHomeBanner': serializeParam(
                                                                                                          userInfoSettingsRecord?.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                        'index': serializeParam(
                                                                                                          sliderListIndex,
                                                                                                          ParamType.int,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
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
                                                                              16.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  child: SwitchListTile.adaptive(
                                                                                    value: _model.bannerSwitchStatusValue2 ??= userInfoSettingsRecord!.settingsHome.settingIsCreatorBannnerWidgetStatus,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.bannerSwitchStatusValue2 = newValue);
                                                                                      if (newValue) {
                                                                                        await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                          settingsHome: createSettingsHomeStruct(
                                                                                            settingIsCreatorBannnerWidgetStatus: true,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                      } else {
                                                                                        await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                          settingsHome: createSettingsHomeStruct(
                                                                                            settingIsCreatorBannnerWidgetStatus: false,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                      }
                                                                                    },
                                                                                    title: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ypyieb74' /* Creator Banner Slider */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    activeColor: FFAppState().theme.themeMain.secondaryBackground,
                                                                                    activeTrackColor: FFAppState().theme.themeMain.primary,
                                                                                    dense: true,
                                                                                    controlAffinity: ListTileControlAffinity.trailing,
                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().updateAdminFlowStruct(
                                                                                      (e) => e
                                                                                        ..updateProduct(
                                                                                          (e) => e
                                                                                            ..updateProductInfo(
                                                                                              (e) => e
                                                                                                ..featureImage = null
                                                                                                ..featureImageId = null,
                                                                                            ),
                                                                                        ),
                                                                                    );
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
                                                                                                width: 500.0,
                                                                                                child: CreatorSpaceBannerAddWidget(
                                                                                                  settings: userInfoSettingsRecord!,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '5kdsexq3' /* Add */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 30.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FFAppState().theme.themeMain.primaryButtoncolor,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                          ),
                                                                                          color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final creatorSliderList = userInfoSettingsRecord?.settingsHome.settingsCreatorBannerInfoList.toList() ?? [];

                                                                              return GridView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                  crossAxisCount: 3,
                                                                                  crossAxisSpacing: 10.0,
                                                                                  mainAxisSpacing: 10.0,
                                                                                  childAspectRatio: 2.2,
                                                                                ),
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: creatorSliderList.length,
                                                                                itemBuilder: (context, creatorSliderListIndex) {
                                                                                  final creatorSliderListItem = creatorSliderList[creatorSliderListIndex];
                                                                                  return Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 165.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).border,
                                                                                          ),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(16.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      creatorSliderListItem.name,
                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FFAppState().theme.themeMain.primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                    )),
                                                                                                    Container(
                                                                                                      width: 180.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        creatorSliderListItem.shortDescription,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                              ),
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Image.network(
                                                                                                      getCORSProxyUrl(
                                                                                                        creatorSliderListItem.featureImage,
                                                                                                      ),
                                                                                                      width: 150.0,
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(1.0, 1.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 4.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                                              child: Builder(
                                                                                                builder: (context) => Padding(
                                                                                                  padding: EdgeInsets.all(4.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderRadius: 8.0,
                                                                                                    buttonSize: 32.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    icon: Icon(
                                                                                                      Icons.edit_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      FFAppState().updateAdminFlowStruct(
                                                                                                        (e) => e
                                                                                                          ..updateProduct(
                                                                                                            (e) => e
                                                                                                              ..updateProductInfo(
                                                                                                                (e) => e
                                                                                                                  ..featureImage = creatorSliderListItem.featureImage
                                                                                                                  ..featureImageId = creatorSliderListItem.featureImageId,
                                                                                                              ),
                                                                                                          ),
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
                                                                                                                  width: 500.0,
                                                                                                                  child: CreatorSpaceBannerEditWidget(
                                                                                                                    settings: userInfoSettingsRecord!,
                                                                                                                    index: creatorSliderListIndex,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 32.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  icon: Icon(
                                                                                                    FFIcons.kdelete,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                                      settingsHome: createSettingsHomeStruct(
                                                                                                        fieldValues: {
                                                                                                          'settings_creator_banner_info_list': FieldValue.arrayRemove([
                                                                                                            getInfoFirestoreData(
                                                                                                              updateInfoStruct(
                                                                                                                creatorSliderListItem,
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                              true,
                                                                                                            )
                                                                                                          ]),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 32.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  icon: Icon(
                                                                                                    Icons.translate,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    context.pushNamed(
                                                                                                      TranslationCreatorBannerWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'type': serializeParam(
                                                                                                          'settings',
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'settingCreatorBanner': serializeParam(
                                                                                                          userInfoSettingsRecord?.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                        'index': serializeParam(
                                                                                                          creatorSliderListIndex,
                                                                                                          ParamType.int,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
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
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.productTypeValueController4 ??=
                                                                                FormFieldController<String>(null),
                                                                            options: <String>[],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.productTypeValue4 = val),
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                36.0,
                                                                            maxHeight:
                                                                                120.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'itpd7jja' /* Level 01 */,
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: 333.0,
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
                                                                                      value: _model.recentSwitchStatusValue ??= userInfoSettingsRecord!.settingsHome.settingsIsRecentviewWidgetStatus,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.recentSwitchStatusValue = newValue);
                                                                                        if (newValue) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsRecentviewWidgetStatus: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsRecentviewWidgetStatus: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      title: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'rz2ppy0x' /* Recently Viewed */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      activeColor: FFAppState().theme.themeMain.secondaryBackground,
                                                                                      activeTrackColor: FFAppState().theme.themeMain.primary,
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
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: 333.0,
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
                                                                                      value: _model.recommendedSwitchStatusValue ??= userInfoSettingsRecord!.settingsHome.settingsIsRecommendedWidgetStatus,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.recommendedSwitchStatusValue = newValue);
                                                                                        if (newValue) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsRecommendedWidgetStatus: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsRecommendedWidgetStatus: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      title: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '5dr1d2bz' /* Recommended for You */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      activeColor: FFAppState().theme.themeMain.secondaryBackground,
                                                                                      activeTrackColor: FFAppState().theme.themeMain.primary,
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
                                                                          ].divide(SizedBox(width: 16.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: 333.0,
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
                                                                                      value: _model.newSwitchStatusValue ??= userInfoSettingsRecord!.settingsHome.settingsIsNewStatus,
                                                                                      onChanged: (newValue) async {
                                                                                        safeSetState(() => _model.newSwitchStatusValue = newValue);
                                                                                        if (newValue) {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsNewStatus: true,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        } else {
                                                                                          await userInfoSettingsRecord!.reference.update(createSettingsRecordData(
                                                                                            settingsHome: createSettingsHomeStruct(
                                                                                              settingsIsNewStatus: false,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                        }
                                                                                      },
                                                                                      title: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '4sotep0t' /* Newly launched */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      activeColor: FFAppState().theme.themeMain.secondaryBackground,
                                                                                      activeTrackColor: FFAppState().theme.themeMain.primary,
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
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 16.0)),
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
