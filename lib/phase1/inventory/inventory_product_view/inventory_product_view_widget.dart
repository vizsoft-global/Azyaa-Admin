import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/empty/empty_widget.dart';
import '/custom_code/widgets/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inventory_product_view_model.dart';
export 'inventory_product_view_model.dart';

class InventoryProductViewWidget extends StatefulWidget {
  const InventoryProductViewWidget({
    super.key,
    required this.inventoryReference,
  });

  final DocumentReference? inventoryReference;

  static String routeName = 'InventoryProductView';
  static String routePath = '/azyaa-InventoryProductView';

  @override
  State<InventoryProductViewWidget> createState() =>
      _InventoryProductViewWidgetState();
}

class _InventoryProductViewWidgetState
    extends State<InventoryProductViewWidget> {
  late InventoryProductViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryProductViewModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true)
          ..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: true)
          ..addListener(() => safeSetState(() {}));
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
        title: 'InventoryProductView',
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                            ))
                              wrapWithModel(
                                model: _model.azyaaSidebarModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AzyaaSidebarWidget(
                                  menuname: 'Product Management',
                                ),
                              ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: StreamBuilder<InventoryRecord>(
                                  stream: InventoryRecord.getDocument(
                                      widget.inventoryReference!),
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

                                    final containerInventoryRecord =
                                        snapshot.data!;

                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
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
                                      child: StreamBuilder<ProductsRecord>(
                                        stream: ProductsRecord.getDocument(
                                            containerInventoryRecord
                                                .productRef!),
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

                                          final productContainerProductsRecord =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
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
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
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
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .border,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Icon(
                                                              Icons.arrow_back,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                            'jntnk2ew' /* Product Inventory Details */,
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
                                                        .divide(SizedBox(
                                                            width: 12.0))
                                                        .addToEnd(SizedBox(
                                                            width: 12.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 120.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              getCORSProxyUrl(
                                                                                () {
                                                                                  if (productContainerProductsRecord.productInfo.featureImage != '') {
                                                                                    return productContainerProductsRecord.productInfo.featureImage;
                                                                                  } else if (productContainerProductsRecord.productInfo.iconImage != '') {
                                                                                    return productContainerProductsRecord.productInfo.iconImage;
                                                                                  } else {
                                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                              width: 80.0,
                                                                              height: 80.0,
                                                                              fit: BoxFit.cover,
                                                                              alignment: Alignment(0.0, 0.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      200.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
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
                                                                        'pojzuojq' /* Total Stock */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.themeMain.secondaryText,
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (containerInventoryRecord.stockOnHand +
                                                                                containerInventoryRecord.stockReserved +
                                                                                containerInventoryRecord.stockUnavailable)
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.themeMain.primaryText,
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      200.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
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
                                                                        'yh4siofk' /* Unavailable */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.themeMain.secondaryText,
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerInventoryRecord
                                                                            .stockUnavailable
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.themeMain.primaryText,
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      200.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
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
                                                                        '106ks83y' /* Committed */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
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
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerInventoryRecord
                                                                            .stockReserved
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.themeMain.primaryText,
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      160.0,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    WarehouseStockCell(
                                                                  productId:
                                                                      containerInventoryRecord
                                                                          .productId,
                                                                  sku: containerInventoryRecord
                                                                      .productSku,
                                                                  field:
                                                                      WarehouseStockField
                                                                          .stored,
                                                                  showLabel:
                                                                      true,
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      160.0,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    WarehouseStockCell(
                                                                  productId:
                                                                      containerInventoryRecord
                                                                          .productId,
                                                                  sku: containerInventoryRecord
                                                                      .productSku,
                                                                  field:
                                                                      WarehouseStockField
                                                                          .availableForOrder,
                                                                  reserved:
                                                                      containerInventoryRecord
                                                                          .stockReserved,
                                                                  unavailable:
                                                                      containerInventoryRecord
                                                                          .stockUnavailable,
                                                                  showLabel:
                                                                      true,
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
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
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        200.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Visibility(
                                                                    visible:
                                                                        containerInventoryRecord.lastCountedAt !=
                                                                            null,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'dh9g73a4' /* Last Restock */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: valueOrDefault<Color>(
                                                                                  FFAppState().theme.themeMain.secondaryText,
                                                                                  FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "yMMMd",
                                                                            containerInventoryRecord.lastCountedAt!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                      ].divide(SizedBox(
                                                                              height: 6.0)),
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
                                                                VerticalDivider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
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
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        200.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fm2v79nm' /* Last Adjustment */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'bjw29m45' /* 3 Days Ago */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            6.0)),
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
                                                                VerticalDivider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
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
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        200.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'v8oc30g5' /* Status */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                                      ),
                                                                      Stack(
                                                                        children: [
                                                                          if (containerInventoryRecord.stock >
                                                                              containerInventoryRecord.thresholdStock)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle_outline,
                                                                                  color: FlutterFlowTheme.of(context).success,
                                                                                  size: 18.0,
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'hyibycbc' /* instock */,
                                                                                  ),
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
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          if (containerInventoryRecord.thresholdStock >=
                                                                              containerInventoryRecord.stock)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.report_outlined,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  size: 18.0,
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ep847f76' /*  Low Stock */,
                                                                                  ),
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
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            6.0)),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            InventorymovementlogRecord>>(
                                                      stream:
                                                          queryInventorymovementlogRecord(
                                                        queryBuilder:
                                                            (inventorymovementlogRecord) =>
                                                                inventorymovementlogRecord
                                                                    .where(
                                                          'inventory_ref',
                                                          isEqualTo: widget
                                                              .inventoryReference,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<InventorymovementlogRecord>
                                                            productDetailsInventorymovementlogRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .border,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
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
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'zzmjspdf' /* Overview */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              0.0,
                                                                          labelPadding:
                                                                              EdgeInsets.all(4.0),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          iconSize:
                                                                              0.0,
                                                                          labelPadding:
                                                                              EdgeInsets.all(4.0),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
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
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            FFLocalizations.of(context).getText(
                                                                              'ajrdx4nw' /* Overview */,
                                                                            )
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if ((_model.choiceChipsValue ==
                                                                            'Overview') ||
                                                                        (_model.choiceChipsValue ==
                                                                            'ملخص'))
                                                                      Expanded(
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          primary:
                                                                              false,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableExpandableController1,
                                                                                  child: ExpandablePanel(
                                                                                    header: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'fxgx07qg' /* Product Overview */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                      ),
                                                                                                      color: FFAppState().theme.themeMain.primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
                                                                                              Icon(
                                                                                                Icons.mode_edit_outlined,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                          ].addToStart(SizedBox(width: 24.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(),
                                                                                    expanded: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            height: 1.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).border,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              child: Wrap(
                                                                                                spacing: 24.0,
                                                                                                runSpacing: 24.0,
                                                                                                alignment: WrapAlignment.spaceBetween,
                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                direction: Axis.horizontal,
                                                                                                runAlignment: WrapAlignment.spaceBetween,
                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                clipBehavior: Clip.none,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'l6m0m7uf' /* Product Name */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          productContainerProductsRecord.productInfo.name,
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
                                                                                                        )),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'sphxwjz3' /* Product ID */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          productContainerProductsRecord.productId,
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
                                                                                                        )),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'wj5unfb6' /* Stock in hand */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          containerInventoryRecord.stockOnHand.toString(),
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
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: WarehouseStockCell(
                                                                                                      productId: containerInventoryRecord.productId,
                                                                                                      sku: containerInventoryRecord.productSku,
                                                                                                      field: WarehouseStockField.stored,
                                                                                                      showLabel: true,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: WarehouseStockCell(
                                                                                                      productId: containerInventoryRecord.productId,
                                                                                                      sku: containerInventoryRecord.productSku,
                                                                                                      field: WarehouseStockField.availableForOrder,
                                                                                                      reserved: containerInventoryRecord.stockReserved,
                                                                                                      unavailable: containerInventoryRecord.stockUnavailable,
                                                                                                      showLabel: true,
                                                                                                    ),
                                                                                                  ),
                                                                                                  StreamBuilder<UsersRecord>(
                                                                                                    stream: UsersRecord.getDocument(productContainerProductsRecord.productAuthorizer.productDesignerRef!),
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

                                                                                                      final containerUsersRecord = snapshot.data!;

                                                                                                      return Container(
                                                                                                        width: 200.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'qdpjasd3' /* Designer */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                            SelectionArea(
                                                                                                                child: Text(
                                                                                                              containerUsersRecord.designerMainInfo.designerInfo.name,
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
                                                                                                            )),
                                                                                                          ].divide(SizedBox(height: 6.0)),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              child: Wrap(
                                                                                                spacing: 24.0,
                                                                                                runSpacing: 24.0,
                                                                                                alignment: WrapAlignment.spaceBetween,
                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                direction: Axis.horizontal,
                                                                                                runAlignment: WrapAlignment.spaceBetween,
                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                clipBehavior: Clip.none,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'sblxekas' /* Unavailable */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          containerInventoryRecord.stockUnavailable.toString(),
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
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Reserved',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Tooltip(
                                                                                                          message:
                                                                                                              'Paid warehouse orders not shipped yet',
                                                                                                          child: Text(
                                                                                                          containerInventoryRecord.stockReserved.toString(),
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
                                                                                                        ))),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'mpcbzvgr' /* Status */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        Stack(
                                                                                                          children: [
                                                                                                            if (containerInventoryRecord.stock > containerInventoryRecord.thresholdStock)
                                                                                                              Wrap(
                                                                                                                spacing: 4.0,
                                                                                                                runSpacing: 4.0,
                                                                                                                alignment: WrapAlignment.start,
                                                                                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                                                                                direction: Axis.horizontal,
                                                                                                                runAlignment: WrapAlignment.start,
                                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                                clipBehavior: Clip.none,
                                                                                                                children: [
                                                                                                                  Icon(
                                                                                                                    Icons.check_circle_outline_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                                                    size: 18.0,
                                                                                                                  ),
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    containerInventoryRecord.stockStatus,
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
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                            if (containerInventoryRecord.thresholdStock >= containerInventoryRecord.stock)
                                                                                                              Wrap(
                                                                                                                spacing: 4.0,
                                                                                                                runSpacing: 4.0,
                                                                                                                alignment: WrapAlignment.start,
                                                                                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                                                                                direction: Axis.horizontal,
                                                                                                                runAlignment: WrapAlignment.start,
                                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                                clipBehavior: Clip.none,
                                                                                                                children: [
                                                                                                                  Icon(
                                                                                                                    Icons.report_outlined,
                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                    size: 18.0,
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '7vwamtpj' /* Low stock */,
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
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'j84ifmaj' /* Stock Source */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          containerInventoryRecord.stockSource,
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
                                                                                                        )),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 24.0)).addToEnd(SizedBox(height: 24.0)),
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.keyboard_arrow_down_outlined,
                                                                                      collapseIcon: Icons.keyboard_arrow_up_outlined,
                                                                                      iconSize: 24.0,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).border,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(12.0),
                                                                                    bottomRight: Radius.circular(12.0),
                                                                                  ),
                                                                                ),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  color: Color(0x00000000),
                                                                                  child: ExpandableNotifier(
                                                                                    controller: _model.expandableExpandableController2,
                                                                                    child: ExpandablePanel(
                                                                                      header: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '4o0w4nzp' /* Alert Settings */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: FFAppState().theme.themeMain.primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.mode_edit_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                ),
                                                                                            ].addToStart(SizedBox(width: 24.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      collapsed: Container(),
                                                                                      expanded: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            height: 1.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).border,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(12.0),
                                                                                                bottomRight: Radius.circular(12.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                                                                                              child: Wrap(
                                                                                                spacing: 24.0,
                                                                                                runSpacing: 24.0,
                                                                                                alignment: WrapAlignment.start,
                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                direction: Axis.horizontal,
                                                                                                runAlignment: WrapAlignment.spaceBetween,
                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                clipBehavior: Clip.none,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 200.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'd5d74gb1' /* Alert Threshold */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          '${containerInventoryRecord.thresholdStock.toString()} Units',
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
                                                                                                        )),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      theme: ExpandableThemeData(
                                                                                        tapHeaderToExpand: true,
                                                                                        tapBodyToExpand: false,
                                                                                        tapBodyToCollapse: false,
                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                        hasIcon: true,
                                                                                        expandIcon: Icons.keyboard_arrow_down_outlined,
                                                                                        collapseIcon: Icons.keyboard_arrow_up_outlined,
                                                                                        iconSize: 24.0,
                                                                                        iconColor: FlutterFlowTheme.of(context).primary,
                                                                                        iconPadding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (((_model.choiceChipsValue ==
                                                                                'Restocks') ||
                                                                            (_model.choiceChipsValue ==
                                                                                'يعيد تخزين')) &&
                                                                        responsiveVisibility(
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
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).border,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(12.0),
                                                                                    bottomRight: Radius.circular(12.0),
                                                                                  ),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final restockList = productDetailsInventorymovementlogRecordList.where((e) => e.requestInfo.requestStatus != '').toList().sortedList(keyOf: (e) => e.updateAt!, desc: true).toList();
                                                                                    if (restockList.isEmpty) {
                                                                                      return EmptyWidget(
                                                                                        messageOne: 'No data with the applied filters',
                                                                                        messageTwo: 'Try changing the filters or search terms for this view.',
                                                                                      );
                                                                                    }

                                                                                    return FlutterFlowDataTable<InventorymovementlogRecord>(
                                                                                      controller: _model.pendingController1,
                                                                                      data: restockList,
                                                                                      columnsBuilder: (onSortChanged) => [
                                                                                        DataColumn2(
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '21pxjda3' /* ID */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'ximv6rjq' /*  Request Date */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '9hvtblkh' /* Qty Added */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'l51dykhk' /* Source */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '20b8o0je' /* Request Type */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'ut9ex6hp' /* Pref. ETA */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'hrwsd41m' /* Requested By */,
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
                                                                                          label: DefaultTextStyle.merge(
                                                                                            softWrap: true,
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'pu9hk2zj' /* Status */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF616161),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                      dataRowBuilder: (restockListItem, restockListIndex, selected, onSelectChanged) => DataRow(
                                                                                        cells: [
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            restockListItem.requestInfo.inventoryRequestId,
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
                                                                                              "d/M/y",
                                                                                              restockListItem.createdAt!,
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
                                                                                            restockListItem.productQuantity.toString(),
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
                                                                                            restockListItem.requestInfo.requestType == 'Return to Designer' ? 'Azyaa' : 'Designer',
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
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            restockListItem.requestInfo.requestType,
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
                                                                                            restockListItem.requestInfo.requestType == 'Return to Designer'
                                                                                                ? dateTimeFormat(
                                                                                                    "d/M/y",
                                                                                                    restockListItem.requestInfo.designerPreferredNotes!,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  )
                                                                                                : dateTimeFormat(
                                                                                                    "d/M/y",
                                                                                                    restockListItem.requestInfo.adminPreferredDate!,
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
                                                                                            restockListItem.requestInfo.requestType == 'Return to Designer'
                                                                                                ? 'Designer'
                                                                                                : 'Azyaa'.maybeHandleOverflow(
                                                                                                    maxChars: 12,
                                                                                                    replacement: '…',
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
                                                                                            restockListItem.requestInfo.fulfillStatus != ''
                                                                                                ? restockListItem.requestInfo.fulfillStatus
                                                                                                : restockListItem.requestInfo.requestStatus.maybeHandleOverflow(
                                                                                                    maxChars: 12,
                                                                                                    replacement: '…',
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
                                                                                        ].map((c) => DataCell(c)).toList(),
                                                                                      ),
                                                                                      emptyBuilder: () => EmptyWidget(
                                                                                        messageOne: 'No data with the applied filters',
                                                                                        messageTwo: 'Try changing the filters or search terms for this view.',
                                                                                      ),
                                                                                      paginated: true,
                                                                                      selectable: false,
                                                                                      hidePaginator: false,
                                                                                      showFirstLastButtons: true,
                                                                                      headingRowHeight: 40.0,
                                                                                      dataRowHeight: 60.0,
                                                                                      columnSpacing: 16.0,
                                                                                      headingRowColor: FlutterFlowTheme.of(context).secondary,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(12.0),
                                                                                        bottomRight: Radius.circular(12.0),
                                                                                      ),
                                                                                      addHorizontalDivider: true,
                                                                                      addTopAndBottomDivider: true,
                                                                                      hideDefaultHorizontalDivider: false,
                                                                                      horizontalDividerColor: FlutterFlowTheme.of(context).border,
                                                                                      horizontalDividerThickness: 1.0,
                                                                                      addVerticalDivider: false,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if ((_model.choiceChipsValue ==
                                                                            'Adjustments') ||
                                                                        (_model.choiceChipsValue ==
                                                                            'التعديلات'))
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).border,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final enquiryList = productDetailsInventorymovementlogRecordList.where((e) => e.enquiryInfo.status != '').toList().sortedList(keyOf: (e) => e.updateAt!, desc: true).toList();
                                                                                if (enquiryList.isEmpty) {
                                                                                  return EmptyWidget(
                                                                                    messageOne: 'No data with the applied filters',
                                                                                    messageTwo: 'Try changing the filters or search terms for this view.',
                                                                                  );
                                                                                }

                                                                                return FlutterFlowDataTable<InventorymovementlogRecord>(
                                                                                  controller: _model.pendingController2,
                                                                                  data: enquiryList,
                                                                                  columnsBuilder: (onSortChanged) => [
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'f9iew1ku' /* ID */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                color: Color(0xFF616161),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '4e7ednik' /* Affected Qty */,
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
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'uknmpybm' /* Type */,
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
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'p6bsl57y' /* Status */,
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
                                                                                  dataRowBuilder: (enquiryListItem, enquiryListIndex, selected, onSelectChanged) => DataRow(
                                                                                    cells: [
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        enquiryListItem.enquiryInfo.enquiryId,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                        enquiryListItem.enquiryInfo.affectedQuanity.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        enquiryListItem.enquiryInfo.issueType,
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
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        enquiryListItem.enquiryInfo.fulfillStatus,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                    ].map((c) => DataCell(c)).toList(),
                                                                                  ),
                                                                                  emptyBuilder: () => EmptyWidget(
                                                                                    messageOne: 'No data with the applied filters',
                                                                                    messageTwo: 'Try changing the filters or search terms for this view.',
                                                                                  ),
                                                                                  paginated: true,
                                                                                  selectable: false,
                                                                                  hidePaginator: false,
                                                                                  showFirstLastButtons: true,
                                                                                  height: 600.0,
                                                                                  headingRowHeight: 40.0,
                                                                                  dataRowHeight: 60.0,
                                                                                  columnSpacing: 16.0,
                                                                                  headingRowColor: FlutterFlowTheme.of(context).secondary,
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  addHorizontalDivider: true,
                                                                                  addTopAndBottomDivider: true,
                                                                                  hideDefaultHorizontalDivider: false,
                                                                                  horizontalDividerColor: FlutterFlowTheme.of(context).border,
                                                                                  horizontalDividerThickness: 1.0,
                                                                                  addVerticalDivider: false,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
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
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).border,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(12.0),
                                                                                  bottomRight: Radius.circular(12.0),
                                                                                ),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final user = FFAppConstants.AdminPSKeyList.toList();
                                                                                  if (user.isEmpty) {
                                                                                    return EmptyWidget(
                                                                                      messageOne: 'No data with the applied filters',
                                                                                      messageTwo: 'Try changing the filters or search terms for this view.',
                                                                                    );
                                                                                  }

                                                                                  return FlutterFlowDataTable<String>(
                                                                                    controller: _model.pendingController3,
                                                                                    data: user,
                                                                                    columnsBuilder: (onSortChanged) => [
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'dc527kxk' /*  Date */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF616161),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      DataColumn2(
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '9vitbnwk' /* Type */,
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
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'jembf0sw' /* QTY */,
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
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '1viftp0m' /* Source */,
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
                                                                                        label: DefaultTextStyle.merge(
                                                                                          softWrap: true,
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'm1dlv5ew' /* Note */,
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
                                                                                    dataRowBuilder: (userItem, userIndex, selected, onSelectChanged) => DataRow(
                                                                                      cells: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ujymw667' /* May 25, 2025 */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'xgk62hnz' /* Adjustment */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'pr5boxrf' /* -3 */,
                                                                                          ),
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
                                                                                        ),
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'yd76lw5b' /* Designer */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'fxqjvf25' /* Damaged piece removed */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                      ].map((c) => DataCell(c)).toList(),
                                                                                    ),
                                                                                    emptyBuilder: () => EmptyWidget(
                                                                                      messageOne: 'No data with the applied filters',
                                                                                      messageTwo: 'Try changing the filters or search terms for this view.',
                                                                                    ),
                                                                                    paginated: true,
                                                                                    selectable: false,
                                                                                    hidePaginator: false,
                                                                                    showFirstLastButtons: true,
                                                                                    headingRowHeight: 40.0,
                                                                                    dataRowHeight: 60.0,
                                                                                    columnSpacing: 16.0,
                                                                                    headingRowColor: FlutterFlowTheme.of(context).secondary,
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                    addHorizontalDivider: true,
                                                                                    addTopAndBottomDivider: true,
                                                                                    hideDefaultHorizontalDivider: false,
                                                                                    horizontalDividerColor: FlutterFlowTheme.of(context).border,
                                                                                    horizontalDividerThickness: 1.0,
                                                                                    addVerticalDivider: false,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
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
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).border,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.emptyModel,
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: EmptyWidget(
                                                                                  messageOne: 'No active promotions available.',
                                                                                  messageTwo: ' ',
                                                                                  button: ' ',
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
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
                                                  .addToEnd(
                                                      SizedBox(height: 24.0)),
                                            ),
                                          );
                                        },
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
