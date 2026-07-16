import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/return/reject_return/reject_return_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'order_details_model.dart';
export 'order_details_model.dart';

class OrderDetailsWidget extends StatefulWidget {
  const OrderDetailsWidget({
    super.key,
    required this.orderRef,
  });

  final DocumentReference? orderRef;

  static String routeName = 'Order-Details';
  static String routePath = '/azyaa-order';

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  late OrderDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserPermission.contains(_model.permissionKey) ==
          true) {
        FFAppState().deliveryflow = DeliveryFlowStruct();
      } else {
        context.goNamed(Error404Widget.routeName);
      }
    });

    _model.textFieldFocusNode ??= FocusNode();

    _model.leaveCommentTextController ??= TextEditingController();
    _model.leaveCommentFocusNode ??= FocusNode();

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
        title: 'orders-view',
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
                                  menuname: 'Orders',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .backgroundpage,
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Color(0xFFE6E7EB),
                                      ),
                                    ),
                                    child: StreamBuilder<OrdersRecord>(
                                      stream: OrdersRecord.getDocument(
                                          widget.orderRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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

                                        final columnOrdersRecord =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
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
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child: Text(
                                                              columnOrdersRecord
                                                                  .orderId,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: valueOrDefault<
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
                                                            )),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (columnOrdersRecord
                                                                          .paymentStatus ==
                                                                      'Initialization') {
                                                                    return Color(
                                                                        0xFFFFD6A4);
                                                                  } else if (columnOrdersRecord
                                                                          .paymentStatus ==
                                                                      'FAILED') {
                                                                    return Color(
                                                                        0xFFFDEAEA);
                                                                  } else if (columnOrdersRecord
                                                                          .paymentStatus ==
                                                                      'CAPTURED') {
                                                                    return Color(
                                                                        0xFFCCFFC7);
                                                                  } else {
                                                                    return Color(
                                                                        0xFFF1F1F1);
                                                                  }
                                                                }(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: () {
                                                                    if (columnOrdersRecord
                                                                            .paymentStatus ==
                                                                        'Initialization') {
                                                                      return Color(
                                                                          0xFFFFB800);
                                                                    } else if (columnOrdersRecord
                                                                            .paymentStatus ==
                                                                        'FAILED') {
                                                                      return Color(
                                                                          0xFFFCA5A5);
                                                                    } else if (columnOrdersRecord
                                                                            .paymentStatus ==
                                                                        'CAPTURED') {
                                                                      return Color(
                                                                          0xFF78FF6A);
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            2.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
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
                                                                      Container(
                                                                        width:
                                                                            8.0,
                                                                        height:
                                                                            8.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                () {
                                                                              if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                return Color(0xFFFFB800);
                                                                              } else if ((columnOrdersRecord.paymentStatus == 'FAILED') && (columnOrdersRecord.orderStatus == 'FAILED')) {
                                                                                return Color(0xFFFCA5A5);
                                                                              } else {
                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                              }
                                                                            }(),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            getCORSProxyUrl(
                                                                              () {
                                                                                if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/25qjzo1smrxd/Empty_(1).png';
                                                                                } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && (columnOrdersRecord.orderStatus == 'CAPTURED')) {
                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/lduti8pkab6z/icon_(3).png';
                                                                                } else {
                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/wx7ol9aqqaxr/Subtract2.png';
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              116.0),
                                                                      child: Image
                                                                          .network(
                                                                        getCORSProxyUrl(
                                                                          () {
                                                                            if (columnOrdersRecord.paymentStatus ==
                                                                                'Initialization') {
                                                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/145bzpgd7dzv/pending.png';
                                                                            } else if (columnOrdersRecord.paymentStatus ==
                                                                                'CAPTURED') {
                                                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/95daq34b5geh/paid.png';
                                                                            } else if (columnOrdersRecord.paymentStatus ==
                                                                                'FAILED') {
                                                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/mvdr2mtibmkx/failed.png';
                                                                            } else {
                                                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/u0irvtjm5pm6/canceled.png';
                                                                            }
                                                                          }(),
                                                                        ),
                                                                        width:
                                                                            8.0,
                                                                        height:
                                                                            8.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        alignment: Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      () {
                                                                        if (columnOrdersRecord.paymentStatus ==
                                                                            'Initialization') {
                                                                          return 'Pending';
                                                                        } else if (columnOrdersRecord.paymentStatus ==
                                                                            'CAPTURED') {
                                                                          return 'Paid';
                                                                        } else if (columnOrdersRecord.paymentStatus ==
                                                                            'FAILED') {
                                                                          return 'Failed';
                                                                        } else {
                                                                          return 'Cancelled';
                                                                        }
                                                                      }(),
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
                                                                                () {
                                                                              if (columnOrdersRecord.paymentStatus == 'Initialization') {
                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                              } else if (columnOrdersRecord.paymentStatus == 'FAILED') {
                                                                                return Color(0xFFD92D20);
                                                                              } else {
                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                              }
                                                                            }(),
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
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ),
                                                            if (columnOrdersRecord
                                                                        .orderItems
                                                                        .couponInfo
                                                                        .couponValue !=
                                                                    '')
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                      .theme
                                                                      .themeMain
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState()
                                                                          .theme
                                                                          .themeMain
                                                                          .primary,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                    width: 0.5,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          8.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Icon(
                                                                        FFIcons
                                                                            .kdiscount,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '84sv9hmf' /* Coupon */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
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
                                                              Container(
                                                                width: 88.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (columnOrdersRecord
                                                                            .orderStatus ==
                                                                        'Initialization') {
                                                                      return Color(
                                                                          0xFFFFD6A4);
                                                                    } else if ((columnOrdersRecord.orderStatus ==
                                                                            'FAILED') &&
                                                                        (columnOrdersRecord.paymentStatus ==
                                                                            'FAILED')) {
                                                                      return Color(
                                                                          0xFFFDEAEA);
                                                                    } else {
                                                                      return Color(
                                                                          0xFFF1F1F1);
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: () {
                                                                      if (columnOrdersRecord
                                                                              .orderStatus ==
                                                                          'Initialization') {
                                                                        return Color(
                                                                            0xFFFFB800);
                                                                      } else if ((columnOrdersRecord.paymentStatus ==
                                                                              'FAILED') &&
                                                                          (columnOrdersRecord.orderStatus ==
                                                                              'FAILED')) {
                                                                        return Color(
                                                                            0xFFFCA5A5);
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondaryText;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          8.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          getCORSProxyUrl(
                                                                            () {
                                                                              if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/25qjzo1smrxd/Empty_(1).png';
                                                                              } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && (columnOrdersRecord.orderStatus == 'CAPTURED')) {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/lduti8pkab6z/icon_(3).png';
                                                                              } else {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/wx7ol9aqqaxr/Subtract2.png';
                                                                              }
                                                                            }(),
                                                                          ),
                                                                          width:
                                                                              16.0,
                                                                          height:
                                                                              16.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        () {
                                                                          if (columnOrdersRecord.orderStatus ==
                                                                              'Initialization') {
                                                                            return 'Pending';
                                                                          } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') &&
                                                                              (columnOrdersRecord.orderStatus ==
                                                                                  'CAPTURED')) {
                                                                            return 'Paid';
                                                                          } else if ((columnOrdersRecord.paymentStatus == 'FAILED') &&
                                                                              (columnOrdersRecord.orderStatus == 'FAILED')) {
                                                                            return 'Failed';
                                                                          } else {
                                                                            return 'Failed';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: () {
                                                                                if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                } else if ((columnOrdersRecord.orderStatus == 'FAILED') && (columnOrdersRecord.paymentStatus == 'FAILED')) {
                                                                                  return Color(0xFFD92D20);
                                                                                } else {
                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                }
                                                                              }(),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
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
                                                              Container(
                                                                width: 88.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (columnOrdersRecord
                                                                            .orderStatus ==
                                                                        'Initialization') {
                                                                      return Color(
                                                                          0xFFFFD6A4);
                                                                    } else if ((columnOrdersRecord.orderStatus ==
                                                                            'FAILED') &&
                                                                        (columnOrdersRecord.paymentStatus ==
                                                                            'FAILED')) {
                                                                      return Color(
                                                                          0xFFFDEAEA);
                                                                    } else {
                                                                      return Color(
                                                                          0xFFF1F1F1);
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: () {
                                                                      if (columnOrdersRecord
                                                                              .orderStatus ==
                                                                          'Initialization') {
                                                                        return Color(
                                                                            0xFFFFB800);
                                                                      } else if ((columnOrdersRecord.paymentStatus ==
                                                                              'FAILED') &&
                                                                          (columnOrdersRecord.orderStatus ==
                                                                              'FAILED')) {
                                                                        return Color(
                                                                            0xFFFCA5A5);
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondaryText;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          8.0,
                                                                          2.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          getCORSProxyUrl(
                                                                            () {
                                                                              if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/25qjzo1smrxd/Empty_(1).png';
                                                                              } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && (columnOrdersRecord.orderStatus == 'CAPTURED')) {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/lduti8pkab6z/icon_(3).png';
                                                                              } else {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/wx7ol9aqqaxr/Subtract2.png';
                                                                              }
                                                                            }(),
                                                                          ),
                                                                          width:
                                                                              16.0,
                                                                          height:
                                                                              16.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        () {
                                                                          if (columnOrdersRecord.orderStatus ==
                                                                              'Initialization') {
                                                                            return 'Pending';
                                                                          } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') &&
                                                                              (columnOrdersRecord.orderStatus ==
                                                                                  'CAPTURED')) {
                                                                            return 'Paid';
                                                                          } else if ((columnOrdersRecord.paymentStatus == 'FAILED') &&
                                                                              (columnOrdersRecord.orderStatus == 'FAILED')) {
                                                                            return 'Failed';
                                                                          } else {
                                                                            return 'Failed';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: () {
                                                                                if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                } else if ((columnOrdersRecord.orderStatus == 'FAILED') && (columnOrdersRecord.paymentStatus == 'FAILED')) {
                                                                                  return Color(0xFFD92D20);
                                                                                } else {
                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                }
                                                                              }(),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Text(
                                                          '${dateTimeFormat(
                                                            "yMMMd",
                                                            columnOrdersRecord
                                                                .createdAt,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}${FFLocalizations.of(context).getVariableText(
                                                            enText: ' at ',
                                                            arText: 'في',
                                                          )}${dateTimeFormat(
                                                            "jm",
                                                            columnOrdersRecord
                                                                .createdAt,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF616161),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                  if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userRole,
                                                              '') ==
                                                          'SuperAdmin') &&
                                                      (FFAppState()
                                                              .deliveryflow
                                                              .selectedItemss
                                                              .length >
                                                          0))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            CreateShippingLabelWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'orderRef':
                                                                  serializeParam(
                                                                widget
                                                                    .orderRef,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'type':
                                                                  serializeParam(
                                                                'shipcustomer',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'mnn2gga6' /* Add Shipping details */,
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
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                    ),
                                                  if (((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'SuperAdmin') &&
                                                          (columnOrdersRecord
                                                                      .paymentStatus ==
                                                                  '')) ||
                                                      ((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'SuperAdmin') &&
                                                          (columnOrdersRecord
                                                                  .paymentStatus ==
                                                              'FAILED')))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Container(
                                                        width: 400.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                                  .textController1 ??=
                                                              TextEditingController(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              columnOrdersRecord
                                                                  .paymentComment,
                                                              '-',
                                                            ),
                                                          ),
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController1',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              await widget
                                                                  .orderRef!
                                                                  .update(
                                                                      createOrdersRecordData(
                                                                paymentComment:
                                                                    _model
                                                                        .textController1
                                                                        .text,
                                                              ));
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          enabled: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'aic3klsn' /* Payment related comment */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'fxewxo9m' /* Payment related comment */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            hoverColor: Colors
                                                                .transparent,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                          maxLines: 2,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          enableInteractiveSelection:
                                                              true,
                                                          validator: _model
                                                              .textController1Validator
                                                              .asValidator(
                                                                  context),
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
                                                        SizedBox(width: 12.0))
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
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
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFC1FFC8),
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFF55BB61),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.klogistick,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'z2arxl5e' /* Fulfilled */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                columnOrdersRecord.orderId,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault<Color>(
                                                                                        FFAppState().theme.themeMain.primaryText,
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      fontSize: 14.0,
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
                                                                                Icons.keyboard_control,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              DeliveryRecord>>(
                                                                        stream:
                                                                            queryDeliveryRecord(
                                                                          queryBuilder: (deliveryRecord) =>
                                                                              deliveryRecord.where(
                                                                            'order_ref',
                                                                            isEqualTo:
                                                                                widget.orderRef,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<DeliveryRecord>
                                                                              containerDeliveryRecordList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).border,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Column(
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'fhsy2nm2' /* Fulfilled */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'fspcb35m' /* January 8, 2025 */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'h7h0trgy' /* Kuwait Post */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'yyk0u7b9' /* A4568791AZ */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF005DC0),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            decoration: TextDecoration.underline,
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
                                                                                  Divider(
                                                                                    height: 0.0,
                                                                                    thickness: 1.0,
                                                                                    color: Color(0xFFE0E0E0),
                                                                                  ),
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    final cartItemsList = columnOrdersRecord.orderItems.cartItems.where((e) => FFAppState().currentUserRoleKey == 'designer' ? (e.productDesignerId == currentUserUid) : true).toList();

                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: cartItemsList.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                      itemBuilder: (context, cartItemsListIndex) {
                                                                                        final cartItemsListItem = cartItemsList[cartItemsListIndex];
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                                                                                  child: Wrap(
                                                                                                    spacing: 8.0,
                                                                                                    runSpacing: 16.0,
                                                                                                    alignment: WrapAlignment.spaceBetween,
                                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                    direction: Axis.horizontal,
                                                                                                    runAlignment: WrapAlignment.start,
                                                                                                    verticalDirection: VerticalDirection.down,
                                                                                                    clipBehavior: Clip.none,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          if (() {
                                                                                                            if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && ((cartItemsListItem.productMainType == 'ready') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false))) {
                                                                                                              return true;
                                                                                                            } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.status == 'Recevied') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false)) {
                                                                                                              return true;
                                                                                                            } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.status == 'Recevied') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false)) {
                                                                                                              return true;
                                                                                                            } else {
                                                                                                              return false;
                                                                                                            }
                                                                                                          }())
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                              child: AuthUserStreamWidget(
                                                                                                                builder: (context) => Container(
                                                                                                                  width: 30.0,
                                                                                                                  child: Stack(
                                                                                                                    children: [
                                                                                                                      if (() {
                                                                                                                        if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && ((cartItemsListItem.productMainType == 'ready') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false))) {
                                                                                                                          return true;
                                                                                                                        } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.status == 'Recevied') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false)) {
                                                                                                                          return true;
                                                                                                                        } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.status == 'Recevied') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false)) {
                                                                                                                          return true;
                                                                                                                        } else {
                                                                                                                          return false;
                                                                                                                        }
                                                                                                                      }())
                                                                                                                        Container(
                                                                                                                          width: 30.0,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: AlignedTooltip(
                                                                                                                            content: Padding(
                                                                                                                              padding: EdgeInsets.all(4.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  '6wkoc51c' /* Select products to create ship... */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                                      ),
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            offset: 4.0,
                                                                                                                            preferredDirection: AxisDirection.down,
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            elevation: 4.0,
                                                                                                                            tailBaseWidth: 24.0,
                                                                                                                            tailLength: 12.0,
                                                                                                                            waitDuration: Duration(milliseconds: 100),
                                                                                                                            showDuration: Duration(milliseconds: 1500),
                                                                                                                            triggerMode: TooltipTriggerMode.tap,
                                                                                                                            child: Visibility(
                                                                                                                              visible: () {
                                                                                                                                if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && ((cartItemsListItem.productMainType == 'ready') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false))) {
                                                                                                                                  return true;
                                                                                                                                } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.status == 'Recevied') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false)) {
                                                                                                                                  return true;
                                                                                                                                } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.status == 'Recevied') && (functions.isProductInDeliveryList(cartItemsListItem, columnOrdersRecord.deliveryInfoList.toList()) == false)) {
                                                                                                                                  return true;
                                                                                                                                } else {
                                                                                                                                  return false;
                                                                                                                                }
                                                                                                                              }(),
                                                                                                                              child: Theme(
                                                                                                                                data: ThemeData(
                                                                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                                                                    visualDensity: VisualDensity.compact,
                                                                                                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                                                    shape: RoundedRectangleBorder(
                                                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                ),
                                                                                                                                child: Checkbox(
                                                                                                                                  value: _model.sCCheckboxValueMap[cartItemsListItem] ??= FFAppState().deliveryflow.selectedItemss.contains(cartItemsListItem) == true ? true : false,
                                                                                                                                  onChanged: (newValue) async {
                                                                                                                                    safeSetState(() => _model.sCCheckboxValueMap[cartItemsListItem] = newValue!);
                                                                                                                                    if (newValue!) {
                                                                                                                                      FFAppState().updateDeliveryflowStruct(
                                                                                                                                        (e) => e
                                                                                                                                          ..updateSelectedItemss(
                                                                                                                                            (e) => e.add(cartItemsListItem),
                                                                                                                                          )
                                                                                                                                          ..totalWeightCm = cartItemsListItem.productStockInfo.weightGm + FFAppState().deliveryflow.totalWeightCm,
                                                                                                                                      );
                                                                                                                                    } else {
                                                                                                                                      FFAppState().updateDeliveryflowStruct(
                                                                                                                                        (e) => e
                                                                                                                                          ..updateSelectedItemss(
                                                                                                                                            (e) => e.remove(cartItemsListItem),
                                                                                                                                          )
                                                                                                                                          ..totalWeightCm = cartItemsListItem.productStockInfo.weightGm - FFAppState().deliveryflow.totalWeightCm,
                                                                                                                                      );
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  side: (FlutterFlowTheme.of(context).primaryText != null)
                                                                                                                                      ? BorderSide(
                                                                                                                                          width: 2,
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        )
                                                                                                                                      : null,
                                                                                                                                  activeColor: FFAppState().theme.themeMain.primary,
                                                                                                                                  checkColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          Container(
                                                                                                            width: 340.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    child: Image.network(
                                                                                                                      getCORSProxyUrl(
                                                                                                                        cartItemsListItem.productInfo.featureImage,
                                                                                                                      ),
                                                                                                                      width: 80.0,
                                                                                                                      height: 80.0,
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        SelectionArea(
                                                                                                                            child: Text(
                                                                                                                          cartItemsListItem.productInfo.name,
                                                                                                                          maxLines: 1,
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
                                                                                                                        )),
                                                                                                                        Builder(
                                                                                                                          builder: (context) {
                                                                                                                            final attributeList = cartItemsListItem.cartItemAttribute.toList();

                                                                                                                            return Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: List.generate(attributeList.length, (attributeListIndex) {
                                                                                                                                final attributeListItem = attributeList[attributeListIndex];
                                                                                                                                return StreamBuilder<List<AttributesRecord>>(
                                                                                                                                  stream: queryAttributesRecord(
                                                                                                                                    queryBuilder: (attributesRecord) => attributesRecord
                                                                                                                                        .where(
                                                                                                                                          'attribute_id',
                                                                                                                                          isEqualTo: attributeListItem.attributesId,
                                                                                                                                        )
                                                                                                                                        .where(
                                                                                                                                          'status',
                                                                                                                                          isEqualTo: 'active',
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
                                                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                              Colors.transparent,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    }
                                                                                                                                    List<AttributesRecord> containerAttributesRecordList = snapshot.data!;
                                                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                                                      return Container();
                                                                                                                                    }
                                                                                                                                    final containerAttributesRecord = containerAttributesRecordList.isNotEmpty ? containerAttributesRecordList.first : null;

                                                                                                                                    return Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: Color(0xFFE3E3E3),
                                                                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                                                                        child: StreamBuilder<List<BrandsRecord>>(
                                                                                                                                          stream: queryBrandsRecord(
                                                                                                                                            queryBuilder: (brandsRecord) => brandsRecord
                                                                                                                                                .where(
                                                                                                                                                  'brand_id',
                                                                                                                                                  isEqualTo: attributeListItem.attributesDefaultTermId,
                                                                                                                                                )
                                                                                                                                                .where(
                                                                                                                                                  'status',
                                                                                                                                                  isEqualTo: 'active',
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
                                                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                                      Colors.transparent,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                            }
                                                                                                                                            List<BrandsRecord> richTextBrandsRecordList = snapshot.data!;
                                                                                                                                            // Return an empty Container when the item does not exist.
                                                                                                                                            if (snapshot.data!.isEmpty) {
                                                                                                                                              return Container();
                                                                                                                                            }
                                                                                                                                            final richTextBrandsRecord = richTextBrandsRecordList.isNotEmpty ? richTextBrandsRecordList.first : null;

                                                                                                                                            return RichText(
                                                                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                              text: TextSpan(
                                                                                                                                                children: [
                                                                                                                                                  TextSpan(
                                                                                                                                                    text: FFLocalizations.of(context).getVariableText(
                                                                                                                                                      enText: () {
                                                                                                                                                        if (containerAttributesRecord?.attributeInfoCustomTranslate.name.en != '') {
                                                                                                                                                          return containerAttributesRecord?.attributeInfoCustomTranslate.name.en;
                                                                                                                                                        } else if (containerAttributesRecord?.attributeInfoTranslate.name.en != '') {
                                                                                                                                                          return containerAttributesRecord?.attributeInfoTranslate.name.en;
                                                                                                                                                        } else {
                                                                                                                                                          return containerAttributesRecord?.attributeInfo.name;
                                                                                                                                                        }
                                                                                                                                                      }(),
                                                                                                                                                      arText: () {
                                                                                                                                                        if (containerAttributesRecord?.attributeInfoCustomTranslate.name.ar != '') {
                                                                                                                                                          return containerAttributesRecord?.attributeInfoCustomTranslate.name.ar;
                                                                                                                                                        } else if (containerAttributesRecord?.attributeInfoTranslate.name.ar != '') {
                                                                                                                                                          return containerAttributesRecord?.attributeInfoTranslate.name.ar;
                                                                                                                                                        } else {
                                                                                                                                                          return containerAttributesRecord?.attributeInfo.name;
                                                                                                                                                        }
                                                                                                                                                      }(),
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                          font: GoogleFonts.inter(
                                                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                          ),
                                                                                                                                                          color: Color(0xFF303030),
                                                                                                                                                          fontSize: 10.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                  TextSpan(
                                                                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                                                                      'pfelt7ft' /*  -  */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          font: GoogleFonts.inter(
                                                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                          ),
                                                                                                                                                          color: Color(0xFF303030),
                                                                                                                                                          fontSize: 10.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                  TextSpan(
                                                                                                                                                    text: FFLocalizations.of(context).getVariableText(
                                                                                                                                                      enText: () {
                                                                                                                                                        if (richTextBrandsRecord?.brandInfoCustomTranslate.name.en != '') {
                                                                                                                                                          return richTextBrandsRecord?.brandInfoCustomTranslate.name.en;
                                                                                                                                                        } else if (richTextBrandsRecord?.brandInfoTranslate.name.en != '') {
                                                                                                                                                          return richTextBrandsRecord?.brandInfoTranslate.name.en;
                                                                                                                                                        } else {
                                                                                                                                                          return richTextBrandsRecord?.brandInfo.name;
                                                                                                                                                        }
                                                                                                                                                      }(),
                                                                                                                                                      arText: () {
                                                                                                                                                        if (richTextBrandsRecord?.brandInfoCustomTranslate.name.ar != '') {
                                                                                                                                                          return richTextBrandsRecord?.brandInfoCustomTranslate.name.ar;
                                                                                                                                                        } else if (richTextBrandsRecord?.brandInfoTranslate.name.ar != '') {
                                                                                                                                                          return richTextBrandsRecord?.brandInfoTranslate.name.ar;
                                                                                                                                                        } else {
                                                                                                                                                          return richTextBrandsRecord?.brandInfo.name;
                                                                                                                                                        }
                                                                                                                                                      }(),
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                          font: GoogleFonts.inter(
                                                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                          ),
                                                                                                                                                          color: Color(0xFF303030),
                                                                                                                                                          fontSize: 10.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                        ),
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
                                                                                                                                                      fontSize: 10.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                );
                                                                                                                              }).divide(SizedBox(height: 2.0)),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                        if (cartItemsListItem.productMainType == 'custom')
                                                                                                                          Container(
                                                                                                                            width: 220.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Visibility(
                                                                                                                              visible: cartItemsListItem.productMainType == 'custom',
                                                                                                                              child: RichText(
                                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                text: TextSpan(
                                                                                                                                  children: [
                                                                                                                                    TextSpan(
                                                                                                                                      text: 'Height: ${cartItemsListItem.productUserBodyInfo.bodyInfo.height.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.heightUnit}, Chest: ${cartItemsListItem.productUserBodyInfo.bodyInfo.chest.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.chestUnit}, Waist: ${cartItemsListItem.productUserBodyInfo.bodyInfo.waist.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.waistUnit}, Hips: ${cartItemsListItem.productUserBodyInfo.bodyInfo.hips.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.hipsUnit}, Inseam: ${cartItemsListItem.productUserBodyInfo.bodyInfo.inseam.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.inseamUnit}, Shoulder width: ${cartItemsListItem.productUserBodyInfo.bodyInfo.shoulderWidth.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.shoulderWidthUnit}, Arm length: ${cartItemsListItem.productUserBodyInfo.bodyInfo.armLength.toString()}${cartItemsListItem.productUserBodyInfo.bodyInfo.armLengthUnit}',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            font: GoogleFonts.inter(
                                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                            ),
                                                                                                                                            fontSize: 10.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                          ),
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
                                                                                                                                        fontSize: 10.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                      ].divide(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 48.0, 0.0),
                                                                                                        child: RichText(
                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                          text: TextSpan(
                                                                                                            children: [
                                                                                                              TextSpan(
                                                                                                                text: cartItemsListItem.price.toString(),
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
                                                                                                              TextSpan(
                                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                                  'v6sqy0z3' /*  KD */,
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
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                                  '968bt425' /*  x  */,
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
                                                                                                              ),
                                                                                                              TextSpan(
                                                                                                                text: cartItemsListItem.quantity.toString(),
                                                                                                                style: TextStyle(),
                                                                                                              )
                                                                                                            ],
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          '${cartItemsListItem.totalPrice.toString()} KD',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF616161),
                                                                                                                fontSize: 13.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (columnOrdersRecord.paymentStatus == 'CAPTURED')
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().length > 0))
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                            child: AuthUserStreamWidget(
                                                                                                              builder: (context) => Container(
                                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0xFFF2F2F2),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(12.0),
                                                                                                                  child: Wrap(
                                                                                                                    spacing: 0.0,
                                                                                                                    runSpacing: 12.0,
                                                                                                                    alignment: WrapAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                                                                                    direction: Axis.horizontal,
                                                                                                                    runAlignment: WrapAlignment.start,
                                                                                                                    verticalDirection: VerticalDirection.down,
                                                                                                                    clipBehavior: Clip.none,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'hk00xd0o' /* To Customer - Shipping details */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != null && columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != ''))
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                              child: SelectionArea(
                                                                                                                                  child: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  'Tracking ID : ${valueOrDefault<String>(
                                                                                                                                    columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId,
                                                                                                                                    '-',
                                                                                                                                  )}',
                                                                                                                                  '-',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                      fontSize: 12.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                              )),
                                                                                                                            ),
                                                                                                                          if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != null && columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != ''))
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  containerDeliveryRecordList.where((e) => columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryRef == e.reference).toList().firstOrNull?.status,
                                                                                                                                  '-',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: () {
                                                                                                                                        if (cartItemsListItem.productPickupInfo.status == 'Recevied') {
                                                                                                                                          return FlutterFlowTheme.of(context).azyaaAccepted;
                                                                                                                                        } else if (cartItemsListItem.productPickupInfo.status == 'Cancelled') {
                                                                                                                                          return FlutterFlowTheme.of(context).error;
                                                                                                                                        } else {
                                                                                                                                          return Color(0x00000000);
                                                                                                                                        }
                                                                                                                                      }(),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                        ].divide(SizedBox(height: 4.0)),
                                                                                                                      ),
                                                                                                                      if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != null && columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId != '') && (containerDeliveryRecordList.where((e) => columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryRef == e.reference).toList().firstOrNull?.status != 'DELIVERED'))
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                            child: FFButtonWidget(
                                                                                                                              onPressed: () async {
                                                                                                                                var _shouldSetState = false;
                                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                      context: context,
                                                                                                                                      builder: (alertDialogContext) {
                                                                                                                                        return WebViewAware(
                                                                                                                                          child: AlertDialog(
                                                                                                                                            content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                                                              enText: 'Are you sure you want to cancel shipping for ${columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.productIds.length.toString()}products?',
                                                                                                                                              arText: 'هل أنت متأكد من رغبتك في إلغاء شحن  ${columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.productIds.length.toString()}  منتجات؟',
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
                                                                                                                                  _model.settingShippingCancelDoc = await querySettingsRecordOnce(
                                                                                                                                    queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                                                      'type',
                                                                                                                                      isEqualTo: 'Company',
                                                                                                                                    ),
                                                                                                                                    singleRecord: true,
                                                                                                                                  ).then((s) => s.firstOrNull);
                                                                                                                                  _shouldSetState = true;
                                                                                                                                  if ((_model.settingShippingCancelDoc?.settingsLogisticsInfo.environment != 'test') && (getCurrentTimestamp >= _model.settingShippingCancelDoc!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                                                                                    _model.getAccessKeyShippingCan = await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                                                                                      env: 'prod',
                                                                                                                                      clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                                                                                      clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                                                                                      url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                                                                                    );

                                                                                                                                    _shouldSetState = true;
                                                                                                                                    if ((_model.getAccessKeyShippingCan?.succeeded ?? true)) {
                                                                                                                                      await _model.settingPickupCancelDoc!.reference.update(createSettingsRecordData(
                                                                                                                                        settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                                                                          prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                                                                            (_model.getAccessKeyShippingCan?.jsonBody ?? ''),
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
                                                                                                                                  _model.settingsupdatedCanShipping = await querySettingsRecordOnce(
                                                                                                                                    queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                                                      'type',
                                                                                                                                      isEqualTo: 'Company',
                                                                                                                                    ),
                                                                                                                                    singleRecord: true,
                                                                                                                                  ).then((s) => s.firstOrNull);
                                                                                                                                  _shouldSetState = true;
                                                                                                                                  _model.apiResultShippingCancel = await PrimeExpressDeliveryGroup.cancelDeliveryCall.call(
                                                                                                                                    trackID: columnOrdersRecord.deliveryInfoList.where((e) => e.productIds.contains(cartItemsListItem.productId) == true).toList().firstOrNull?.deliveryTrackingId,
                                                                                                                                    env: _model.settingsupdatedCanShipping?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'pord',
                                                                                                                                    key: _model.settingsupdatedCanShipping?.settingsLogisticsInfo.environment == 'test' ? _model.settingsupdatedCanShipping?.settingsLogisticsInfo.testKey : _model.settingsupdatedCanShipping?.settingsLogisticsInfo.prodKey,
                                                                                                                                    url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                                                                                  );

                                                                                                                                  _shouldSetState = true;
                                                                                                                                  if ((_model.apiResultShippingCancel?.succeeded ?? true)) {
                                                                                                                                    _model.orderDeliveryInfoList = columnOrdersRecord.deliveryInfoList.toList().cast<DeliveryInfoStruct>();
                                                                                                                                    _model.count = columnOrdersRecord.deliveryInfoList.length;
                                                                                                                                    safeSetState(() {});
                                                                                                                                    while (_model.count! > 0) {
                                                                                                                                      if (_model.orderDeliveryInfoList.elementAtOrNull((_model.count!) - 1)?.productIds.contains(cartItemsListItem.productId) == true) {
                                                                                                                                        _model.removeAtIndexFromOrderDeliveryInfoList((_model.count!) - 1);

                                                                                                                                        await widget.orderRef!.update({
                                                                                                                                          ...createOrdersRecordData(
                                                                                                                                            updatedAt: getCurrentTimestamp,
                                                                                                                                          ),
                                                                                                                                          ...mapToFirestore(
                                                                                                                                            {
                                                                                                                                              'delivery_info_list': getDeliveryInfoListFirestoreData(
                                                                                                                                                _model.orderDeliveryInfoList,
                                                                                                                                              ),
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                        });
                                                                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                          SnackBar(
                                                                                                                                            content: Text(
                                                                                                                                              'Pickup Order Cancelled ',
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
                                                                                                                                            duration: Duration(milliseconds: 4000),
                                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                                                                        return;
                                                                                                                                      } else {
                                                                                                                                        _model.count = (_model.count!) - 1;
                                                                                                                                      }
                                                                                                                                    }
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
                                                                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                                                                  return;
                                                                                                                                }

                                                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                                              },
                                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                                'yytewfjv' /* Cancel Shipping */,
                                                                                                                              ),
                                                                                                                              icon: Icon(
                                                                                                                                Icons.close,
                                                                                                                                size: 15.0,
                                                                                                                              ),
                                                                                                                              options: FFButtonOptions(
                                                                                                                                height: 30.0,
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      fontSize: 9.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                                elevation: 0.0,
                                                                                                                                borderSide: BorderSide(
                                                                                                                                  color: Color(0x4C8F8F8F),
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
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
                                                                                                        ),
                                                                                                      ),
                                                                                                    if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && ((cartItemsListItem.productMainType != 'ready') || (cartItemsListItem.productStockInfo.isPreferredVendor == false)))
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                            child: Container(
                                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFF2F2F2),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsets.all(12.0),
                                                                                                                child: Wrap(
                                                                                                                  spacing: 0.0,
                                                                                                                  runSpacing: 12.0,
                                                                                                                  alignment: WrapAlignment.spaceBetween,
                                                                                                                  crossAxisAlignment: WrapCrossAlignment.center,
                                                                                                                  direction: Axis.horizontal,
                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                  clipBehavior: Clip.none,
                                                                                                                  children: [
                                                                                                                    Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        if (cartItemsListItem.productMainType != 'ready')
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'jhpbn4ti' /* From Designer to Customer - Sh... */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productMainType == 'custom') && ((cartItemsListItem.productPickupInfo.deliveryTrackingId != '') && ((cartItemsListItem.productPickupInfo.status == 'processing') || (cartItemsListItem.productPickupInfo.status == 'Recevied'))))
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                            child: AuthUserStreamWidget(
                                                                                                                              builder: (context) => SelectionArea(
                                                                                                                                  child: Text(
                                                                                                                                'Tracking ID : ${valueOrDefault<String>(
                                                                                                                                  cartItemsListItem.productPickupInfo.deliveryTrackingId,
                                                                                                                                  '-',
                                                                                                                                )}',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                      fontSize: 12.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                              )),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                                                    ),
                                                                                                                    if (() {
                                                                                                                          if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.status == 'Ready to Pickup')) {
                                                                                                                            return true;
                                                                                                                          } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (columnOrdersRecord.paymentStatus == 'CAPTURED') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.status == 'Ready to Pickup')) {
                                                                                                                            return true;
                                                                                                                          } else {
                                                                                                                            return false;
                                                                                                                          }
                                                                                                                        }() &&
                                                                                                                        responsiveVisibility(
                                                                                                                          context: context,
                                                                                                                          phone: false,
                                                                                                                          tablet: false,
                                                                                                                          tabletLandscape: false,
                                                                                                                          desktop: false,
                                                                                                                        ))
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => FFButtonWidget(
                                                                                                                            onPressed: () async {
                                                                                                                              FFAppState().deliveryflow = DeliveryFlowStruct();
                                                                                                                              FFAppState().updateDeliveryflowStruct(
                                                                                                                                (e) => e
                                                                                                                                  ..updateSelectedItemss(
                                                                                                                                    (e) => e.add(cartItemsListItem),
                                                                                                                                  )
                                                                                                                                  ..totalWeightCm = cartItemsListItem.productStockInfo.weightGm,
                                                                                                                              );

                                                                                                                              context.pushNamed(
                                                                                                                                CreateShippingLabelWidget.routeName,
                                                                                                                                queryParameters: {
                                                                                                                                  'orderRef': serializeParam(
                                                                                                                                    widget.orderRef,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                  'type': serializeParam(
                                                                                                                                    'pickDesigner',
                                                                                                                                    ParamType.String,
                                                                                                                                  ),
                                                                                                                                  'cartIndex': serializeParam(
                                                                                                                                    cartItemsListIndex,
                                                                                                                                    ParamType.int,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              '1c63cged' /* Pickup from Designer */,
                                                                                                                            ),
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: 140.0,
                                                                                                                              height: 30.0,
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                              color: FFAppState().theme.themeMain.secondaryBackground,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FFAppState().theme.themeMain.primary,
                                                                                                                                    fontSize: 9.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                  ),
                                                                                                                              elevation: 0.0,
                                                                                                                              borderSide: BorderSide(
                                                                                                                                color: Color(0x4C8F8F8F),
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                          if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productMainType == 'custom') && ((cartItemsListItem.productPickupInfo.deliveryTrackingId != '') && ((cartItemsListItem.productPickupInfo.status == 'processing') || (cartItemsListItem.productPickupInfo.status == 'processing')))) {
                                                                                                                            return true;
                                                                                                                          } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && ((cartItemsListItem.productPickupInfo.deliveryTrackingId != '') && ((cartItemsListItem.productPickupInfo.status == 'processing') || (cartItemsListItem.productPickupInfo.status == 'processing')))) {
                                                                                                                            return true;
                                                                                                                          } else {
                                                                                                                            return false;
                                                                                                                          }
                                                                                                                        }() &&
                                                                                                                        responsiveVisibility(
                                                                                                                          context: context,
                                                                                                                          phone: false,
                                                                                                                          tablet: false,
                                                                                                                          tabletLandscape: false,
                                                                                                                          desktop: false,
                                                                                                                        ))
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => FFButtonWidget(
                                                                                                                            onPressed: () async {
                                                                                                                              _model.cartItems = columnOrdersRecord.orderItems.cartItems.toList().cast<UserCartItemsStruct>();
                                                                                                                              _model.updateCartItemsAtIndex(
                                                                                                                                cartItemsListIndex,
                                                                                                                                (e) => e
                                                                                                                                  ..updateProductPickupInfo(
                                                                                                                                    (e) => e..status = 'Recevied',
                                                                                                                                  ),
                                                                                                                              );

                                                                                                                              await widget.orderRef!.update(createOrdersRecordData(
                                                                                                                                updatedAt: getCurrentTimestamp,
                                                                                                                                orderItems: createUserCartStruct(
                                                                                                                                  fieldValues: {
                                                                                                                                    'cart_items': getUserCartItemsListFirestoreData(
                                                                                                                                      _model.cartItems,
                                                                                                                                    ),
                                                                                                                                  },
                                                                                                                                  clearUnsetFields: false,
                                                                                                                                ),
                                                                                                                              ));
                                                                                                                            },
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              'js02m3hq' /* Recevied */,
                                                                                                                            ),
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: 80.0,
                                                                                                                              height: 30.0,
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    fontSize: 9.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                  ),
                                                                                                                              elevation: 0.0,
                                                                                                                              borderSide: BorderSide(
                                                                                                                                color: Color(0x4C8F8F8F),
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                      if ((valueOrDefault(currentUserDocument?.userRole, '') == 'Designer') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.pickupAddress.addressLine1 == '')) {
                                                                                                                        return true;
                                                                                                                      } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'Designer') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.pickupAddress.addressLine1 == '')) {
                                                                                                                        return true;
                                                                                                                      } else {
                                                                                                                        return false;
                                                                                                                      }
                                                                                                                    }())
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => FFButtonWidget(
                                                                                                                            onPressed: () async {
                                                                                                                              _model.cartItems = columnOrdersRecord.orderItems.cartItems.toList().cast<UserCartItemsStruct>();
                                                                                                                              _model.count = columnOrdersRecord.orderItems.cartItems.length;
                                                                                                                              _model.updateCartItemsAtIndex(
                                                                                                                                cartItemsListIndex,
                                                                                                                                (e) => e
                                                                                                                                  ..updateProductPickupInfo(
                                                                                                                                    (e) => e
                                                                                                                                      ..createdAt = getCurrentTimestamp
                                                                                                                                      ..status = 'Ready to Pickup'
                                                                                                                                      ..pickupAddress = currentUserDocument?.designerMainInfo.designerPickupAddress,
                                                                                                                                  ),
                                                                                                                              );

                                                                                                                              await widget.orderRef!.update(createOrdersRecordData(
                                                                                                                                orderItems: createUserCartStruct(
                                                                                                                                  fieldValues: {
                                                                                                                                    'cart_items': getUserCartItemsListFirestoreData(
                                                                                                                                      _model.cartItems,
                                                                                                                                    ),
                                                                                                                                  },
                                                                                                                                  clearUnsetFields: false,
                                                                                                                                ),
                                                                                                                              ));
                                                                                                                            },
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              'fyersqrq' /* Ready to Pickup  */,
                                                                                                                            ),
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: 140.0,
                                                                                                                              height: 30.0,
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    fontSize: 9.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                  ),
                                                                                                                              elevation: 0.0,
                                                                                                                              borderSide: BorderSide(
                                                                                                                                color: Color(0x4C8F8F8F),
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                      if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.createdAt == null)) {
                                                                                                                        return true;
                                                                                                                      } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.createdAt == null)) {
                                                                                                                        return true;
                                                                                                                      } else {
                                                                                                                        return false;
                                                                                                                      }
                                                                                                                    }())
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'w2knp7g4' /* Designer Processing */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  color: Color(0xFFE7AC11),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                          if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productMainType == 'custom') && ((cartItemsListItem.productPickupInfo.status == 'Recevied') || (cartItemsListItem.productPickupInfo.status == 'Cancelled'))) {
                                                                                                                            return true;
                                                                                                                          } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && ((cartItemsListItem.productPickupInfo.status == 'Recevied') || (cartItemsListItem.productPickupInfo.status == 'Cancelled'))) {
                                                                                                                            return true;
                                                                                                                          } else {
                                                                                                                            return false;
                                                                                                                          }
                                                                                                                        }() &&
                                                                                                                        responsiveVisibility(
                                                                                                                          context: context,
                                                                                                                          phone: false,
                                                                                                                          tablet: false,
                                                                                                                          tabletLandscape: false,
                                                                                                                          desktop: false,
                                                                                                                        ))
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => Text(
                                                                                                                            () {
                                                                                                                              if (cartItemsListItem.productPickupInfo.status == 'Recevied') {
                                                                                                                                return FFLocalizations.of(context).getVariableText(
                                                                                                                                  enText: 'Recevied from Designer',
                                                                                                                                  arText: 'تم الاستلام من المصمم',
                                                                                                                                );
                                                                                                                              } else if (cartItemsListItem.productPickupInfo.status == 'Cancelled') {
                                                                                                                                return FFLocalizations.of(context).getVariableText(
                                                                                                                                  enText: 'Cancelled',
                                                                                                                                  arText: 'تم الإلغاء',
                                                                                                                                );
                                                                                                                              } else {
                                                                                                                                return '';
                                                                                                                              }
                                                                                                                            }(),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  color: () {
                                                                                                                                    if (cartItemsListItem.productPickupInfo.status == 'Recevied') {
                                                                                                                                      return FlutterFlowTheme.of(context).azyaaAccepted;
                                                                                                                                    } else if (cartItemsListItem.productPickupInfo.status == 'Cancelled') {
                                                                                                                                      return FlutterFlowTheme.of(context).error;
                                                                                                                                    } else {
                                                                                                                                      return Color(0x00000000);
                                                                                                                                    }
                                                                                                                                  }(),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                          if ((cartItemsListItem.productMainType == 'custom') && (valueOrDefault(currentUserDocument?.roleUniqueKey, '') == 'designer') && (cartItemsListItem.productPickupInfo.createdAt != null)) {
                                                                                                                            return true;
                                                                                                                          } else if ((cartItemsListItem.productStockInfo.isPreferredVendor == false) && (valueOrDefault(currentUserDocument?.roleUniqueKey, '') == 'designer') && (cartItemsListItem.productPickupInfo.createdAt != null)) {
                                                                                                                            return true;
                                                                                                                          } else {
                                                                                                                            return false;
                                                                                                                          }
                                                                                                                        }() &&
                                                                                                                        responsiveVisibility(
                                                                                                                          context: context,
                                                                                                                          phone: false,
                                                                                                                          tablet: false,
                                                                                                                          tabletLandscape: false,
                                                                                                                          desktop: false,
                                                                                                                        ))
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => Text(
                                                                                                                            () {
                                                                                                                              if (cartItemsListItem.productPickupInfo.status == 'Recevied') {
                                                                                                                                return FFLocalizations.of(context).getVariableText(
                                                                                                                                  enText: 'Delivered',
                                                                                                                                  arText: 'تم التوصيل',
                                                                                                                                );
                                                                                                                              } else if (cartItemsListItem.productPickupInfo.status == 'Cancelled') {
                                                                                                                                return FFLocalizations.of(context).getVariableText(
                                                                                                                                  enText: 'Cancelled',
                                                                                                                                  arText: 'تم الإلغاء',
                                                                                                                                );
                                                                                                                              } else if (cartItemsListItem.productPickupInfo.status == 'processing') {
                                                                                                                                return FFLocalizations.of(context).getVariableText(
                                                                                                                                  enText: 'Delivery Processing',
                                                                                                                                  arText: 'معالجة التسليم',
                                                                                                                                );
                                                                                                                              } else {
                                                                                                                                return FFLocalizations.of(context).getVariableText(
                                                                                                                                  enText: 'Delivery Processing',
                                                                                                                                  arText: 'معالجة التسليم',
                                                                                                                                );
                                                                                                                              }
                                                                                                                            }(),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  color: () {
                                                                                                                                    if (cartItemsListItem.productPickupInfo.status == 'Recevied') {
                                                                                                                                      return FlutterFlowTheme.of(context).azyaaAccepted;
                                                                                                                                    } else if (cartItemsListItem.productPickupInfo.status == 'Cancelled') {
                                                                                                                                      return FlutterFlowTheme.of(context).error;
                                                                                                                                    } else {
                                                                                                                                      return Color(0x00000000);
                                                                                                                                    }
                                                                                                                                  }(),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                      if ((valueOrDefault(currentUserDocument?.userRole, '') == 'Designer') && (cartItemsListItem.productMainType == 'custom') && (cartItemsListItem.productPickupInfo.pickupAddress.addressLine1 != '') && (cartItemsListItem.productPickupInfo.deliveryTrackingId == '')) {
                                                                                                                        return true;
                                                                                                                      } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'Designer') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && (cartItemsListItem.productPickupInfo.pickupAddress.addressLine1 != '') && (cartItemsListItem.productPickupInfo.deliveryTrackingId == '')) {
                                                                                                                        return true;
                                                                                                                      } else {
                                                                                                                        return false;
                                                                                                                      }
                                                                                                                    }())
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => FFButtonWidget(
                                                                                                                            onPressed: () async {
                                                                                                                              _model.cartItems = columnOrdersRecord.orderItems.cartItems.toList().cast<UserCartItemsStruct>();
                                                                                                                              _model.count = columnOrdersRecord.orderItems.cartItems.length;
                                                                                                                              _model.updateCartItemsAtIndex(
                                                                                                                                cartItemsListIndex,
                                                                                                                                (e) => e
                                                                                                                                  ..updateProductPickupInfo(
                                                                                                                                    (e) => e..status = 'Retry',
                                                                                                                                  ),
                                                                                                                              );

                                                                                                                              await widget.orderRef!.update(createOrdersRecordData(
                                                                                                                                orderItems: createUserCartStruct(
                                                                                                                                  fieldValues: {
                                                                                                                                    'cart_items': getUserCartItemsListFirestoreData(
                                                                                                                                      _model.cartItems,
                                                                                                                                    ),
                                                                                                                                  },
                                                                                                                                  clearUnsetFields: false,
                                                                                                                                ),
                                                                                                                              ));
                                                                                                                              _model.cartItems = columnOrdersRecord.orderItems.cartItems.toList().cast<UserCartItemsStruct>();
                                                                                                                              _model.count = columnOrdersRecord.orderItems.cartItems.length;
                                                                                                                              _model.updateCartItemsAtIndex(
                                                                                                                                cartItemsListIndex,
                                                                                                                                (e) => e
                                                                                                                                  ..updateProductPickupInfo(
                                                                                                                                    (e) => e
                                                                                                                                      ..createdAt = getCurrentTimestamp
                                                                                                                                      ..status = 'Ready to Pickup'
                                                                                                                                      ..pickupAddress = currentUserDocument?.designerMainInfo.designerPickupAddress,
                                                                                                                                  ),
                                                                                                                              );

                                                                                                                              await widget.orderRef!.update(createOrdersRecordData(
                                                                                                                                orderItems: createUserCartStruct(
                                                                                                                                  fieldValues: {
                                                                                                                                    'cart_items': getUserCartItemsListFirestoreData(
                                                                                                                                      _model.cartItems,
                                                                                                                                    ),
                                                                                                                                  },
                                                                                                                                  clearUnsetFields: false,
                                                                                                                                ),
                                                                                                                              ));
                                                                                                                            },
                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                              '7mgl65wi' /* Retry Delivery Request */,
                                                                                                                            ),
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: 140.0,
                                                                                                                              height: 30.0,
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    fontSize: 9.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                  ),
                                                                                                                              elevation: 0.0,
                                                                                                                              borderSide: BorderSide(
                                                                                                                                color: Color(0x4C8F8F8F),
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (() {
                                                                                                                      if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productMainType == 'custom') && ((cartItemsListItem.productPickupInfo.deliveryTrackingId != '') && (cartItemsListItem.productPickupInfo.status == 'processing'))) {
                                                                                                                        return true;
                                                                                                                      } else if ((valueOrDefault(currentUserDocument?.userRole, '') == 'SuperAdmin') && (cartItemsListItem.productStockInfo.isPreferredVendor == false) && ((cartItemsListItem.productPickupInfo.deliveryTrackingId != '') && ((cartItemsListItem.productPickupInfo.status == 'processing') || (cartItemsListItem.productPickupInfo.status == 'processing')))) {
                                                                                                                        return true;
                                                                                                                      } else {
                                                                                                                        return false;
                                                                                                                      }
                                                                                                                    }())
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                          child: AuthUserStreamWidget(
                                                                                                                            builder: (context) => FFButtonWidget(
                                                                                                                              onPressed: () async {
                                                                                                                                var _shouldSetState = false;
                                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                      context: context,
                                                                                                                                      builder: (alertDialogContext) {
                                                                                                                                        return WebViewAware(
                                                                                                                                          child: AlertDialog(
                                                                                                                                            content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                                                              enText: 'Are you sure you want to cancel pickup?',
                                                                                                                                              arText: 'هل أنت متأكد من رغبتك في إلغاء عملية الاستلام؟',
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
                                                                                                                                  _model.settingPickupCancelDoc = await querySettingsRecordOnce(
                                                                                                                                    queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                                                      'type',
                                                                                                                                      isEqualTo: 'Company',
                                                                                                                                    ),
                                                                                                                                    singleRecord: true,
                                                                                                                                  ).then((s) => s.firstOrNull);
                                                                                                                                  _shouldSetState = true;
                                                                                                                                  if ((_model.settingPickupCancelDoc?.settingsLogisticsInfo.environment != 'test') && (getCurrentTimestamp >= _model.settingPickupCancelDoc!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                                                                                    _model.getAccessKeyCanPickup = await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                                                                                      env: 'prod',
                                                                                                                                      clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                                                                                      clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                                                                                      url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                                                                                    );

                                                                                                                                    _shouldSetState = true;
                                                                                                                                    if ((_model.getAccessKeyCanPickup?.succeeded ?? true)) {
                                                                                                                                      await _model.settingPickupCancelDoc!.reference.update(createSettingsRecordData(
                                                                                                                                        settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                                                                          prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                                                                            (_model.getAccessKeyCanPickup?.jsonBody ?? ''),
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
                                                                                                                                  _model.settingsupdatedCanPickup = await querySettingsRecordOnce(
                                                                                                                                    queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                                                                      'type',
                                                                                                                                      isEqualTo: 'Company',
                                                                                                                                    ),
                                                                                                                                    singleRecord: true,
                                                                                                                                  ).then((s) => s.firstOrNull);
                                                                                                                                  _shouldSetState = true;
                                                                                                                                  _model.apiResultPickupCancel = await PrimeExpressDeliveryGroup.cancelDeliveryCall.call(
                                                                                                                                    trackID: cartItemsListItem.productPickupInfo.deliveryTrackingId,
                                                                                                                                    env: _model.settingsupdatedCanPickup?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'pord',
                                                                                                                                    key: _model.settingsupdatedCanPickup?.settingsLogisticsInfo.environment == 'test' ? _model.settingsupdatedCanPickup?.settingsLogisticsInfo.testKey : _model.settingsupdatedCanPickup?.settingsLogisticsInfo.prodKey,
                                                                                                                                    url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                                                                                  );

                                                                                                                                  _shouldSetState = true;
                                                                                                                                  if ((_model.apiResultPickupCancel?.succeeded ?? true)) {
                                                                                                                                    _model.cartItems = columnOrdersRecord.orderItems.cartItems.toList().cast<UserCartItemsStruct>();
                                                                                                                                    _model.updateCartItemsAtIndex(
                                                                                                                                      cartItemsListIndex,
                                                                                                                                      (e) => e
                                                                                                                                        ..updateProductPickupInfo(
                                                                                                                                          (e) => e
                                                                                                                                            ..status = 'Ready to Pickup'
                                                                                                                                            ..deliveryId = null
                                                                                                                                            ..deliveryTrackingId = null,
                                                                                                                                        ),
                                                                                                                                    );

                                                                                                                                    await widget.orderRef!.update(createOrdersRecordData(
                                                                                                                                      updatedAt: getCurrentTimestamp,
                                                                                                                                      orderItems: createUserCartStruct(
                                                                                                                                        fieldValues: {
                                                                                                                                          'cart_items': getUserCartItemsListFirestoreData(
                                                                                                                                            _model.cartItems,
                                                                                                                                          ),
                                                                                                                                        },
                                                                                                                                        clearUnsetFields: false,
                                                                                                                                      ),
                                                                                                                                    ));
                                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                      SnackBar(
                                                                                                                                        content: Text(
                                                                                                                                          'Pickup Order Cancelled ',
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
                                                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                      ),
                                                                                                                                    );
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
                                                                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                                                                  return;
                                                                                                                                }

                                                                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                                                              },
                                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                                's6nudl3e' /* Cancel Shipping */,
                                                                                                                              ),
                                                                                                                              icon: Icon(
                                                                                                                                Icons.close,
                                                                                                                                size: 15.0,
                                                                                                                              ),
                                                                                                                              options: FFButtonOptions(
                                                                                                                                height: 30.0,
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      fontSize: 9.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                                elevation: 0.0,
                                                                                                                                borderSide: BorderSide(
                                                                                                                                  color: Color(0x4C8F8F8F),
                                                                                                                                ),
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                              ),
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
                                                                                                      ),
                                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            Divider(
                                                                                              height: 0.0,
                                                                                              thickness: 1.0,
                                                                                              indent: 8.0,
                                                                                              endIndent: 8.0,
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ].addToEnd(SizedBox(height: 8.0)),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ].addToEnd(SizedBox(height: 16.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .border,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: () {
                                                                                  if (columnOrdersRecord.paymentStatus == 'Initialization') {
                                                                                    return Color(0xFFFFD6A4);
                                                                                  } else if (columnOrdersRecord.paymentStatus == 'FAILED') {
                                                                                    return Color(0xFFFDEAEA);
                                                                                  } else if (columnOrdersRecord.paymentStatus == 'CAPTURED') {
                                                                                    return Color(0xFFCCFFC7);
                                                                                  } else {
                                                                                    return Color(0xFFF1F1F1);
                                                                                  }
                                                                                }(),
                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                border: Border.all(
                                                                                  color: () {
                                                                                    if (columnOrdersRecord.paymentStatus == 'Initialization') {
                                                                                      return Color(0xFFFFB800);
                                                                                    } else if (columnOrdersRecord.paymentStatus == 'FAILED') {
                                                                                      return Color(0xFFFCA5A5);
                                                                                    } else if (columnOrdersRecord.paymentStatus == 'CAPTURED') {
                                                                                      return Color(0xFF78FF6A);
                                                                                    } else {
                                                                                      return FlutterFlowTheme.of(context).secondaryText;
                                                                                    }
                                                                                  }(),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Container(
                                                                                        width: 8.0,
                                                                                        height: 8.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.transparent,
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                          border: Border.all(
                                                                                            color: () {
                                                                                              if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                                return Color(0xFFFFB800);
                                                                                              } else if ((columnOrdersRecord.paymentStatus == 'FAILED') && (columnOrdersRecord.orderStatus == 'FAILED')) {
                                                                                                return Color(0xFFFCA5A5);
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              }
                                                                                            }(),
                                                                                          ),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.network(
                                                                                            getCORSProxyUrl(
                                                                                              () {
                                                                                                if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/25qjzo1smrxd/Empty_(1).png';
                                                                                                } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && (columnOrdersRecord.orderStatus == 'CAPTURED')) {
                                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/lduti8pkab6z/icon_(3).png';
                                                                                                } else {
                                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/wx7ol9aqqaxr/Subtract2.png';
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            width: 200.0,
                                                                                            height: 200.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(116.0),
                                                                                      child: Image.network(
                                                                                        getCORSProxyUrl(
                                                                                          () {
                                                                                            if (columnOrdersRecord.paymentStatus == 'Initialization') {
                                                                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/145bzpgd7dzv/pending.png';
                                                                                            } else if (columnOrdersRecord.paymentStatus == 'CAPTURED') {
                                                                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/95daq34b5geh/paid.png';
                                                                                            } else if (columnOrdersRecord.paymentStatus == 'FAILED') {
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
                                                                                    Text(
                                                                                      () {
                                                                                        if (columnOrdersRecord.paymentStatus == 'Initialization') {
                                                                                          return 'Pending';
                                                                                        } else if (columnOrdersRecord.paymentStatus == 'CAPTURED') {
                                                                                          return 'Paid';
                                                                                        } else if (columnOrdersRecord.paymentStatus == 'FAILED') {
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
                                                                                              if (columnOrdersRecord.paymentStatus == 'Initialization') {
                                                                                                return FlutterFlowTheme.of(context).primary;
                                                                                              } else if (columnOrdersRecord.paymentStatus == 'FAILED') {
                                                                                                return Color(0xFFD92D20);
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).primary;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 4.0)),
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
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: () {
                                                                                    if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                      return Color(0xFFFFD6A4);
                                                                                    } else if ((columnOrdersRecord.orderStatus == 'FAILED') && (columnOrdersRecord.paymentStatus == 'FAILED')) {
                                                                                      return Color(0xFFFDEAEA);
                                                                                    } else {
                                                                                      return Color(0xFFF1F1F1);
                                                                                    }
                                                                                  }(),
                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                  border: Border.all(
                                                                                    color: () {
                                                                                      if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                        return Color(0xFFFFB800);
                                                                                      } else if ((columnOrdersRecord.paymentStatus == 'FAILED') && (columnOrdersRecord.orderStatus == 'FAILED')) {
                                                                                        return Color(0xFFFCA5A5);
                                                                                      } else {
                                                                                        return FlutterFlowTheme.of(context).secondaryText;
                                                                                      }
                                                                                    }(),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 12.0,
                                                                                        height: 12.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.transparent,
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.network(
                                                                                            getCORSProxyUrl(
                                                                                              () {
                                                                                                if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/25qjzo1smrxd/Empty_(1).png';
                                                                                                } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && (columnOrdersRecord.orderStatus == 'CAPTURED')) {
                                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/lduti8pkab6z/icon_(3).png';
                                                                                                } else {
                                                                                                  return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/wx7ol9aqqaxr/Subtract2.png';
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            width: 200.0,
                                                                                            height: 200.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        () {
                                                                                          if (columnOrdersRecord.orderStatus == 'Initialization') {
                                                                                            return 'Pending';
                                                                                          } else if ((columnOrdersRecord.paymentStatus == 'CAPTURED') && (columnOrdersRecord.orderStatus == 'CAPTURED')) {
                                                                                            return 'Paid';
                                                                                          } else if ((columnOrdersRecord.paymentStatus == 'FAILED') && (columnOrdersRecord.orderStatus == 'FAILED')) {
                                                                                            return 'Failed';
                                                                                          } else {
                                                                                            return 'Failed';
                                                                                          }
                                                                                        }(),
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
                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '14ulbqfz' /* Subtotal */,
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: columnOrdersRecord.orderItems.cartItems.length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF616161),
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'sh15kexj' /*  Items */,
                                                                                            ),
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF616161),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      '${columnOrdersRecord.orderItems.subtotal.toString()} KD',
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'yltezs3m' /* Shipping */,
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ernzt72f' /*   */,
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        columnOrdersRecord.shippingPrice.toString(),
                                                                                        '0',
                                                                                      )} KD',
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (columnOrdersRecord.orderItems.couponInfo.couponId != '')
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        'Coupon : ',
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().theme.themeMain.primaryText,
                                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        columnOrdersRecord.orderItems.couponInfo.couponValue,
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF616161),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        '- ${(columnOrdersRecord.orderItems.subtotal - columnOrdersRecord.orderItems.couponInfo.couponDiscountedPrice).toString()} KD',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF616161),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'o641f7gs' /* Total */,
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      '${columnOrdersRecord.totalPrice.toString()} KD',
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
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Divider(
                                                                                height: 0.0,
                                                                                thickness: 1.0,
                                                                                indent: 16.0,
                                                                                endIndent: 16.0,
                                                                                color: Color(0xFFE0E0E0),
                                                                              ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '6ql8gucy' /* Paid by customer */,
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF303030),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'mtykwqbr' /* KWD 0.000 */,
                                                                                        ),
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF303030),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '7hdtlbfx' /* Payment due when invoice is se... */,
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF303030),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '47ahmnci' /* Edit */,
                                                                                        ),
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF005DC0),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ].addToStart(SizedBox(height: 16.0)),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              FFButtonWidget(
                                                                                onPressed: () {
                                                                                  print('Button pressed ...');
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '92mv9svd' /* Send Invoice */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).buttonBorder,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
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
                                                                                  print('Button pressed ...');
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'efwqjy0x' /* Collect payment */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconAlignment: IconAlignment.start,
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFF303030),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (columnOrdersRecord
                                                                        .returnRequestId !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        ReturnRequestsRecord>>(
                                                                  stream:
                                                                      queryReturnRequestsRecord(
                                                                    queryBuilder:
                                                                        (returnRequestsRecord) =>
                                                                            returnRequestsRecord.where(
                                                                      'return_request_id',
                                                                      isEqualTo:
                                                                          columnOrdersRecord
                                                                              .returnRequestId,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
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
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ReturnRequestsRecord>
                                                                        orderReturnReturnRequestsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final orderReturnReturnRequestsRecord = orderReturnReturnRequestsRecordList
                                                                            .isNotEmpty
                                                                        ? orderReturnReturnRequestsRecordList
                                                                            .first
                                                                        : null;

                                                                    return Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
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
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFE51C00),
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      border: Border.all(
                                                                                        color: Color(0xFFE51C00),
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(
                                                                                            FFIcons.klogistick,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'uwyfs7ov' /* Return */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: SelectionArea(
                                                                                        child: Text(
                                                                                      columnOrdersRecord.orderId,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<Color>(
                                                                                              FFAppState().theme.themeMain.primaryText,
                                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                            fontSize: 14.0,
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
                                                                                      Icons.keyboard_control,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).border,
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  ListView(
                                                                                    padding: EdgeInsets.zero,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final productsList = orderReturnReturnRequestsRecord?.returnProductList.toList() ?? [];

                                                                                                  return Wrap(
                                                                                                    spacing: 0.0,
                                                                                                    runSpacing: 0.0,
                                                                                                    alignment: WrapAlignment.spaceBetween,
                                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                    direction: Axis.horizontal,
                                                                                                    runAlignment: WrapAlignment.start,
                                                                                                    verticalDirection: VerticalDirection.down,
                                                                                                    clipBehavior: Clip.none,
                                                                                                    children: List.generate(productsList.length, (productsListIndex) {
                                                                                                      final productsListItem = productsList[productsListIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                        child: Container(
                                                                                                          width: 340.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.network(
                                                                                                                  getCORSProxyUrl(
                                                                                                                    productsListItem.productInfo.featureImage != '' ? productsListItem.productInfo.featureImage : productsListItem.productInfo.galleryImage.firstOrNull!,
                                                                                                                  ),
                                                                                                                  width: 80.0,
                                                                                                                  height: 80.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  alignment: Alignment(0.0, 0.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    SelectionArea(
                                                                                                                        child: Text(
                                                                                                                      productsListItem.productInfo.name,
                                                                                                                      maxLines: 1,
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
                                                                                                                    )),
                                                                                                                    Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final attributeList = productsListItem.cartItemAttribute.toList();

                                                                                                                        return Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: List.generate(attributeList.length, (attributeListIndex) {
                                                                                                                            final attributeListItem = attributeList[attributeListIndex];
                                                                                                                            return StreamBuilder<List<AttributesRecord>>(
                                                                                                                              stream: queryAttributesRecord(
                                                                                                                                queryBuilder: (attributesRecord) => attributesRecord
                                                                                                                                    .where(
                                                                                                                                      'attribute_id',
                                                                                                                                      isEqualTo: attributeListItem.attributesId,
                                                                                                                                    )
                                                                                                                                    .where(
                                                                                                                                      'status',
                                                                                                                                      isEqualTo: 'active',
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
                                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                          Colors.transparent,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                                List<AttributesRecord> containerAttributesRecordList = snapshot.data!;
                                                                                                                                // Return an empty Container when the item does not exist.
                                                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                                                  return Container();
                                                                                                                                }
                                                                                                                                final containerAttributesRecord = containerAttributesRecordList.isNotEmpty ? containerAttributesRecordList.first : null;

                                                                                                                                return Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: Color(0xFFE3E3E3),
                                                                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                                                                    child: StreamBuilder<List<BrandsRecord>>(
                                                                                                                                      stream: queryBrandsRecord(
                                                                                                                                        queryBuilder: (brandsRecord) => brandsRecord
                                                                                                                                            .where(
                                                                                                                                              'brand_id',
                                                                                                                                              isEqualTo: attributeListItem.attributesDefaultTermId,
                                                                                                                                            )
                                                                                                                                            .where(
                                                                                                                                              'status',
                                                                                                                                              isEqualTo: 'active',
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
                                                                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                                  Colors.transparent,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                        }
                                                                                                                                        List<BrandsRecord> richTextBrandsRecordList = snapshot.data!;
                                                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                                                          return Container();
                                                                                                                                        }
                                                                                                                                        final richTextBrandsRecord = richTextBrandsRecordList.isNotEmpty ? richTextBrandsRecordList.first : null;

                                                                                                                                        return RichText(
                                                                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                          text: TextSpan(
                                                                                                                                            children: [
                                                                                                                                              TextSpan(
                                                                                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                                                                                  enText: () {
                                                                                                                                                    if (containerAttributesRecord?.attributeInfoCustomTranslate.name.en != '') {
                                                                                                                                                      return containerAttributesRecord?.attributeInfoCustomTranslate.name.en;
                                                                                                                                                    } else if (containerAttributesRecord?.attributeInfoTranslate.name.en != '') {
                                                                                                                                                      return containerAttributesRecord?.attributeInfoTranslate.name.en;
                                                                                                                                                    } else {
                                                                                                                                                      return containerAttributesRecord?.attributeInfo.name;
                                                                                                                                                    }
                                                                                                                                                  }(),
                                                                                                                                                  arText: () {
                                                                                                                                                    if (containerAttributesRecord?.attributeInfoCustomTranslate.name.ar != '') {
                                                                                                                                                      return containerAttributesRecord?.attributeInfoCustomTranslate.name.ar;
                                                                                                                                                    } else if (containerAttributesRecord?.attributeInfoTranslate.name.ar != '') {
                                                                                                                                                      return containerAttributesRecord?.attributeInfoTranslate.name.ar;
                                                                                                                                                    } else {
                                                                                                                                                      return containerAttributesRecord?.attributeInfo.name;
                                                                                                                                                    }
                                                                                                                                                  }(),
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                      ),
                                                                                                                                                      color: Color(0xFF303030),
                                                                                                                                                      fontSize: 10.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              TextSpan(
                                                                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                                                                  'dq9fiq9v' /*  -  */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                      ),
                                                                                                                                                      color: Color(0xFF303030),
                                                                                                                                                      fontSize: 10.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              TextSpan(
                                                                                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                                                                                  enText: () {
                                                                                                                                                    if (richTextBrandsRecord?.brandInfoCustomTranslate.name.en != '') {
                                                                                                                                                      return richTextBrandsRecord?.brandInfoCustomTranslate.name.en;
                                                                                                                                                    } else if (richTextBrandsRecord?.brandInfoTranslate.name.en != '') {
                                                                                                                                                      return richTextBrandsRecord?.brandInfoTranslate.name.en;
                                                                                                                                                    } else {
                                                                                                                                                      return richTextBrandsRecord?.brandInfo.name;
                                                                                                                                                    }
                                                                                                                                                  }(),
                                                                                                                                                  arText: () {
                                                                                                                                                    if (richTextBrandsRecord?.brandInfoCustomTranslate.name.ar != '') {
                                                                                                                                                      return richTextBrandsRecord?.brandInfoCustomTranslate.name.ar;
                                                                                                                                                    } else if (richTextBrandsRecord?.brandInfoTranslate.name.ar != '') {
                                                                                                                                                      return richTextBrandsRecord?.brandInfoTranslate.name.ar;
                                                                                                                                                    } else {
                                                                                                                                                      return richTextBrandsRecord?.brandInfo.name;
                                                                                                                                                    }
                                                                                                                                                  }(),
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                      ),
                                                                                                                                                      color: Color(0xFF303030),
                                                                                                                                                      fontSize: 10.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                    ),
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
                                                                                                                                                  fontSize: 10.0,
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          }).divide(SizedBox(height: 2.0)),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 24.0, 0.0),
                                                                                                                      child: RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                productsListItem.price.toString(),
                                                                                                                                '-',
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
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                                '2s7wav58' /*  KD */,
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
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                                '3k8s4vd3' /*  x  */,
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
                                                                                                                            ),
                                                                                                                            TextSpan(
                                                                                                                              text: valueOrDefault<String>(
                                                                                                                                productsListItem.quantity.toString(),
                                                                                                                                '-',
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
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Divider(
                                                                                            height: 0.0,
                                                                                            thickness: 1.0,
                                                                                            indent: 16.0,
                                                                                            endIndent: 16.0,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Wrap(
                                                                                                        spacing: 0.0,
                                                                                                        runSpacing: 8.0,
                                                                                                        alignment: WrapAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                        direction: Axis.horizontal,
                                                                                                        runAlignment: WrapAlignment.start,
                                                                                                        verticalDirection: VerticalDirection.down,
                                                                                                        clipBehavior: Clip.none,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 140.0,
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'obt6clvo' /* Total Quantity  */,
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
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'ujvoeu2x' /* : */,
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
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  orderReturnReturnRequestsRecord?.totalReturnQuantity.toString(),
                                                                                                                  '-',
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
                                                                                                            ].divide(SizedBox(width: 12.0)),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 140.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '2wxjrxht' /* Total Refund Amount  */,
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
                                                                                                                          fontSize: 13.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '93w96vz7' /* : */,
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
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  '${valueOrDefault<String>(
                                                                                                                    orderReturnReturnRequestsRecord?.totalReturnAmount.toString(),
                                                                                                                    '-',
                                                                                                                  )} KD',
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
                                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 140.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'wkglcojd' /* Reason for Return  */,
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
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '25w1nz4z' /* : */,
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
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          orderReturnReturnRequestsRecord!.returnReason,
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
                                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 140.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'km60wltd' /* Additional Comments  */,
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
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'xbfrwzkb' /* : */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  lineHeight: 1.5,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              orderReturnReturnRequestsRecord.returnAdditionalInfo,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    color: valueOrDefault<Color>(
                                                                                                                      FFAppState().theme.themeMain.primaryText,
                                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    lineHeight: 1.5,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (responsiveVisibility(
                                                                                                      context: context,
                                                                                                      phone: false,
                                                                                                      tablet: false,
                                                                                                      tabletLandscape: false,
                                                                                                      desktop: false,
                                                                                                    ))
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    '1ivav6fe' /* Total Quantity :  */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                                TextSpan(
                                                                                                                  text: valueOrDefault<String>(
                                                                                                                    orderReturnReturnRequestsRecord.totalReturnQuantity.toString(),
                                                                                                                    '-',
                                                                                                                  ),
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    'npwrqn5d' /* Total Refund Amount:  */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                                TextSpan(
                                                                                                                  text: '${valueOrDefault<String>(
                                                                                                                    orderReturnReturnRequestsRecord.totalReturnAmount.toString(),
                                                                                                                    '-',
                                                                                                                  )} KD',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                                      ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (orderReturnReturnRequestsRecord.status ==
                                                                                'Pending')
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        await orderReturnReturnRequestsRecord.reference.update(createReturnRequestsRecordData(
                                                                                          updatedAt: getCurrentTimestamp,
                                                                                          approverInfo: createApproverInfoStruct(
                                                                                            userEmail: currentUserEmail,
                                                                                            userRef: currentUserReference,
                                                                                            uid: currentUserUid,
                                                                                            userName: currentUserDisplayName,
                                                                                            userRole: valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Return approved',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'n94hrxf9' /* Approve */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 35.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: Color(0xFF29845A),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF29845A),
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                                                      height: 600.0,
                                                                                                      width: 600.0,
                                                                                                      child: RejectReturnWidget(
                                                                                                        returnRef: orderReturnReturnRequestsRecord.reference,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'p13b2xri' /* Reject */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 35.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: Color(0xFFE51C00),
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0xFFE51C00),
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
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
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
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
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ijwwc5z8' /* Timeline */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () {
                                                                                print('save pressed ...');
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'xod57py0' /* Save  */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 30.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              _model.leaveCommentTextController,
                                                                          focusNode:
                                                                              _model.leaveCommentFocusNode,
                                                                          autofocus:
                                                                              false,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'o9yyed0t' /* Leave Comment */,
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
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).border,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            contentPadding:
                                                                                EdgeInsets.all(13.0),
                                                                          ),
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
                                                                          maxLines:
                                                                              3,
                                                                          maxLength:
                                                                              100,
                                                                          maxLengthEnforcement:
                                                                              MaxLengthEnforcement.enforced,
                                                                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) =>
                                                                              null,
                                                                          validator: _model
                                                                              .leaveCommentTextControllerValidator
                                                                              .asValidator(context),
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.allow(RegExp('^[A-Za-z ]+\$'))
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 24.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'v02rbm97' /* Track Order */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            ListView(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 4.0,
                                                                                            height: 25.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 15.0,
                                                                                            height: 15.0,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(2.0),
                                                                                              child: Container(
                                                                                                width: 10.0,
                                                                                                height: 10.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 4.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'ov7gm458' /* Today */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'g0v1xtfr' /* Your complaint as been raised ... */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '8p1tj2j8' /* Your complaint as been raised ... */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 4.0,
                                                                                            height: 25.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 15.0,
                                                                                            height: 15.0,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(2.0),
                                                                                              child: Container(
                                                                                                width: 10.0,
                                                                                                height: 10.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 4.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '39wlfilo' /* Today */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'zjwkqpov' /* Your complaint as been raised ... */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'jobqj7za' /* Your complaint as been raised ... */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.45,
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
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
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
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'pv9ed7sz' /* Customer */,
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
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Icon(
                                                                                  Icons.close,
                                                                                  color: Color(0xFF616A75),
                                                                                  size: 20.0,
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child: SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              columnOrdersRecord.shippingAddress.shippingName,
                                                                              ' -',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF005DC0),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )),
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '8kfrxasq' /* 1 order */,
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'pcq0z22e' /* Customer is tax-exempt */,
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '168smwrj' /* Contact information  */,
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
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Icon(
                                                                                  Icons.edit_outlined,
                                                                                  color: Color(0xFF616A75),
                                                                                  size: 20.0,
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                valueOrDefault<String>(
                                                                                  columnOrdersRecord.shippingAddress.shippingEmail,
                                                                                  ' -',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF005DC0),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              )),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await Clipboard.setData(ClipboardData(text: columnOrdersRecord.shippingAddress.shippingEmail));
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Copied !',
                                                                                        arText: 'منسوخ!',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.content_copy,
                                                                                color: Color(0xFF616A75),
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child: SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              columnOrdersRecord.shippingAddress.shippingPhone,
                                                                              ' -',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          )),
                                                                        ),
                                                                        if (columnOrdersRecord.orderItems.cartItems.where((e) => e.productType == 'product').toList().length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '1djm79y9' /* Shipping address */,
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
                                                                                if (responsiveVisibility(
                                                                                  context: context,
                                                                                  phone: false,
                                                                                  tablet: false,
                                                                                  tabletLandscape: false,
                                                                                  desktop: false,
                                                                                ))
                                                                                  Icon(
                                                                                    Icons.edit_outlined,
                                                                                    color: Color(0xFF616A75),
                                                                                    size: 20.0,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (columnOrdersRecord.orderItems.cartItems.where((e) => e.productType == 'product').toList().length >
                                                                            0)
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                child: SelectionArea(
                                                                                    child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    columnOrdersRecord.shippingAddress.shippingName,
                                                                                    ' -',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF616161),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                )),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await Clipboard.setData(ClipboardData(
                                                                                      text: '${columnOrdersRecord.shippingAddress.addressLine1}${valueOrDefault<String>(
                                                                                            columnOrdersRecord.shippingAddress.addressLine1,
                                                                                            ' -',
                                                                                          ) != '' ? ', ' : ''}${valueOrDefault<String>(
                                                                                    columnOrdersRecord.shippingAddress.addressLine2,
                                                                                    ' -',
                                                                                  )}${valueOrDefault<String>(
                                                                                            columnOrdersRecord.shippingAddress.addressLine2,
                                                                                            ' -',
                                                                                          ) != '' ? ', ' : ''}${valueOrDefault<String>(
                                                                                    columnOrdersRecord.shippingAddress.city,
                                                                                    ' -',
                                                                                  )}${valueOrDefault<String>(
                                                                                            columnOrdersRecord.shippingAddress.city,
                                                                                            ' -',
                                                                                          ) != '' ? ', ' : ''}${columnOrdersRecord.shippingAddress.state}${valueOrDefault<String>(
                                                                                            columnOrdersRecord.shippingAddress.state,
                                                                                            ' -',
                                                                                          ) != '' ? ', ' : ''}${columnOrdersRecord.shippingAddress.country}${valueOrDefault<String>(
                                                                                            columnOrdersRecord.shippingAddress.country,
                                                                                            ' -',
                                                                                          ) != '' ? ', ' : ''}${valueOrDefault<String>(
                                                                                    columnOrdersRecord.shippingAddress.postalCode,
                                                                                    ' -',
                                                                                  )}'));
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'Copied !',
                                                                                          arText: 'منسوخ!',
                                                                                        ),
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.content_copy,
                                                                                  color: Color(0xFF616A75),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        if (columnOrdersRecord.orderItems.cartItems.where((e) => e.productType == 'product').toList().length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child: SelectionArea(
                                                                                child: Text(
                                                                              '${columnOrdersRecord.shippingAddress.addressLine1}${columnOrdersRecord.shippingAddress.addressLine1 != '' ? ', ' : ''}${columnOrdersRecord.shippingAddress.addressLine2}${columnOrdersRecord.shippingAddress.addressLine2 != '' ? ', ' : ''}${valueOrDefault<String>(
                                                                                columnOrdersRecord.shippingAddress.city,
                                                                                ' -',
                                                                              )}${valueOrDefault<String>(
                                                                                    columnOrdersRecord.shippingAddress.city,
                                                                                    ' -',
                                                                                  ) != '' ? ', ' : ''}${columnOrdersRecord.shippingAddress.state}${columnOrdersRecord.shippingAddress.state != '' ? ', ' : ''}${columnOrdersRecord.shippingAddress.country}${valueOrDefault<String>(
                                                                                    columnOrdersRecord.shippingAddress.country,
                                                                                    ' -',
                                                                                  ) != '' ? ', ' : ''}${valueOrDefault<String>(
                                                                                columnOrdersRecord.shippingAddress.postalCode,
                                                                                ' -',
                                                                              )}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            )),
                                                                          ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '12m6vygc' /* Billing address */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.edit_outlined,
                                                                                  color: Color(0xFF616A75),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ],
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
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'kg8rf5ie' /* Same as shipping address */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF616161),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (columnOrdersRecord
                                                                      .orderItems
                                                                      .cartItems
                                                                      .where((e) =>
                                                                          e.productType ==
                                                                          'product')
                                                                      .toList()
                                                                      .length >
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.45,
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
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ehgap6th' /* Designer */,
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
                                                                                if (responsiveVisibility(
                                                                                  context: context,
                                                                                  phone: false,
                                                                                  tablet: false,
                                                                                  tabletLandscape: false,
                                                                                  desktop: false,
                                                                                ))
                                                                                  Icon(
                                                                                    Icons.close,
                                                                                    color: Color(0xFF616A75),
                                                                                    size: 20.0,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final designerList = columnOrdersRecord.orderItems.cartItems.unique((e) => e.productDesignerId).where((e) => FFAppState().currentUserRoleKey == 'designer' ? (e.productDesignerId == currentUserUid) : true).toList();

                                                                                return SingleChildScrollView(
                                                                                  primary: false,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(designerList.length, (designerListIndex) {
                                                                                      final designerListItem = designerList[designerListIndex];
                                                                                      return StreamBuilder<List<UsersRecord>>(
                                                                                        stream: queryUsersRecord(
                                                                                          queryBuilder: (usersRecord) => usersRecord.where(
                                                                                            'uid',
                                                                                            isEqualTo: designerListItem.productDesignerId,
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
                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                    Colors.transparent,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          List<UsersRecord> columnUsersRecordList = snapshot.data!;
                                                                                          // Return an empty Container when the item does not exist.
                                                                                          if (snapshot.data!.isEmpty) {
                                                                                            return Container();
                                                                                          }
                                                                                          final columnUsersRecord = columnUsersRecordList.isNotEmpty ? columnUsersRecordList.first : null;

                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 6.0),
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUsersRecord?.designerMainInfo.designerInfo.name,
                                                                                                    '- ',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF005DC0),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                )),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUsersRecord?.designerMainInfo.designerId,
                                                                                                    '- ',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'l3t63aq7' /* Bridal Wear  */,
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
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'pqx6slhm' /* Contact information  */,
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
                                                                                                    if (responsiveVisibility(
                                                                                                      context: context,
                                                                                                      phone: false,
                                                                                                      tablet: false,
                                                                                                      tabletLandscape: false,
                                                                                                      desktop: false,
                                                                                                    ))
                                                                                                      Icon(
                                                                                                        Icons.edit_outlined,
                                                                                                        color: Color(0xFF616A75),
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                                    child: SelectionArea(
                                                                                                        child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        columnUsersRecord?.designerMainInfo.designerInfo.email,
                                                                                                        '- ',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF005DC0),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await Clipboard.setData(ClipboardData(text: columnUsersRecord!.designerMainInfo.designerInfo.email));
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            FFLocalizations.of(context).getVariableText(
                                                                                                              enText: 'Copied !',
                                                                                                              arText: 'منسوخ!',
                                                                                                            ),
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.content_copy,
                                                                                                      color: Color(0xFF616A75),
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUsersRecord?.designerMainInfo.designerInfo.phone,
                                                                                                    '- ',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                )),
                                                                                              ),
                                                                                              Divider(
                                                                                                height: 0.0,
                                                                                                thickness: 2.0,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
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
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'eot2c5jf' /* Address */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
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
                                                                                        Icons.edit_outlined,
                                                                                        color: Color(0xFF616A75),
                                                                                        size: 20.0,
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '1swkiegn' /* Emma Williams */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF616161),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.content_copy,
                                                                                    color: Color(0xFF616A75),
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '0mj03xi1' /* Kuwait City, Dubai, Riyadh */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF616161),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
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
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              width: 16.0))
                                                          .addToStart(SizedBox(
                                                              width: 16.0))
                                                          .addToEnd(SizedBox(
                                                              width: 16.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]
                                              .addToStart(
                                                  SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(height: 16.0)),
                                        );
                                      },
                                    ),
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
