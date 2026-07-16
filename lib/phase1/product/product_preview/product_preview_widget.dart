import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_preview_model.dart';
export 'product_preview_model.dart';

class ProductPreviewWidget extends StatefulWidget {
  const ProductPreviewWidget({
    super.key,
    required this.product,
    this.stocks,
  });

  final ProductsRecord? product;
  final String? stocks;

  @override
  State<ProductPreviewWidget> createState() => _ProductPreviewWidgetState();
}

class _ProductPreviewWidgetState extends State<ProductPreviewWidget> {
  late ProductPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPreviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '3sc00c63' /* Product Preview */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.themeMain.primary,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ].addToStart(SizedBox(width: 24.0)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).border,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'yfutl60b' /* Review and approve product det... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.themeMain.primaryText,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'x0anz9zy' /* Title */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SelectionArea(
                                            child: AutoSizeText(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: () {
                                              if (widget
                                                      .product
                                                      ?.productInfoCustomTranslate
                                                      .name
                                                      .en !=
                                                  '') {
                                                return widget
                                                    .product
                                                    ?.productInfoCustomTranslate
                                                    .name
                                                    .en;
                                              } else if (widget
                                                      .product
                                                      ?.productInfoTranslate
                                                      .name
                                                      .en !=
                                                  '') {
                                                return widget
                                                    .product
                                                    ?.productInfoTranslate
                                                    .name
                                                    .en;
                                              } else {
                                                return widget
                                                    .product?.productInfo.name;
                                              }
                                            }(),
                                            arText: () {
                                              if (widget
                                                      .product
                                                      ?.productInfoCustomTranslate
                                                      .name
                                                      .ar !=
                                                  '') {
                                                return widget
                                                    .product
                                                    ?.productInfoCustomTranslate
                                                    .name
                                                    .ar;
                                              } else if (widget
                                                      .product
                                                      ?.productInfoTranslate
                                                      .name
                                                      .ar !=
                                                  '') {
                                                return widget
                                                    .product
                                                    ?.productInfoTranslate
                                                    .name
                                                    .ar;
                                              } else {
                                                return widget
                                                    .product?.productInfo.name;
                                              }
                                            }(),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'j57x7b8r' /* Description  */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SelectionArea(
                                          child: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: () {
                                            if (widget
                                                    .product
                                                    ?.productInfoCustomTranslate
                                                    .description
                                                    .en !=
                                                '') {
                                              return widget
                                                  .product
                                                  ?.productInfoCustomTranslate
                                                  .description
                                                  .en;
                                            } else if (widget
                                                    .product
                                                    ?.productInfoTranslate
                                                    .description
                                                    .en !=
                                                '') {
                                              return widget
                                                  .product
                                                  ?.productInfoTranslate
                                                  .description
                                                  .en;
                                            } else {
                                              return widget.product
                                                  ?.productInfo.description;
                                            }
                                          }(),
                                          arText: () {
                                            if (widget
                                                    .product
                                                    ?.productInfoCustomTranslate
                                                    .description
                                                    .ar !=
                                                '') {
                                              return widget
                                                  .product
                                                  ?.productInfoCustomTranslate
                                                  .description
                                                  .ar;
                                            } else if (widget
                                                    .product
                                                    ?.productInfoTranslate
                                                    .description
                                                    .ar !=
                                                '') {
                                              return widget
                                                  .product
                                                  ?.productInfoTranslate
                                                  .description
                                                  .ar;
                                            } else {
                                              return widget.product
                                                  ?.productInfo.description;
                                            }
                                          }(),
                                        ).maybeHandleOverflow(
                                          maxChars: 100,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'k3gak0y4' /* Product Status */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (widget.product?.status ==
                                              'active') {
                                            return Color(0x0D27DA69);
                                          } else if (widget.product?.status ==
                                              'inactive') {
                                            return Color(0x0EDA2744);
                                          } else if (widget.product?.status ==
                                              'request') {
                                            return Color(0x0EF9CF58);
                                          } else if (widget.product?.status ==
                                              'archived') {
                                            return Color(0x0C8F8F8F);
                                          } else {
                                            return Color(0x0EAD945A);
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: () {
                                            if (widget.product?.status ==
                                                'active') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .success;
                                            } else if (widget
                                                    .product?.status ==
                                                'inactive') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .error;
                                            } else if (widget
                                                    .product?.status ==
                                                'request') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .warning;
                                            } else if (widget
                                                    .product?.status ==
                                                'archived') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryText;
                                            } else {
                                              return Color(0xFFAD945A);
                                            }
                                          }(),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        child: Text(
                                          widget.product!.status,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: () {
                                                  if (widget.product?.status ==
                                                      'active') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if (widget
                                                          .product?.status ==
                                                      'inactive') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  } else if (widget
                                                          .product?.status ==
                                                      'request') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .warning;
                                                  } else if (widget
                                                          .product?.status ==
                                                      'archived') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText;
                                                  } else {
                                                    return Color(0xFFAD945A);
                                                  }
                                                }(),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'qw8wvx59' /* Product type */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SelectionArea(
                                          child: Text(
                                        widget.product!.product.productType,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'uid',
                                      isEqualTo: widget
                                          .product
                                          ?.productAuthorizer
                                          .productDesignerId,
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
                                    List<UsersRecord> rowUsersRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final rowUsersRecord =
                                        rowUsersRecordList.isNotEmpty
                                            ? rowUsersRecordList.first
                                            : null;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'noh5ati8' /* Designed by */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .themeMain
                                                        .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SelectionArea(
                                              child: Text(
                                            '${rowUsersRecord?.designerMainInfo.designerInfo.name} (${rowUsersRecord?.designerMainInfo.designerId})',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .themeMain
                                                        .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          )),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              if (widget.product?.product.productType ==
                                  'ready')
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                    ),
                                  ),
                                ),
                              if (widget.product?.product.productType ==
                                  'ready')
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '2g6mk8d7' /* Stock */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SelectionArea(
                                            child: Text(
                                          valueOrDefault<String>(
                                            widget.stocks,
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .secondaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              if (widget.product!.productAttribute
                                      .where((e) => e.attributesId == '1000')
                                      .toList()
                                      .length >
                                  0)
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            's7op397s' /* Size */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final colourList = widget
                                                    .product?.productAttribute
                                                    .where((e) =>
                                                        e.attributesId ==
                                                        '1000')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.attributesBrandTermIds
                                                    .toList() ??
                                                [];

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  colourList.length,
                                                  (colourListIndex) {
                                                final colourListItem =
                                                    colourList[colourListIndex];
                                                return StreamBuilder<
                                                    List<BrandsRecord>>(
                                                  stream: queryBrandsRecord(
                                                    queryBuilder:
                                                        (brandsRecord) =>
                                                            brandsRecord
                                                                .where(
                                                                  'brand_id',
                                                                  isEqualTo:
                                                                      colourListItem,
                                                                )
                                                                .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'active',
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
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<BrandsRecord>
                                                        textBrandsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final textBrandsRecord =
                                                        textBrandsRecordList
                                                                .isNotEmpty
                                                            ? textBrandsRecordList
                                                                .first
                                                            : null;

                                                    return SelectionArea(
                                                        child: Text(
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: () {
                                                          if (textBrandsRecord
                                                                  ?.brandInfoCustomTranslate
                                                                  .name
                                                                  .en !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoCustomTranslate
                                                                .name
                                                                .en;
                                                          } else if (textBrandsRecord
                                                                  ?.brandInfoTranslate
                                                                  .name
                                                                  .en !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoTranslate
                                                                .name
                                                                .en;
                                                          } else {
                                                            return textBrandsRecord
                                                                ?.brandInfo
                                                                .name;
                                                          }
                                                        }(),
                                                        arText: () {
                                                          if (textBrandsRecord
                                                                  ?.brandInfoCustomTranslate
                                                                  .name
                                                                  .ar !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoCustomTranslate
                                                                .name
                                                                .ar;
                                                          } else if (textBrandsRecord
                                                                  ?.brandInfoTranslate
                                                                  .name
                                                                  .ar !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoTranslate
                                                                .name
                                                                .ar;
                                                          } else {
                                                            return textBrandsRecord
                                                                ?.brandInfo
                                                                .name;
                                                          }
                                                        }(),
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                  .secondaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                            ),
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ));
                                                  },
                                                );
                                              }).divide(SizedBox(width: 4.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (widget.product!.productAttribute
                                      .where((e) => e.attributesId == '1000')
                                      .toList()
                                      .length >
                                  0)
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                    ),
                                  ),
                                ),
                              if (widget.product!.productAttribute
                                      .where((e) => e.attributesId == '1001')
                                      .toList()
                                      .length >
                                  0)
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '42zxk7f8' /* Color */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .themeMain
                                                      .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final sizeList = widget
                                                    .product?.productAttribute
                                                    .where((e) =>
                                                        e.attributesId ==
                                                        '1001')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.attributesBrandTermIds
                                                    .toList() ??
                                                [];

                                            return Wrap(
                                              spacing: 8.0,
                                              runSpacing: 8.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children:
                                                  List.generate(sizeList.length,
                                                      (sizeListIndex) {
                                                final sizeListItem =
                                                    sizeList[sizeListIndex];
                                                return StreamBuilder<
                                                    List<BrandsRecord>>(
                                                  stream: queryBrandsRecord(
                                                    queryBuilder:
                                                        (brandsRecord) =>
                                                            brandsRecord
                                                                .where(
                                                                  'brand_id',
                                                                  isEqualTo:
                                                                      sizeListItem,
                                                                )
                                                                .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'active',
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
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<BrandsRecord>
                                                        textBrandsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final textBrandsRecord =
                                                        textBrandsRecordList
                                                                .isNotEmpty
                                                            ? textBrandsRecordList
                                                                .first
                                                            : null;

                                                    return SelectionArea(
                                                        child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: () {
                                                          if (textBrandsRecord
                                                                  ?.brandInfoCustomTranslate
                                                                  .name
                                                                  .en !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoCustomTranslate
                                                                .name
                                                                .en;
                                                          } else if (textBrandsRecord
                                                                  ?.brandInfoTranslate
                                                                  .name
                                                                  .en !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoTranslate
                                                                .name
                                                                .en;
                                                          } else {
                                                            return textBrandsRecord
                                                                ?.brandInfo
                                                                .name;
                                                          }
                                                        }(),
                                                        arText: () {
                                                          if (textBrandsRecord
                                                                  ?.brandInfoCustomTranslate
                                                                  .name
                                                                  .ar !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoCustomTranslate
                                                                .name
                                                                .ar;
                                                          } else if (textBrandsRecord
                                                                  ?.brandInfoTranslate
                                                                  .name
                                                                  .ar !=
                                                              '') {
                                                            return textBrandsRecord
                                                                ?.brandInfoTranslate
                                                                .name
                                                                .ar;
                                                          } else {
                                                            return textBrandsRecord
                                                                ?.brandInfo
                                                                .name;
                                                          }
                                                        }(),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                  .secondaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                            ),
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ));
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'dn5uzmva' /* Commission */,
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
                                              color: Color(0xFF303030),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              if (valueOrDefault<bool>(
                                                widget
                                                    .product
                                                    ?.productAuthorizer
                                                    .isAffiliateProduct,
                                                false,
                                              ))
                                                Text(
                                                  '${valueOrDefault<String>(
                                                    widget
                                                        .product
                                                        ?.productAuthorizer
                                                        .affiliateCommissionRate
                                                        .toString(),
                                                    '0',
                                                  )}${FFLocalizations.of(context).getVariableText(
                                                    enText: ' rate | ',
                                                    arText: 'معدل |',
                                                  )}${valueOrDefault<String>(
                                                    widget
                                                        .product
                                                        ?.productAuthorizer
                                                        .affiliateCommissionPoints
                                                        .toString(),
                                                    '0',
                                                  )}${FFLocalizations.of(context).getVariableText(
                                                    enText: ' point',
                                                    arText: 'نقطة',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              if (valueOrDefault<bool>(
                                                    widget
                                                        .product
                                                        ?.productAuthorizer
                                                        .isAffiliateProduct,
                                                    false,
                                                  ) ==
                                                  false)
                                                SelectionArea(
                                                    child: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: 'No affiliation',
                                                    arText: 'لا انتماء',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                              .theme
                                                              .themeMain
                                                              .secondaryText,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                        ),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.product!.productAttribute
                                      .where((e) => e.attributesId == '1001')
                                      .toList()
                                      .length >
                                  0)
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                    ),
                                  ),
                                ),
                              if (true /* Warning: Trying to access variable not yet defined. */)
                                StreamBuilder<List<TagsRecord>>(
                                  stream: queryTagsRecord(
                                    queryBuilder: (tagsRecord) => tagsRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'active',
                                        )
                                        .where(
                                          'tag_product_id',
                                          arrayContains:
                                              widget.product?.productId,
                                        ),
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
                                    List<TagsRecord> containerTagsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            containerTagsRecordList.length > 0,
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 200.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vrflw9we' /* Tags */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                              .theme
                                                              .themeMain
                                                              .primaryText,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                        ),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final tagList1 =
                                                        containerTagsRecordList
                                                            .toList();

                                                    return Wrap(
                                                      spacing: 8.0,
                                                      runSpacing: 8.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          tagList1.length,
                                                          (tagList1Index) {
                                                        final tagList1Item =
                                                            tagList1[
                                                                tagList1Index];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        8.0,
                                                                        4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText: () {
                                                                      if (tagList1Item
                                                                              .tagInfoCustomTranslate
                                                                              .name
                                                                              .en !=
                                                                          '') {
                                                                        return tagList1Item
                                                                            .tagInfoCustomTranslate
                                                                            .name
                                                                            .en;
                                                                      } else if (tagList1Item
                                                                              .tagInfoTranslate
                                                                              .name
                                                                              .en !=
                                                                          '') {
                                                                        return tagList1Item
                                                                            .tagInfoTranslate
                                                                            .name
                                                                            .en;
                                                                      } else {
                                                                        return tagList1Item
                                                                            .tagInfo
                                                                            .name;
                                                                      }
                                                                    }(),
                                                                    arText: () {
                                                                      if (tagList1Item
                                                                              .tagInfoCustomTranslate
                                                                              .name
                                                                              .ar !=
                                                                          '') {
                                                                        return tagList1Item
                                                                            .tagInfoCustomTranslate
                                                                            .name
                                                                            .ar;
                                                                      } else if (tagList1Item
                                                                              .tagInfoTranslate
                                                                              .name
                                                                              .ar !=
                                                                          '') {
                                                                        return tagList1Item
                                                                            .tagInfoTranslate
                                                                            .name
                                                                            .ar;
                                                                      } else {
                                                                        return tagList1Item
                                                                            .tagInfo
                                                                            .name;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
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
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 18.0,
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 0.0)),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '4e7g2vf0' /* SKU */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'rnl3ra7q' /* Designer Price */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'zg5jpya3' /* Azyaa Commission  */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'yeexe054' /* Total Price */,
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .primaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SelectionArea(
                                          child: Text(
                                        widget.product!.product.sku.toString(),
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                    ),
                                    Expanded(
                                      child: SelectionArea(
                                          child: Text(
                                        '${widget.product?.product.productPrice.toString()} KD',
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                    ),
                                    Expanded(
                                      child: SelectionArea(
                                          child: Text(
                                        '${valueOrDefault<String>(
                                          widget.product?.productAuthorizer
                                              .affiliateCommissionRate
                                              .toString(),
                                          '0',
                                        )} %',
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                    ),
                                    Expanded(
                                      child: SelectionArea(
                                          child: Text(
                                        '${widget.product?.product.productPrice.toString()} KD',
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
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .themeMain
                                                    .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              if (() {
                                if (widget.product?.productInfo
                                            .featureImage !=
                                        null &&
                                    widget.product?.productInfo
                                            .featureImage !=
                                        '') {
                                  return true;
                                } else if (widget.product?.productInfo
                                            .galleryImage.firstOrNull !=
                                        null &&
                                    widget.product?.productInfo.galleryImage
                                            .firstOrNull !=
                                        '') {
                                  return true;
                                } else {
                                  return false;
                                }
                              }())
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 170.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    getCORSProxyUrl(
                                                      widget
                                                          .product!
                                                          .productInfo
                                                          .featureImage,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  useHeroAnimation: false,
                                                ),
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              getCORSProxyUrl(
                                                widget.product!.productInfo
                                                    .featureImage,
                                              ),
                                              width: 150.0,
                                              fit: BoxFit.cover,
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
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              getCORSProxyUrl(
                                                widget.product!.productInfo
                                                    .galleryImage.firstOrNull!,
                                              ),
                                              width: 150.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (widget.product!.productInfo
                                                .galleryImage.length >
                                            1)
                                          Container(
                                            width: 150.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    getCORSProxyUrl(
                                                      widget
                                                          .product!
                                                          .productInfo
                                                          .galleryImage
                                                          .elementAtOrNull(1)!,
                                                    ),
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                if ((widget
                                                            .product!
                                                            .productInfo
                                                            .galleryImage
                                                            .length -
                                                        1) >
                                                    2)
                                                  Text(
                                                    '${(widget.product!.productInfo.galleryImage.length - 1).toString()} +',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((FFAppState()
                                      .currentUserPermission
                                      .contains(_model.permissionKeyDelete) ==
                                  true) &&
                              (widget.product?.status != 'archived'))
                            FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'Do you want to delete this Product?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await widget.product!.reference
                                      .update(createProductsRecordData(
                                    status: 'archived',
                                  ));

                                  await widget.product!.product.inventoryRef!
                                      .update(createInventoryRecordData(
                                    status: 'archived',
                                  ));
                                  Navigator.pop(context);
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                'ivjcmdb4' /* Delete */,
                              ),
                              options: FFButtonOptions(
                                height: 30.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFE51C00),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFE51C00),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              _model.presentProductTranslationResult1 =
                                  await ProductsRecord.getDocumentOnce(
                                      widget.product!.reference);
                              FFAppState().updateAdminFlowStruct(
                                (e) => e
                                  ..updateProduct(
                                    (e) => e
                                      ..productInfo = _model
                                          .presentProductTranslationResult1
                                          ?.productInfo
                                      ..productInfoAuto = _model
                                          .presentProductTranslationResult1
                                          ?.productInfoTranslate
                                      ..productInfoCustom = _model
                                          .presentProductTranslationResult1
                                          ?.productInfoCustomTranslate,
                                  ),
                              );
                              unawaited(
                                () async {
                                  Navigator.pop(context);
                                }(),
                              );

                              context.pushNamed(
                                TranslationWidget.routeName,
                                queryParameters: {
                                  'type': serializeParam(
                                    'Products',
                                    ParamType.String,
                                  ),
                                  'product': serializeParam(
                                    _model.presentProductTranslationResult1,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'product':
                                      _model.presentProductTranslationResult1,
                                },
                              );

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '76bsk95t' /* Translation */,
                            ),
                            icon: Icon(
                              Icons.translate_sharp,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FFAppState()
                                  .theme
                                  .themeMain
                                  .secondaryButtonColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FFAppState()
                                        .theme
                                        .themeMain
                                        .secondaryButtonTextColor,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FFAppState()
                                    .theme
                                    .themeMain
                                    .secondaryButtonBorder!,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          if ((valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'SuperAdmin') &&
                              (widget.product?.status != 'active'))
                            AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await widget.product!.reference
                                      .update(createProductsRecordData(
                                    updatedAt: getCurrentTimestamp,
                                    status: 'active',
                                  ));

                                  await widget.product!.product.inventoryRef!
                                      .update(createInventoryRecordData(
                                    status: 'active',
                                    updatedAt: getCurrentTimestamp,
                                  ));
                                  FFAppState().updateAdminFlowStruct(
                                    (e) => e..product = null,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Product approved its live',
                                          arText:
                                              'تمت الموافقة على المنتج مباشرة',
                                        ),
                                        style: GoogleFonts.inter(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                text: FFLocalizations.of(context).getText(
                                  'vc7qonfi' /* Approve */,
                                ),
                                options: FFButtonOptions(
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .azyaaAccepted,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FFAppState()
                                            .theme
                                            .themeMain
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .azyaaAccepted,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          if (FFAppState()
                                  .currentUserPermission
                                  .contains(_model.permissionKeyEdit) ==
                              true)
                            FFButtonWidget(
                              onPressed: () async {
                                _model.presentProductResult =
                                    await ProductsRecord.getDocumentOnce(
                                        widget.product!.reference);
                                _model.categoryResult =
                                    await queryCategoryRecordOnce(
                                  queryBuilder: (categoryRecord) =>
                                      categoryRecord
                                          .where(
                                            'status',
                                            isEqualTo: 'active',
                                          )
                                          .where(
                                            'category_product_list',
                                            arrayContains:
                                                widget.product?.productId,
                                          ),
                                );
                                _model.tagResult = await queryTagsRecordOnce(
                                  queryBuilder: (tagsRecord) => tagsRecord
                                      .where(
                                        'status',
                                        isEqualTo: 'active',
                                      )
                                      .where(
                                        'tag_product_id',
                                        arrayContains:
                                            widget.product?.productId,
                                      ),
                                );
                                FFAppState().updateAdminFlowStruct(
                                  (e) => e
                                    ..updateProduct(
                                      (e) => e
                                        ..status =
                                            _model.presentProductResult?.status
                                        ..productType = _model
                                            .presentProductResult
                                            ?.product
                                            .productType
                                        ..productId = _model
                                            .presentProductResult?.productId
                                        ..productInfo = _model
                                            .presentProductResult?.productInfo
                                        ..product =
                                            _model.presentProductResult?.product
                                        ..productAuthor = _model
                                            .presentProductResult
                                            ?.productAuthorizer
                                        ..productMarket = _model
                                            .presentProductResult
                                            ?.productMarketing
                                        ..productAttribute = _model
                                            .presentProductResult!
                                            .productAttribute
                                            .toList()
                                        ..categoryIds = _model.categoryResult!
                                            .map((e) => e.categoryId)
                                            .toList()
                                        ..tagIds = _model.tagResult!
                                            .map((e) => e.tagId)
                                            .toList()
                                        ..productIsReturnable = widget
                                            .product?.product.isProductReturn
                                        ..productReturnWindowDays = widget
                                            .product
                                            ?.product
                                            .returnProductNumberDay
                                        ..sku = valueOrDefault<int>(
                                          widget.product?.product.sku,
                                          0,
                                        ),
                                    ),
                                );
                                Navigator.pop(context);

                                context.pushNamed(
                                  ProductEditWidget.routeName,
                                  queryParameters: {
                                    'product': serializeParam(
                                      widget.product?.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'kk5cw6r4' /* Edit */,
                              ),
                              options: FFButtonOptions(
                                height: 30.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState()
                                    .theme
                                    .themeMain
                                    .secondaryButtonColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FFAppState()
                                          .theme
                                          .themeMain
                                          .secondaryButtonTextColor,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FFAppState()
                                      .theme
                                      .themeMain
                                      .secondaryButtonBorder!,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
        wrapWithModel(
          model: _model.themeStatusCheckerModel,
          updateCallback: () => safeSetState(() {}),
          child: ThemeStatusCheckerWidget(),
        ),
      ],
    );
  }
}
