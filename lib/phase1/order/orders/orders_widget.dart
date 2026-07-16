import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/component/blank_loading/blank_loading_widget.dart';
import '/phase1/inventory/timeline_for_inventory/timeline_for_inventory_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'orders_model.dart';
export 'orders_model.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  static String routeName = 'Orders';
  static String routePath = '/azyaa-orders';

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  late OrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) !=
          true) {
        context.goNamed(Error404Widget.routeName);
      }
    });

    _model.serachTextController ??= TextEditingController();
    _model.serachFocusNode ??= FocusNode();

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
        title: 'Orders',
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
                                  menuname: 'Orders',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FutureBuilder<List<OrdersRecord>>(
                                    future: queryOrdersRecordOnce(
                                      queryBuilder: (ordersRecord) =>
                                          ordersRecord.orderBy('created_at',
                                              descending: true),
                                      limit: 500,
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
                                      List<OrdersRecord>
                                          ordersOrdersRecordList =
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
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'cadko3fr' /* Orders */,
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
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'zqpayald' /* Export */,
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
                                                          color:
                                                              Color(0xFFCBCBCB),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
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
                                                            color: Color(
                                                                0xFFCBCBCB),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 130.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFCBCBCB),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'uiiyf2vl' /* More Actions */,
                                                            )
                                                          ],
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.dropDownValue =
                                                                      val),
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
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
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'za2425bn' /* More Actions */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          FilterordersWidget
                                                              .routeName);
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '2tv7ymec' /* Filterable Orders */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 36.0,
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
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState()
                                                                    .theme
                                                                    .themeMain
                                                                    .primaryButtonTextColor,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
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
                                                          BorderRadius.circular(
                                                              8.0),
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
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: () {
                                                                    if ((FFAppState().currentUserRoleKey ==
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'en')) {
                                                                      return _model
                                                                          .designerCChoicechips;
                                                                    } else if ((FFAppState().currentUserRoleKey ==
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'ar')) {
                                                                      return _model
                                                                          .designerChoicechipsAR;
                                                                    } else if ((FFAppState().currentUserRoleKey !=
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'en')) {
                                                                      return _model
                                                                          .adminChoicechips;
                                                                    } else if ((FFAppState().currentUserRoleKey !=
                                                                            'designer') &&
                                                                        (FFLocalizations.of(context).languageCode ==
                                                                            'ar')) {
                                                                      return _model
                                                                          .adminChoicechipsAR;
                                                                    } else if (FFAppState()
                                                                            .currentUserRoleKey ==
                                                                        'designer') {
                                                                      return _model
                                                                          .designerCChoicechips;
                                                                    } else {
                                                                      return _model
                                                                          .adminChoicechips;
                                                                    }
                                                                  }()
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.choiceChipsFilterValue =
                                                                            val?.firstOrNull);
                                                                    if ((_model.choiceChipsFilterValue ==
                                                                            'Unpaid') ||
                                                                        (_model.choiceChipsFilterValue ==
                                                                            'غير مدفوعة الأجر')) {
                                                                      _model.choice =
                                                                          'Unpaid';
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      if ((_model.choiceChipsFilterValue ==
                                                                              'All') ||
                                                                          (_model.choiceChipsFilterValue ==
                                                                              'الجميع')) {
                                                                        _model.choice =
                                                                            'All';
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        if ((_model.choiceChipsFilterValue ==
                                                                                'Paid') ||
                                                                            (_model.choiceChipsFilterValue ==
                                                                                'مدفوع')) {
                                                                          _model.choice =
                                                                              'Paid';
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          if ((_model.choiceChipsFilterValue == 'Delivery Ongoing') ||
                                                                              (_model.choiceChipsFilterValue == 'التسليم مستمر')) {
                                                                            _model.choice =
                                                                                'Delivery Ongoing';
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            if ((_model.choiceChipsFilterValue == 'Pickup request') ||
                                                                                (_model.choiceChipsFilterValue == 'طلب الاستلام')) {
                                                                              _model.choice = 'Pickup request';
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              if ((_model.choiceChipsFilterValue == 'Create Shipping') || (_model.choiceChipsFilterValue == 'إنشاء الشحن')) {
                                                                                _model.choice = 'Create Shipping';
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                if ((_model.choiceChipsFilterValue == 'Delivered') || (_model.choiceChipsFilterValue == 'تم التوصيل')) {
                                                                                  _model.choice = 'Delivered';
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  if ((_model.choiceChipsFilterValue == 'Picked Up') || (_model.choiceChipsFilterValue == 'تام الاستلام')) {
                                                                                    _model.choice = 'Picked Up';
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    if ((_model.choiceChipsFilterValue == 'Ready to Pickup') || (_model.choiceChipsFilterValue == 'جاهز للاستلام')) {
                                                                                      _model.choice = 'Ready to Pickup';
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      if ((_model.choiceChipsFilterValue == 'Tailoring') || (_model.choiceChipsFilterValue == 'قائد الفصل')) {
                                                                                        _model.choice = 'Tailoring';
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    iconSize:
                                                                        0.0,
                                                                    labelPadding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    iconSize:
                                                                        0.0,
                                                                    labelPadding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      8.0,
                                                                  rowSpacing:
                                                                      8.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsFilterValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsFilterValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'lb3j1iik' /* All */,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  wrapped: true,
                                                                ),
                                                              ),
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
                                                                            .serachTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .serachFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.serachTextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () async {
                                                                        if (_model.serachTextController.text !=
                                                                            '') {
                                                                          safeSetState(() =>
                                                                              _model.algoliaSearchResults = null);
                                                                          await OrdersRecord
                                                                              .search(
                                                                            term:
                                                                                _model.serachTextController.text,
                                                                          ).then((r) => _model.algoliaSearchResults = r).onError((_, __) => _model.algoliaSearchResults = []).whenComplete(() =>
                                                                              safeSetState(() {}));

                                                                          _model.searchStatus =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          _model.searchStatus =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                    ),
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
                                                                        'mjnbo2xb' /* Search... */,
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
                                                                              FlutterFlowTheme.of(context).primaryText,
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
                                                                            .secondaryText,
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
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    cursorColor: FFAppState()
                                                                        .theme
                                                                        .themeMain
                                                                        .primary,
                                                                    validator: _model
                                                                        .serachTextControllerValidator
                                                                        .asValidator(
                                                                            context),
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
                                                                desktop: false,
                                                              ))
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  icon: Icon(
                                                                    Icons.south,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
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
                                                        if ((_model.choice ==
                                                                'All') ||
                                                            (_model.choice ==
                                                                'Paid') ||
                                                            (_model.choice ==
                                                                'Unpaid') ||
                                                            (_model.choice ==
                                                                'Tailoring') ||
                                                            (_model.choice ==
                                                                'Ready to Pickup') ||
                                                            (_model.choice ==
                                                                'Picked Up'))
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final orderList = (_model.searchStatus == true
                                                                              ? _model.algoliaSearchResults
                                                                                  ?.where((e) => () {
                                                                                        if (_model.choice == 'Paid') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true));
                                                                                        } else if (_model.choice == 'Unpaid') {
                                                                                          return ((e.paymentStatus != 'CAPTURED') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true));
                                                                                        } else if (_model.choice == 'Tailoring') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.createdAt == null) && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : false) && ((e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().length > 0) || (e.orderItems.cartItems.where((e) => e.productStockInfo.isPreferredVendor == false).toList().length > 0)));
                                                                                        } else if (_model.choice == 'Ready to Pickup') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.status == 'Ready to Pickup') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : false));
                                                                                        } else if (_model.choice == 'Picked Up') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.status == 'Processing') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : false));
                                                                                        } else {
                                                                                          return (((e.paymentStatus != '') || (e.orderStatus != '')) && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true));
                                                                                        }
                                                                                      }())
                                                                                  .toList()
                                                                              : ordersOrdersRecordList
                                                                                  .where((e) => () {
                                                                                        if (_model.choice == 'Paid') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true));
                                                                                        } else if (_model.choice == 'Unpaid') {
                                                                                          return ((e.paymentStatus != 'CAPTURED') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true));
                                                                                        } else if (_model.choice == 'Tailoring') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true) && ((e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().length > 0) || (e.orderItems.cartItems.where((e) => e.productStockInfo.isPreferredVendor == false).toList().length > 0)) && (e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.status == null || e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.status == ''));
                                                                                        } else if (_model.choice == 'Ready to Pickup') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.status == 'Ready to Pickup') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : false));
                                                                                        } else if (_model.choice == 'Picked Up') {
                                                                                          return ((e.paymentStatus == 'CAPTURED') && (e.orderItems.cartItems.where((e) => e.productMainType == 'custom').toList().firstOrNull?.productPickupInfo.status == 'Processing') && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : false));
                                                                                        } else {
                                                                                          return (((e.paymentStatus != '') || (e.orderStatus != '')) && (FFAppState().currentUserRoleKey == 'designer' ? (e.orderItems.cartItems.where((e) => e.productDesignerId == currentUserUid).toList().length > 0) : true));
                                                                                        }
                                                                                      }())
                                                                                  .toList())
                                                                          ?.toList() ??
                                                                      [];
                                                                  if (orderList
                                                                      .isEmpty) {
                                                                    return EmptyWidget(
                                                                      messageOne:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'bf0knboq' /* All caught up! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'wlqhmaex' /* There are no pending payments ... */,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return FlutterFlowDataTable<
                                                                      OrdersRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController1,
                                                                    data:
                                                                        orderList,
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '9ehe1nhf' /* Order ID */,
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
                                                                              'jmcjgepk' /* Date */,
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
                                                                              '0787bj4k' /* Customer */,
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
                                                                              'wxrmt409' /* Items */,
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
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '27zaw3v2' /* Total */,
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
                                                                        fixedWidth: valueOrDefault(currentUserDocument?.userRole, '') ==
                                                                                'SuperAdmin'
                                                                            ? 150.0
                                                                            : 0.0,
                                                                      ),
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '88sl7wa1' /* Payment Status */,
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
                                                                    dataRowBuilder: (orderListItem,
                                                                            orderListIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      cells: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().deliveryflow =
                                                                                DeliveryFlowStruct();

                                                                            context.pushNamed(
                                                                              OrderDetailsWidget.routeName,
                                                                              queryParameters: {
                                                                                'orderRef': serializeParam(
                                                                                  orderListItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            orderListItem.orderId,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().theme.themeMain.primaryText,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  decoration: TextDecoration.underline,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          '${dateTimeFormat(
                                                                            "yMMMd",
                                                                            orderListItem.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} ${dateTimeFormat(
                                                                            "jm",
                                                                            orderListItem.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        ),
                                                                        StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(orderListItem.customerRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: Container(
                                                                                  width: 0.0,
                                                                                  height: 0.0,
                                                                                  child: BlankLoadingWidget(),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final columnUsersRecord =
                                                                                snapshot.data!;

                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                SelectionArea(
                                                                                    child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    columnUsersRecord.displayName,
                                                                                    ' -',
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
                                                                                        lineHeight: 1.5,
                                                                                      ),
                                                                                )),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          '${orderListItem.orderItems.cartItems.length.toString()} Items',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              '${orderListItem.totalPrice.toString()} KD',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Icon(
                                                                                FFIcons.kfinance,
                                                                                color: FFAppState().theme.themeMain.primaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                () {
                                                                              if (orderListItem.paymentStatus == 'Initialization') {
                                                                                return Color(0xFFFFD6A4);
                                                                              } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                return Color(0xFFFDEAEA);
                                                                              } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                return Color(0xFFCCFFC7);
                                                                              } else {
                                                                                return Color(0xFFF1F1F1);
                                                                              }
                                                                            }(),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: () {
                                                                                if (orderListItem.paymentStatus == 'Initialization') {
                                                                                  return Color(0xFFFFB800);
                                                                                } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                  return Color(0xFFFCA5A5);
                                                                                } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                  return Color(0xFF78FF6A);
                                                                                } else {
                                                                                  return FlutterFlowTheme.of(context).secondaryText;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(116.0),
                                                                                  child: Image.network(
                                                                                    getCORSProxyUrl(
                                                                                      () {
                                                                                        if (orderListItem.paymentStatus == 'Initialization') {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/145bzpgd7dzv/pending.png';
                                                                                        } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/95daq34b5geh/paid.png';
                                                                                        } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/mvdr2mtibmkx/failed.png';
                                                                                        } else {
                                                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/u0irvtjm5pm6/canceled.png';
                                                                                        }
                                                                                      }(),
                                                                                    ),
                                                                                    width: 8.0,
                                                                                    height: 8.0,
                                                                                    fit: BoxFit.contain,
                                                                                    alignment: Alignment(0.0, 0.0),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    () {
                                                                                      if (orderListItem.paymentStatus == 'Initialization') {
                                                                                        return 'Pending';
                                                                                      } else if (orderListItem.paymentStatus == 'CAPTURED') {
                                                                                        return 'Paid';
                                                                                      } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                        return 'Failed';
                                                                                      } else {
                                                                                        return 'Cancelled';
                                                                                      }
                                                                                    }(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: () {
                                                                                            if (orderListItem.paymentStatus == 'Initialization') {
                                                                                              return FlutterFlowTheme.of(context).primaryText;
                                                                                            } else if (orderListItem.paymentStatus == 'FAILED') {
                                                                                              return Color(0xFFD92D20);
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).primaryText;
                                                                                            }
                                                                                          }(),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  )),
                                                                                ),
                                                                                if (responsiveVisibility(
                                                                                  context: context,
                                                                                  phone: false,
                                                                                  tablet: false,
                                                                                  tabletLandscape: false,
                                                                                  desktop: false,
                                                                                ))
                                                                                  Icon(
                                                                                    FFIcons.kouline,
                                                                                    color: () {
                                                                                      if (orderListItem.orderStatus == 'Initialization') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if ((orderListItem.orderStatus == 'FAILED') && (orderListItem.paymentStatus == 'FAILED')) {
                                                                                        return Color(0xFFD92D20);
                                                                                      } else {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      }
                                                                                    }(),
                                                                                    size: 18.0,
                                                                                  ),
                                                                              ].divide(SizedBox(width: 4.0)),
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
                                                                        'bf0knboq' /* All caught up! */,
                                                                      ),
                                                                      messageTwo:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'wlqhmaex' /* There are no pending payments ... */,
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
                                                                    headingRowHeight:
                                                                        40.0,
                                                                    dataRowHeight:
                                                                        45.0,
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
                                                        if (((_model.choice ==
                                                                    'Delivery Ongoing') ||
                                                                (_model.choice ==
                                                                    'Create Shipping') ||
                                                                (_model.choice ==
                                                                    'Pickup request') ||
                                                                (_model.choice ==
                                                                    'Delivered')) &&
                                                            (FFAppState()
                                                                    .currentUserRoleKey ==
                                                                'super_admin'))
                                                          Expanded(
                                                            child: StreamBuilder<
                                                                List<
                                                                    OrdersRecord>>(
                                                              stream:
                                                                  queryOrdersRecord(
                                                                queryBuilder:
                                                                    (ordersRecord) =>
                                                                        ordersRecord
                                                                            .where(
                                                                  'payment_status',
                                                                  isEqualTo:
                                                                      'CAPTURED',
                                                                ),
                                                                limit: 100,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<OrdersRecord>
                                                                    multipleProductsOrdersRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
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
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final orderList = multipleProductsOrdersRecordList
                                                                          .where((e) => () {
                                                                                if (_model.choice == 'Delivery Ongoing') {
                                                                                  return ((e.deliveryInfoList.length > 0) && (e.orderStatus != 'completed'));
                                                                                } else if (_model.choice == 'Pickup request') {
                                                                                  return (e.orderItems.cartItems.where((e) => (e.productMainType == 'custom') && (e.productPickupInfo.status == 'Ready to Pickup')).toList().length > 0);
                                                                                } else if (_model.choice == 'Create Shipping') {
                                                                                  return (e.deliveryInfoList.length == 0);
                                                                                } else if (_model.choice == 'Delivered') {
                                                                                  return (e.orderStatus == 'completed');
                                                                                } else {
                                                                                  return ((e.paymentStatus == 'CAPTURED') && (e.deliveryInfoList.length > 0));
                                                                                }
                                                                              }())
                                                                          .toList()
                                                                          .sortedList(keyOf: (e) => e.updatedAt!, desc: true)
                                                                          .toList();
                                                                      if (orderList
                                                                          .isEmpty) {
                                                                        return EmptyWidget(
                                                                          messageOne:
                                                                              FFLocalizations.of(context).getText(
                                                                            'vf5zy7q6' /* All caught up! */,
                                                                          ),
                                                                          messageTwo:
                                                                              FFLocalizations.of(context).getText(
                                                                            'o2mcbbdy' /* There are no pending payments ... */,
                                                                          ),
                                                                        );
                                                                      }

                                                                      return FlutterFlowDataTable<
                                                                          OrdersRecord>(
                                                                        controller:
                                                                            _model.paginatedDataTableController2,
                                                                        data:
                                                                            orderList,
                                                                        columnsBuilder:
                                                                            (onSortChanged) =>
                                                                                [
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'uc67ikft' /* Order ID */,
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
                                                                            ),
                                                                            fixedWidth:
                                                                                200.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '5465504q' /* Customer */,
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
                                                                                200.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'xsvhlqkm' /* Date */,
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
                                                                                200.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rb359bio' /* products */,
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
                                                                        dataRowBuilder: (orderListItem,
                                                                                orderListIndex,
                                                                                selected,
                                                                                onSelectChanged) =>
                                                                            DataRow(
                                                                          cells:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                FFAppState().deliveryflow = DeliveryFlowStruct();

                                                                                context.pushNamed(
                                                                                  OrderDetailsWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'orderRef': serializeParam(
                                                                                      orderListItem.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                orderListItem.orderId,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF303030),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      decoration: TextDecoration.underline,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(orderListItem.customerRef!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: BlankLoadingWidget(),
                                                                                  );
                                                                                }

                                                                                final columnUsersRecord = snapshot.data!;

                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    SelectionArea(
                                                                                        child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        columnUsersRecord.displayName,
                                                                                        ' -',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF303030),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    )),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              '${dateTimeFormat(
                                                                                "MMM dd, yyyy",
                                                                                orderListItem.createdAt,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )} ${dateTimeFormat(
                                                                                "jm",
                                                                                orderListItem.createdAt,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF303030),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final itemsList = orderListItem.orderItems.cartItems.map((e) => e).toList();

                                                                                  return SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: List.generate(itemsList.length, (itemsListIndex) {
                                                                                        final itemsListItem = itemsList[itemsListIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      getCORSProxyUrl(
                                                                                                        valueOrDefault<String>(
                                                                                                          itemsListItem.productInfo.featureImage != ''
                                                                                                              ? itemsListItem.productInfo.featureImage
                                                                                                              : valueOrDefault<String>(
                                                                                                                  itemsListItem.productInfo.galleryImage.firstOrNull,
                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                                                ),
                                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                                        ),
                                                                                                      ),
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: SelectionArea(
                                                                                                        child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        itemsListItem.productInfo.name,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 24.0)),
                                                                                              ),
                                                                                            ),
                                                                                            if ((_model.choice == 'Delivery Ongoing') && (orderListItem.deliveryInfoList.where((e) => e.productIds.contains(itemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != null && orderListItem.deliveryInfoList.where((e) => e.productIds.contains(itemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != ''))
                                                                                              Expanded(
                                                                                                child: StreamBuilder<DeliveryRecord>(
                                                                                                  stream: DeliveryRecord.getDocument(orderListItem.deliveryInfoList.where((e) => e.productIds.contains(itemsListItem.productId) == true).toList().firstOrNull!.deliveryRef!),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 1.0,
                                                                                                          height: 1.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              FlutterFlowTheme.of(context).secondary,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }

                                                                                                    final deliveryDeliveryRecord = snapshot.data!;

                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            deliveryDeliveryRecord.status,
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF303030),
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
                                                                                                          Icon(
                                                                                                            FFIcons.kpickup,
                                                                                                            color: FFAppState().theme.themeMain.primaryText,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        if (orderListItem.deliveryInfoList.where((e) => (e.productIds.contains(itemsListItem.productId) == true) && (e.status != '')).toList().firstOrNull?.deliveryRef != null)
                                                                                                          Builder(
                                                                                                            builder: (context) => FlutterFlowIconButton(
                                                                                                              borderRadius: 8.0,
                                                                                                              buttonSize: 40.0,
                                                                                                              icon: Icon(
                                                                                                                FFIcons.kpickup,
                                                                                                                color: FFAppState().theme.themeMain.primaryText,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                              showLoadingIndicator: true,
                                                                                                              onPressed: () async {
                                                                                                                _model.logisticsResponseDoc = await queryLogisticsResponseRecordOnce(
                                                                                                                  queryBuilder: (logisticsResponseRecord) => logisticsResponseRecord.where(
                                                                                                                    'id',
                                                                                                                    isEqualTo: deliveryDeliveryRecord.deliveryId,
                                                                                                                  ),
                                                                                                                  singleRecord: true,
                                                                                                                ).then((s) => s.firstOrNull);
                                                                                                                await showAlignedDialog(
                                                                                                                  barrierColor: Color(0x7B000000),
                                                                                                                  context: context,
                                                                                                                  isGlobal: false,
                                                                                                                  avoidOverflow: false,
                                                                                                                  targetAnchor: AlignmentDirectional(-12.0, 6.0).resolve(Directionality.of(context)),
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
                                                                                                            ),
                                                                                                          ),
                                                                                                      ].divide(SizedBox(width: 6.0)),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            if ((_model.choice == 'Pickup request') && (itemsListItem.productPickupInfo.status == 'Ready to Pickup'))
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    if (itemsListItem.productPickupInfo.status == 'Ready to Pickup')
                                                                                                      SelectionArea(
                                                                                                          child: Text(
                                                                                                        itemsListItem.productPickupInfo.status == 'Ready to Pickup' ? itemsListItem.productPickupInfo.status : 'Designer Processing',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF303030),
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              lineHeight: 1.5,
                                                                                                            ),
                                                                                                      )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            if (((_model.choice == 'Create Shipping') && (itemsListItem.productMainType == 'ready')) || ((_model.choice == 'Create Shipping') && (itemsListItem.productPickupInfo.status == 'Recevied')))
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '8yjgqbef' /* Raise Shipping Request */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            if (_model.choice == 'Delivered')
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'ffprqdyv' /* Delivered */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 12.0)).addToEnd(SizedBox(width: 24.0)),
                                                                                        );
                                                                                      }).divide(SizedBox(height: 8.0)).addToStart(SizedBox(height: 8.0)),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ].map((c) => DataCell(c)).toList(),
                                                                        ),
                                                                        emptyBuilder:
                                                                            () =>
                                                                                EmptyWidget(
                                                                          messageOne:
                                                                              FFLocalizations.of(context).getText(
                                                                            'vf5zy7q6' /* All caught up! */,
                                                                          ),
                                                                          messageTwo:
                                                                              FFLocalizations.of(context).getText(
                                                                            'o2mcbbdy' /* There are no pending payments ... */,
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
                                                                        dataRowHeight:
                                                                            130.0,
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
                                                                );
                                                              },
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
                ],
              ),
            ),
          ),
        ));
  }
}
