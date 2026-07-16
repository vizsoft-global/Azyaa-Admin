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
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/phase1/product/product_preview/product_preview_widget.dart';
import '/phase1/product/product_quick_edit/product_quick_edit_widget.dart';
import '/phase1/product/products_grid/products_grid_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'products_model.dart';
export 'products_model.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  static String routeName = 'Products';
  static String routePath = '/azyaa-products';

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  late ProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsModel());

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
        title: 'Products',
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
                                  menuname: 'Products',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<ProductsRecord>>(
                                    stream: queryProductsRecord(),
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
                                      List<ProductsRecord>
                                          customerProductsRecordList =
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
                                                              'mgkb2a6w' /* Products */,
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
                                                                        .primary,
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
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nvlfqcf6' /* Export */,
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
                                                        'gem65ef4' /* Import */,
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
                                                    FlutterFlowDropDown<String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4upvteil' /* More Actions */,
                                                        )
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownValue =
                                                                  val),
                                                      width: 115.0,
                                                      height: 30.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
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
                                                        'teqm0fyb' /* More Actions */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          Color(0xFFE3E3E3),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
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
                                                  if (FFAppState()
                                                          .currentUserPermission
                                                          .contains(_model
                                                              .permissionKeyAdd) ==
                                                      true)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState()
                                                            .updateAdminFlowStruct(
                                                          (e) =>
                                                              e..product = null,
                                                        );
                                                        FFAppState()
                                                            .updateAdminFlowStruct(
                                                          (e) => e
                                                            ..updateProduct(
                                                              (e) => e
                                                                ..sku = random_data
                                                                    .randomInteger(
                                                                        100000,
                                                                        999999),
                                                            ),
                                                        );
                                                        while (
                                                            _model.loop > 0) {
                                                          _model.skuCount =
                                                              await queryProductsRecordCount(
                                                            queryBuilder:
                                                                (productsRecord) =>
                                                                    productsRecord
                                                                        .where(
                                                              'product.SKU',
                                                              isEqualTo:
                                                                  FFAppState()
                                                                      .adminFlow
                                                                      .product
                                                                      .sku,
                                                            ),
                                                          );
                                                          if (_model.skuCount ==
                                                              0) {
                                                            break;
                                                          } else {
                                                            FFAppState()
                                                                .updateAdminFlowStruct(
                                                              (e) => e
                                                                ..updateProduct(
                                                                  (e) => e
                                                                    ..sku = random_data
                                                                        .randomInteger(
                                                                            100000,
                                                                            999999),
                                                                ),
                                                            );
                                                          }
                                                        }

                                                        context.pushNamed(
                                                            ProductAddWidget
                                                                .routeName);

                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kyym8c56' /* Add Product */,
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
                                            if (FFAppState()
                                                    .currentUserRoleKey !=
                                                'designer')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 16.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6fv01eqh' /* Total Products Listed */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
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
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  customerProductsRecordList
                                                                      .length
                                                                      .toString(),
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
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
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
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'h60igavd' /* Pending Product Approvals */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
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
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  customerProductsRecordList
                                                                      .where((e) =>
                                                                          e.status ==
                                                                          'Pending')
                                                                      .toList()
                                                                      .length
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
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
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '07t80w3n' /* Low Stock Alerts */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
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
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ProductsRecord>>(
                                                                  stream:
                                                                      queryProductsRecord(),
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
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProductsRecord>
                                                                        richTextProductsRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'qa1dptx0' /* Elegant Satin Gown (2 Costumer... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                          VerticalDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 220.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3sd6ddks' /* Best-Selling Product */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
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
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  customerProductsRecordList
                                                                      .where((e) =>
                                                                          e.productMarketing.productSalesHistory
                                                                              .length >
                                                                          0)
                                                                      .toList()
                                                                      .length
                                                                      .toString(),
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
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .secondaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
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
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 24.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: StreamBuilder<
                                                    List<InventoryRecord>>(
                                                  stream: queryInventoryRecord(
                                                    queryBuilder:
                                                        (inventoryRecord) =>
                                                            inventoryRecord
                                                                .where(
                                                      'status',
                                                      isEqualTo: 'active',
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<InventoryRecord>
                                                        listInventoryRecordList =
                                                        snapshot.data!;

                                                    return Container(
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
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                    options: [
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2p0kruhq' /* All */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1o6znrc0' /* Active */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'b974f0q8' /* Inactive */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'b7gsdgle' /* Draft */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '3dm26jhd' /* Archived */,
                                                                      )),
                                                                      ChipData(FFAppState().currentUserRoleKey ==
                                                                              'designer'
                                                                          ? ''
                                                                          : FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                              enText: 'Request',
                                                                              arText: 'طلب',
                                                                            ))
                                                                    ],
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.choiceChipsValue =
                                                                              val?.firstOrNull);
                                                                      _model.productFilters =
                                                                          () {
                                                                        if ((_model.choiceChipsValue ==
                                                                                'Active') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'نشيط')) {
                                                                          return 'active';
                                                                        } else if ((_model.choiceChipsValue ==
                                                                                'Inactive') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'غير نشط')) {
                                                                          return 'inactive';
                                                                        } else if ((_model.choiceChipsValue ==
                                                                                'Draft') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'مسودة')) {
                                                                          return 'draft';
                                                                        } else if ((_model.choiceChipsValue ==
                                                                                'Archived') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'مؤرشف')) {
                                                                          return 'archived';
                                                                        } else if ((_model.choiceChipsValue ==
                                                                                'Request') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'طلب')) {
                                                                          return 'request';
                                                                        } else if ((_model.choiceChipsValue ==
                                                                                'All') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'الجميع')) {
                                                                          return 'all';
                                                                        } else {
                                                                          return 'all';
                                                                        }
                                                                      }();
                                                                      safeSetState(
                                                                          () {});
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
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
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
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
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
                                                                        _model.choiceChipsValue !=
                                                                            null,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    controller: _model
                                                                            .choiceChipsValueController ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [
                                                                        _model
                                                                            .productFilters
                                                                      ],
                                                                    ),
                                                                    wrapped:
                                                                        true,
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
                                                                    width:
                                                                        180.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child: SwitchListTile
                                                                          .adaptive(
                                                                        value: _model.switchListTileValue ??=
                                                                            true,
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          safeSetState(() =>
                                                                              _model.switchListTileValue = newValue);
                                                                        },
                                                                        title:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'niuw05ig' /* Auto-Approval */,
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
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        activeTrackColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        dense:
                                                                            true,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.trailing,
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        200.0,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .searchTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .searchFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.searchTextController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () async {
                                                                          if (_model.searchTextController.text != '') {
                                                                            safeSetState(() =>
                                                                                _model.algoliaSearchResults = null);
                                                                            await ProductsRecord
                                                                                .search(
                                                                              term: _model.searchTextController.text,
                                                                              maxResults: 10,
                                                                            ).then((r) => _model.algoliaSearchResults = r).onError((_, __) => _model.algoliaSearchResults = []).whenComplete(() =>
                                                                                safeSetState(() {}));

                                                                            _model.searchStatus =
                                                                                'Show';
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            _model.searchStatus =
                                                                                'Hide';
                                                                            safeSetState(() {});
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
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          '09k6sb6f' /* Search... */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        hoverColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        suffixIcon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .ksearch,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
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
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      cursorColor: FFAppState()
                                                                          .theme
                                                                          .themeMain
                                                                          .primary,
                                                                      validator: _model
                                                                          .searchTextControllerValidator
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
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
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
                                                                      size:
                                                                          24.0,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .styleName ==
                                                              'List')
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
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
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final prd = (_model.searchStatus == 'Show'
                                                                                ? _model.algoliaSearchResults
                                                                                    ?.where((e) => () {
                                                                                          if (_model.productFilters == 'archived') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == 'archived') && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == 'archived'));
                                                                                          } else if (_model.productFilters == 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? (e.productAuthorizer.productDesignerId == currentUserUid) : true);
                                                                                          } else if (_model.productFilters == 'request') {
                                                                                            return (e.status == 'request');
                                                                                          } else if (_model.productFilters != 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == _model.productFilters) && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == _model.productFilters));
                                                                                          } else {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.productAuthorizer.productDesignerId == currentUserUid) && (e.status != 'archived')) : (e.status != 'archived'));
                                                                                          }
                                                                                        }())
                                                                                    .toList()
                                                                                    .sortedList(keyOf: (e) => e.createdAt!, desc: true)
                                                                                : customerProductsRecordList
                                                                                    .where((e) => () {
                                                                                          if (_model.productFilters == 'archived') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == 'archived') && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == 'archived'));
                                                                                          } else if (_model.productFilters == 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? (e.productAuthorizer.productDesignerId == currentUserUid) : true);
                                                                                          } else if (_model.productFilters == 'request') {
                                                                                            return (e.status == 'request');
                                                                                          } else if (_model.productFilters != 'all') {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == _model.productFilters) && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == _model.productFilters));
                                                                                          } else {
                                                                                            return (FFAppState().currentUserRoleKey == 'designer' ? ((e.productAuthorizer.productDesignerId == currentUserUid) && (e.status != 'archived')) : (e.status != 'archived'));
                                                                                          }
                                                                                        }())
                                                                                    .toList()
                                                                                    .sortedList(keyOf: (e) => e.createdAt!, desc: true))
                                                                            ?.toList() ??
                                                                        [];
                                                                    if (prd
                                                                        .isEmpty) {
                                                                      return Container(
                                                                        width:
                                                                            800.0,
                                                                        height:
                                                                            300.0,
                                                                        child:
                                                                            EmptyWidget(
                                                                          messageOne:
                                                                              'No orders with the applied filters',
                                                                          messageTwo:
                                                                              'Try changing the filters or search terms for this view.',
                                                                        ),
                                                                      );
                                                                    }

                                                                    return FlutterFlowDataTable<
                                                                        ProductsRecord>(
                                                                      controller:
                                                                          _model
                                                                              .paginatedDataTableController,
                                                                      data: prd,
                                                                      columnsBuilder:
                                                                          (onSortChanged) =>
                                                                              [
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'dtiuwcz8' /*   */,
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
                                                                              50.0,
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '03b1tvxq' /* ID */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'wqa7x7jp' /* Name */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'lo4u3rix' /* Price */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'r00746ch' /* Stock */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'rlfwb7gq' /* Total Sales */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'wg7dlsg4' /* Designer */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '4znmn35z' /* Rating */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'p30azj7z' /* Status */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DataColumn2(
                                                                          label:
                                                                              DefaultTextStyle.merge(
                                                                            softWrap:
                                                                                true,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'drayj93l' /*   */,
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
                                                                        ),
                                                                      ],
                                                                      dataRowBuilder: (prdItem,
                                                                              prdIndex,
                                                                              selected,
                                                                              onSelectChanged) =>
                                                                          DataRow(
                                                                        cells: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              getCORSProxyUrl(
                                                                                () {
                                                                                  if (prdItem.productInfo.featureImage != '') {
                                                                                    return prdItem.productInfo.featureImage;
                                                                                  } else if (prdItem.productInfo.featureImage == '') {
                                                                                    return prdItem.productInfo.galleryImage.firstOrNull!;
                                                                                  } else {
                                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              fit: BoxFit.cover,
                                                                              alignment: Alignment(0.0, 0.0),
                                                                            ),
                                                                          ),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            prdItem.productId,
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
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: () {
                                                                                if (prdItem.productInfoCustomTranslate.name.en != '') {
                                                                                  return prdItem.productInfoCustomTranslate.name.en;
                                                                                } else if (prdItem.productInfoTranslate.name.en != '') {
                                                                                  return prdItem.productInfoTranslate.name.en;
                                                                                } else {
                                                                                  return prdItem.productInfo.name;
                                                                                }
                                                                              }(),
                                                                              arText: () {
                                                                                if (prdItem.productInfoCustomTranslate.name.ar != '') {
                                                                                  return prdItem.productInfoCustomTranslate.name.ar;
                                                                                } else if (prdItem.productInfoTranslate.name.ar != '') {
                                                                                  return prdItem.productInfoTranslate.name.ar;
                                                                                } else {
                                                                                  return prdItem.productInfo.name;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            maxLines:
                                                                                2,
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
                                                                            '${prdItem.product.productPrice.toString()} KD',
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
                                                                            valueOrDefault<String>(
                                                                              listInventoryRecordList.where((e) => e.reference == prdItem.product.inventoryRef).toList().firstOrNull?.stock.toString(),
                                                                              '0',
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
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                '${valueOrDefault<String>(
                                                                                  prdItem.productMarketing.productSalesHistory.length.toString(),
                                                                                  '0',
                                                                                )} Sold',
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
                                                                            ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<UsersRecord>>(
                                                                            stream:
                                                                                queryUsersRecord(
                                                                              queryBuilder: (usersRecord) => usersRecord.where(
                                                                                'uid',
                                                                                isEqualTo: prdItem.productAuthorizer.productDesignerId,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Image.asset(
                                                                                  getCORSProxyUrl(
                                                                                    '',
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<UsersRecord> textUsersRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    DesignerActiveWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'designer': serializeParam(
                                                                                        textUsersRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  textUsersRecord!.designerMainInfo.designerInfo.name.maybeHandleOverflow(
                                                                                    maxChars: 7,
                                                                                    replacement: '…',
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
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              if (prdItem.productReview.length > 0)
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          ((functions.newCartTotal(prdItem.productReview
                                                                                                      .map((e) => valueOrDefault<double>(
                                                                                                            e.reviewRate,
                                                                                                            0.0,
                                                                                                          ))
                                                                                                      .toList()) /
                                                                                                  prdItem.productReview.length))
                                                                                              .toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'az8bkrt1' /* ( */,
                                                                                        ),
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          prdItem.productReview.length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '8odegyd6' /* ) */,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
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
                                                                                  ),
                                                                                ),
                                                                              if (prdItem.productReview.length <= 0)
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'rtp6sgvr' /*  - */,
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
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: () {
                                                                                if (prdItem.status == 'active') {
                                                                                  return Color(0x0D27DA69);
                                                                                } else if (prdItem.status == 'inactive') {
                                                                                  return Color(0x0EDA2744);
                                                                                } else if (prdItem.status == 'request') {
                                                                                  return Color(0x0EF9CF58);
                                                                                } else if (prdItem.status == 'archived') {
                                                                                  return Color(0x0C8F8F8F);
                                                                                } else {
                                                                                  return Color(0x0EAD945A);
                                                                                }
                                                                              }(),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: () {
                                                                                  if (prdItem.status == 'active') {
                                                                                    return FlutterFlowTheme.of(context).success;
                                                                                  } else if (prdItem.status == 'inactive') {
                                                                                    return FlutterFlowTheme.of(context).error;
                                                                                  } else if (prdItem.status == 'request') {
                                                                                    return FlutterFlowTheme.of(context).warning;
                                                                                  } else if (prdItem.status == 'archived') {
                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                  } else {
                                                                                    return Color(0xFFAD945A);
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                prdItem.status,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: () {
                                                                                        if (prdItem.status == 'active') {
                                                                                          return FlutterFlowTheme.of(context).success;
                                                                                        } else if (prdItem.status == 'inactive') {
                                                                                          return FlutterFlowTheme.of(context).error;
                                                                                        } else if (prdItem.status == 'request') {
                                                                                          return FlutterFlowTheme.of(context).warning;
                                                                                        } else if (prdItem.status == 'archived') {
                                                                                          return FlutterFlowTheme.of(context).secondaryText;
                                                                                        } else {
                                                                                          return Color(0xFFAD945A);
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
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Builder(
                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: Colors.transparent,
                                                                                  icon: Icon(
                                                                                    Icons.edit_note_outlined,
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primary,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _model.presentProductResult1 = await ProductsRecord.getDocumentOnce(prdItem.reference);
                                                                                    FFAppState().updateAdminFlowStruct(
                                                                                      (e) => e
                                                                                        ..updateProduct(
                                                                                          (e) => e
                                                                                            ..status = _model.presentProductResult1?.status
                                                                                            ..productType = _model.presentProductResult1?.productType
                                                                                            ..productId = _model.presentProductResult1?.productId
                                                                                            ..productInfo = _model.presentProductResult1?.productInfo
                                                                                            ..product = _model.presentProductResult1?.product
                                                                                            ..productAuthor = _model.presentProductResult1?.productAuthorizer
                                                                                            ..productMarket = _model.presentProductResult1?.productMarketing
                                                                                            ..productAttribute = _model.presentProductResult1!.productAttribute.toList()
                                                                                            ..sku = _model.presentProductResult1?.product.sku,
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
                                                                                                width: 600.0,
                                                                                                child: ProductQuickEditWidget(
                                                                                                  product: prdItem.reference,
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
                                                                              Builder(
                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: Colors.transparent,
                                                                                  icon: Icon(
                                                                                    Icons.more_vert,
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primary,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    size: 18.0,
                                                                                  ),
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
                                                                                                height: 800.0,
                                                                                                width: 600.0,
                                                                                                child: ProductPreviewWidget(
                                                                                                  product: prdItem,
                                                                                                  stocks: listInventoryRecordList.where((e) => e.inventoryId == prdItem.product.inventoryId).toList().length == 1
                                                                                                      ? valueOrDefault<String>(
                                                                                                          listInventoryRecordList.where((e) => e.inventoryId == prdItem.product.inventoryId).toList().firstOrNull?.stock.toString(),
                                                                                                          '0',
                                                                                                        )
                                                                                                      : '0',
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
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ]
                                                                            .map((c) =>
                                                                                DataCell(c))
                                                                            .toList(),
                                                                      ),
                                                                      emptyBuilder:
                                                                          () =>
                                                                              Container(
                                                                        width:
                                                                            800.0,
                                                                        height:
                                                                            300.0,
                                                                        child:
                                                                            EmptyWidget(
                                                                          messageOne:
                                                                              'No orders with the applied filters',
                                                                          messageTwo:
                                                                              'Try changing the filters or search terms for this view.',
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
                                                          if (_model
                                                                  .styleName ==
                                                              'Grid')
                                                            Expanded(
                                                              child: Container(
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
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (_model
                                                                              .styleName ==
                                                                          'Grid')
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(16.0),
                                                                          child:
                                                                              Wrap(
                                                                            spacing:
                                                                                8.0,
                                                                            runSpacing:
                                                                                24.0,
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
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final productGridList = customerProductsRecordList
                                                                                      .where((e) => () {
                                                                                            if (_model.productFilters == 'archived') {
                                                                                              return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == 'archived') && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == 'archived'));
                                                                                            } else if (_model.productFilters != 'all') {
                                                                                              return (FFAppState().currentUserRoleKey == 'designer' ? ((e.status == _model.productFilters) && (e.productAuthorizer.productDesignerId == currentUserUid)) : (e.status == _model.productFilters));
                                                                                            } else {
                                                                                              return (FFAppState().currentUserRoleKey == 'designer' ? ((e.productAuthorizer.productDesignerId == currentUserUid) && (e.status != 'archived')) : (e.status != 'archived'));
                                                                                            }
                                                                                          }())
                                                                                      .toList()
                                                                                      .sortedList(keyOf: (e) => e.createdAt!, desc: true)
                                                                                      .toList();

                                                                                  return Wrap(
                                                                                    spacing: 24.0,
                                                                                    runSpacing: 24.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.horizontal,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: List.generate(productGridList.length, (productGridListIndex) {
                                                                                      final productGridListItem = productGridList[productGridListIndex];
                                                                                      return ProductsGridWidget(
                                                                                        key: Key('Keyf43_${productGridListIndex}_of_${productGridList.length}'),
                                                                                        product: productGridListItem,
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ].addToEnd(SizedBox(
                                                                        height:
                                                                            24.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
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
