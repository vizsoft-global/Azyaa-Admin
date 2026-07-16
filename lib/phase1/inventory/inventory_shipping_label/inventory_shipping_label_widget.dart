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
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'inventory_shipping_label_model.dart';
export 'inventory_shipping_label_model.dart';

class InventoryShippingLabelWidget extends StatefulWidget {
  const InventoryShippingLabelWidget({
    super.key,
    this.invmovemntRef,
    required this.type,
  });

  final DocumentReference? invmovemntRef;
  final String? type;

  static String routeName = 'InventoryShippingLabel';
  static String routePath = '/InventoryShippingLabel';

  @override
  State<InventoryShippingLabelWidget> createState() =>
      _InventoryShippingLabelWidgetState();
}

class _InventoryShippingLabelWidgetState
    extends State<InventoryShippingLabelWidget> {
  late InventoryShippingLabelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryShippingLabelModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.brandsDocs = await queryBrandsRecordOnce(
        queryBuilder: (brandsRecord) => brandsRecord.where(
          'status',
          isEqualTo: 'active',
        ),
      );
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.packageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController2?.text = FFLocalizations.of(context).getText(
            'bwg9tz7t' /* 0 */,
          );
        }));
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
        title: 'InventoryShippingLabel',
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
                                  child:
                                      StreamBuilder<InventorymovementlogRecord>(
                                    stream:
                                        InventorymovementlogRecord.getDocument(
                                            widget.invmovemntRef!),
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

                                      final shippingInventorymovementlogRecord =
                                          snapshot.data!;

                                      return Container(
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
                                              shippingInventorymovementlogRecord
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final columnProductsRecord =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
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
                                                                      '14hhy9tr' /* Create Shipping Labels for Inv... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color: FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primary,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
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
                                                                        RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'hbp6q5z5' /* Order  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF303030),
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '53yf086l' /* #3456 */,
                                                                                ),
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF303030),
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'nsani7y7' /*  .  */,
                                                                                ),
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF303030),
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontSize: 16.0,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '1i7tij6r' /* Jan 8, 2025 */,
                                                                                ),
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF303030),
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF303030),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
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
                                                    ].addToEnd(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: StreamBuilder<
                                                      List<SettingsRecord>>(
                                                    stream: querySettingsRecord(
                                                      queryBuilder:
                                                          (settingsRecord) =>
                                                              settingsRecord
                                                                  .where(
                                                        'type',
                                                        isEqualTo: 'Company',
                                                      ),
                                                      singleRecord: true,
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
                                                      List<SettingsRecord>
                                                          shippinglabelSettingsRecordList =
                                                          snapshot.data!;
                                                      final shippinglabelSettingsRecord =
                                                          shippinglabelSettingsRecordList
                                                                  .isNotEmpty
                                                              ? shippinglabelSettingsRecordList
                                                                  .first
                                                              : null;

                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .backgroundpage,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord.getDocument(
                                                              columnProductsRecord
                                                                  .productAuthorizer
                                                                  .productDesignerRef!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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

                                                            final columnUsersRecord =
                                                                snapshot.data!;

                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'tnz3pyxw' /* Notes */,
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
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                          TextFormField(
                                                                                            controller: _model.textController1,
                                                                                            focusNode: _model.textFieldFocusNode1,
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF616161),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'qhhr9s1c' /* First customer and order!     ... */,
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
                                                                                              enabledBorder: InputBorder.none,
                                                                                              focusedBorder: InputBorder.none,
                                                                                              errorBorder: InputBorder.none,
                                                                                              focusedErrorBorder: InputBorder.none,
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              hoverColor: Colors.transparent,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                            maxLines: 2,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            enableInteractiveSelection: true,
                                                                                            validator: _model.textController1Validator.asValidator(context),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                      ),
                                                                                    ),
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
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).border,
                                                                                      ),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(16.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'bkdh26x9' /* Shipping address */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF303030),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                if (responsiveVisibility(
                                                                                                  context: context,
                                                                                                  desktop: false,
                                                                                                ))
                                                                                                  Icon(
                                                                                                    Icons.edit_outlined,
                                                                                                    color: Color(0xFF303030),
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ire253es' /* Emma Williams */,
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
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '1fchoku6' /* Kuwait City, Dubai, Riyadh */,
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
                                                                                              ].divide(SizedBox(height: 4.0)),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'q4obvsk6' /* Pickup address */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFF303030),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                widget.type == 'restock' ? columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName : shippinglabelSettingsRecord!.settingsCompanyInfo.wearhouseAddress.shippingName,
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
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '${widget.type == 'restock' ? columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1 : shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1}, ${widget.type == 'restock' ? columnUsersRecord.designerMainInfo.designerPickupAddress.city : shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city}, ${widget.type == 'restock' ? columnUsersRecord.designerMainInfo.designerPickupAddress.country : shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country}',
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
                                                                                            ].divide(SizedBox(height: 6.0)),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '256tg80d' /* Drop address */,
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
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                widget.type == 'restock' ? shippinglabelSettingsRecord!.settingsCompanyInfo.wearhouseAddress.shippingName : columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName,
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
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                '${widget.type == 'restock' ? shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1 : columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1}, ${widget.type == 'restock' ? shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city : columnUsersRecord.designerMainInfo.designerPickupAddress.city}, ${widget.type == 'restock' ? shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country : columnUsersRecord.designerMainInfo.designerPickupAddress.country}',
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
                                                                                            ].divide(SizedBox(height: 6.0)),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 16.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                constraints: BoxConstraints(
                                                                                  maxHeight: 300.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).border,
                                                                                  ),
                                                                                ),
                                                                                child: ListView(
                                                                                  padding: EdgeInsets.fromLTRB(
                                                                                    0,
                                                                                    0,
                                                                                    0,
                                                                                    12.0,
                                                                                  ),
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'aoai81qk' /* Product */,
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
                                                                                                  fontSize: 14.0,
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
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'i5481x8r' /* Edit weight */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF005DC0),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: Image.network(
                                                                                              getCORSProxyUrl(
                                                                                                valueOrDefault<String>(
                                                                                                  columnProductsRecord.productInfo.galleryImage.firstOrNull,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/91d1v7uc478g/Vector.png',
                                                                                                ),
                                                                                              ),
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              fit: BoxFit.cover,
                                                                                              alignment: Alignment(0.0, 0.0),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    columnProductsRecord.productInfo.name,
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
                                                                                                  if (responsiveVisibility(
                                                                                                    context: context,
                                                                                                    phone: false,
                                                                                                    tablet: false,
                                                                                                    tabletLandscape: false,
                                                                                                    desktop: false,
                                                                                                  ))
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                                        border: Border.all(
                                                                                                          color: Colors.transparent,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final brandsList = columnProductsRecord.productAttribute.toList();

                                                                                                          return Wrap(
                                                                                                            spacing: 0.0,
                                                                                                            runSpacing: 0.0,
                                                                                                            alignment: WrapAlignment.start,
                                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                            direction: Axis.horizontal,
                                                                                                            runAlignment: WrapAlignment.start,
                                                                                                            verticalDirection: VerticalDirection.down,
                                                                                                            clipBehavior: Clip.none,
                                                                                                            children: List.generate(brandsList.length, (brandsListIndex) {
                                                                                                              final brandsListItem = brandsList[brandsListIndex];
                                                                                                              return Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: _model.brandsDocs!.where((e) => e.brandId == brandsListItem.attributesDefaultTermId).toList().firstOrNull!.brandInfo.name,
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
                                                                                                                          '1jmeq6bd' /*  /  */,
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
                                                                                                                          color: Color(0xFF303030),
                                                                                                                          fontSize: 10.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 6.0)).addToEnd(SizedBox(height: 6.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '0vepbkds' /* Quantity */,
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
                                                                                              ),
                                                                                              RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: widget.type == 'restock' ? shippingInventorymovementlogRecord.productQuantity.toString() : shippingInventorymovementlogRecord.enquiryInfo.affectedQuanity.toString(),
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
                                                                                                    )
                                                                                                  ],
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
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 12.0)),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).border,
                                                                                  ),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(16.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '1fc36paz' /* Package and weight */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFF303030),
                                                                                                      fontSize: 14.0,
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
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '1cw9rbsv' /* Add package */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF005DC0),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFFDFDFD),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: Color(0xFF8A8A8A),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 200.0,
                                                                                                      color: Color(0x00000000),
                                                                                                      child: ExpandableNotifier(
                                                                                                        controller: _model.expandableExpandableController,
                                                                                                        child: ExpandablePanel(
                                                                                                          header: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'aca7k9f3' /* Select Package and weight */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                                  ),
                                                                                                                  color: Color(0xFF616161),
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                          collapsed: Column(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'kwfcq075' /* Collapsed body text */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Color(0x8A000000),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          expanded: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'jxbxhwxr' /* Expanded body text */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Color(0x8A000000),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '9w4yfvjo' /* Total Weight */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          FFAppState().theme.themeMain.primaryText,
                                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 150.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FFAppState().theme.themeMain.secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  border: Border.all(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().theme.themeMain.secondaryText,
                                                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                                                    ),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          width: 50.0,
                                                                                                          child: TextFormField(
                                                                                                            controller: _model.textController2,
                                                                                                            focusNode: _model.textFieldFocusNode2,
                                                                                                            autofocus: false,
                                                                                                            enabled: true,
                                                                                                            obscureText: false,
                                                                                                            decoration: InputDecoration(
                                                                                                              isDense: true,
                                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                  ),
                                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                                'eaiswkdh' /* TextField */,
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
                                                                                                                  color: Color(0x00000000),
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Color(0x00000000),
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
                                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                            enableInteractiveSelection: true,
                                                                                                            validator: _model.textController2Validator.asValidator(context),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      FlutterFlowDropDown<String>(
                                                                                                        controller: _model.unitHieghtValueController ??= FormFieldController<String>(
                                                                                                          _model.unitHieghtValue ??= FFLocalizations.of(context).getText(
                                                                                                            'wtujciy0' /* gm */,
                                                                                                          ),
                                                                                                        ),
                                                                                                        options: [
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'cdx44i8t' /* kg */,
                                                                                                          ),
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '6hx59e1q' /* gm */,
                                                                                                          )
                                                                                                        ],
                                                                                                        onChanged: (val) => safeSetState(() => _model.unitHieghtValue = val),
                                                                                                        width: 50.0,
                                                                                                        height: 30.0,
                                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().theme.themeMain.secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                                          'mhe95cf1' /* gm */,
                                                                                                        ),
                                                                                                        icon: Icon(
                                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 18.0,
                                                                                                        ),
                                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        elevation: 0.0,
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderWidth: 8.0,
                                                                                                        borderRadius: 0.0,
                                                                                                        margin: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                        hidesUnderline: true,
                                                                                                        isOverButton: false,
                                                                                                        isSearchable: false,
                                                                                                        isMultiSelect: false,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '5o7sh6ly' /* Package Count */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        FFAppState().theme.themeMain.primaryText,
                                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 150.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.packageTextController ??= TextEditingController(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      widget.type == 'restock' ? shippingInventorymovementlogRecord.requestDeliveryInfo.packageCount.toString() : shippingInventorymovementlogRecord.enquiryDeliveryInfo.packageCount.toString(),
                                                                                                      '1',
                                                                                                    ),
                                                                                                  ),
                                                                                                  focusNode: _model.packageFocusNode,
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FFAppState().theme.themeMain.secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                                      '3msi80u3' /* 1 */,
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
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
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
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FFAppState().theme.themeMain.primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  textAlign: TextAlign.justify,
                                                                                                  maxLength: 3,
                                                                                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                                                                  buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                                  keyboardType: TextInputType.number,
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  enableInteractiveSelection: true,
                                                                                                  validator: _model.packageTextControllerValidator.asValidator(context),
                                                                                                  inputFormatters: [
                                                                                                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 16.0)),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          _model.idmapResult =
                                                                              await queryIdMapRecordOnce(
                                                                            queryBuilder: (idMapRecord) =>
                                                                                idMapRecord.where(
                                                                              'type',
                                                                              isEqualTo: 'Main',
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((shippinglabelSettingsRecord?.settingsLogisticsInfo.environment != 'test') &&
                                                                              (getCurrentTimestamp >= shippinglabelSettingsRecord!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                            _model.getAccessKeyInventory =
                                                                                await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                              env: 'prod',
                                                                              clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                              clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                              url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.getAccessKeyInventory?.succeeded ??
                                                                                true)) {
                                                                              await shippinglabelSettingsRecord.reference.update(createSettingsRecordData(
                                                                                settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                  prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                    (_model.getAccessKeyInventory?.jsonBody ?? ''),
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
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          }
                                                                          _model.settingsDocInventory =
                                                                              await querySettingsRecordOnce(
                                                                            queryBuilder: (settingsRecord) =>
                                                                                settingsRecord.where(
                                                                              'type',
                                                                              isEqualTo: 'Company',
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          if (widget.type ==
                                                                              'restock') {
                                                                            FFAppState().updateItemStruct(
                                                                              (e) => e
                                                                                ..quantity = shippingInventorymovementlogRecord.productQuantity
                                                                                ..name = columnProductsRecord.productInfo.name
                                                                                ..skuNumber = columnProductsRecord.productId
                                                                                ..sku = columnProductsRecord.productInfo.name
                                                                                ..weight = double.tryParse(_model.textController2.text),
                                                                            );
                                                                            _model.apiResultrestockCreate =
                                                                                await PrimeExpressDeliveryGroup.createDeliveryCall.call(
                                                                              env: _model.settingsDocInventory?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'prod',
                                                                              orderID: _model.idmapResult?.deliveryId.toString(),
                                                                              invtrackID: shippingInventorymovementlogRecord.requestInfo.inventoryRequestId,
                                                                              fromName: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName,
                                                                              fromPhone: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingPhone,
                                                                              fromAddress: columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1,
                                                                              fromCity: columnUsersRecord.designerMainInfo.designerPickupAddress.city,
                                                                              fromCountry: columnUsersRecord.designerMainInfo.designerPickupAddress.country,
                                                                              fromlatitude: functions.getlatlong(columnUsersRecord.designerMainInfo.designerPickupAddress.latLong!).firstOrNull,
                                                                              fromlongitude: functions.getlatlong(columnUsersRecord.designerMainInfo.designerPickupAddress.latLong!).lastOrNull,
                                                                              toName: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                              toPhone: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                              toAddress: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                              toCity: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                              toCountry: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country,
                                                                              tolatitude: functions.getlatlong(shippinglabelSettingsRecord!.settingsCompanyInfo.wearhouseAddress.latLong!).firstOrNull,
                                                                              tolongitude: functions.getlatlong(shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.latLong!).lastOrNull,
                                                                              packageCount: valueOrDefault<int>(
                                                                                int.tryParse(_model.packageTextController.text),
                                                                                1,
                                                                              ),
                                                                              url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                              amount: 0.00,
                                                                              otpOnDelivery: false,
                                                                              b2bHandling: true,
                                                                              oversized: false,
                                                                              returnStatus: false,
                                                                              key: _model.settingsDocInventory?.settingsLogisticsInfo.environment == 'test' ? _model.settingsDocInventory?.settingsLogisticsInfo.testKey : _model.settingsDocInventory?.settingsLogisticsInfo.prodKey,
                                                                              toEmail: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.shippingEmail,
                                                                              toCountryCode: 'KW',
                                                                              fromCountryCode: 'KW',
                                                                              itemsListJson: FFAppState().item.toMap(),
                                                                              deliveryInstructions: _model.textController1.text,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.apiResultrestockCreate?.succeeded ??
                                                                                true)) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text((_model.apiResultrestockCreate?.jsonBody ?? '').toString()),
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

                                                                              var deliveryRecordReference1 = DeliveryRecord.collection.doc();
                                                                              await deliveryRecordReference1.set(createDeliveryRecordData(
                                                                                createdAt: getCurrentTimestamp,
                                                                                updatedAt: getCurrentTimestamp,
                                                                                status: 'REQUESTED',
                                                                                type: 'inventory',
                                                                                inventoryMovementRef: shippingInventorymovementlogRecord.reference,
                                                                                assignedBy: currentUserReference,
                                                                                deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                  (_model.apiResultrestockCreate?.jsonBody ?? ''),
                                                                                ),
                                                                              ));
                                                                              _model.deliveryRestockResult = DeliveryRecord.getDocumentFromData(
                                                                                  createDeliveryRecordData(
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    updatedAt: getCurrentTimestamp,
                                                                                    status: 'REQUESTED',
                                                                                    type: 'inventory',
                                                                                    inventoryMovementRef: shippingInventorymovementlogRecord.reference,
                                                                                    assignedBy: currentUserReference,
                                                                                    deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                    deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                      (_model.apiResultrestockCreate?.jsonBody ?? ''),
                                                                                    ),
                                                                                  ),
                                                                                  deliveryRecordReference1);
                                                                              _shouldSetState = true;

                                                                              await shippingInventorymovementlogRecord.reference.update(createInventorymovementlogRecordData(
                                                                                updateAt: getCurrentTimestamp,
                                                                                requestInfo: createInventoryRequestInfoStruct(
                                                                                  fulfillStatus: 'DeliveryPartnerAssigned',
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                requestDeliveryInfo: createDeliveryInfoStruct(
                                                                                  deliveryRef: _model.deliveryRestockResult?.reference,
                                                                                  deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                  updatedAt: getCurrentTimestamp,
                                                                                  pickupAddress: createUserShippingaddressInfoStruct(
                                                                                    shippingEmail: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingEmail,
                                                                                    shippingPhone: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingPhone,
                                                                                    shippingName: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName,
                                                                                    addressLine1: columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1,
                                                                                    city: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingEmail,
                                                                                    country: columnUsersRecord.designerMainInfo.designerPickupAddress.country,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  deliveryAddress: createUserShippingaddressInfoStruct(
                                                                                    shippingEmail: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                                    shippingPhone: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                                    addressLine1: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                                    shippingName: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                                    city: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.city,
                                                                                    country: shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.country,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  notes: _model.textController1.text,
                                                                                  packageCount: int.tryParse(_model.packageTextController.text),
                                                                                  totalWeight: valueOrDefault<double>(
                                                                                    double.tryParse(_model.textController2.text),
                                                                                    10.0,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text('Failed to create shipping order'),
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

                                                                              await _model.idmapResult!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'delivery_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              FFAppState().item = InvitemListStruct.fromSerializableMap(jsonDecode('{\"quantity\":\"1\",\"name\":\" \",\"weight\":\"1.0\",\"skuNumber\":\" \",\"description\":\" \"}'));
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            FFAppState().updateItemStruct(
                                                                              (e) => e
                                                                                ..quantity = shippingInventorymovementlogRecord.enquiryInfo.affectedQuanity
                                                                                ..name = columnProductsRecord.productInfo.name
                                                                                ..skuNumber = columnProductsRecord.productId
                                                                                ..description = columnProductsRecord.productInfo.description
                                                                                ..sku = columnProductsRecord.productInfo.name,
                                                                            );
                                                                            _model.apiResultenquiryCreate =
                                                                                await PrimeExpressDeliveryGroup.createDeliveryCall.call(
                                                                              env: _model.settingsDocInventory?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'prod',
                                                                              orderID: _model.idmapResult?.deliveryId.toString(),
                                                                              invtrackID: shippingInventorymovementlogRecord.enquiryInfo.enquiryId,
                                                                              fromName: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                              fromPhone: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                              fromAddress: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                              fromCity: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                              fromCountry: shippinglabelSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country,
                                                                              fromlatitude: functions.getlatlong(shippinglabelSettingsRecord!.settingsCompanyInfo.wearhouseAddress.latLong!).firstOrNull,
                                                                              fromlongitude: functions.getlatlong(shippinglabelSettingsRecord.settingsCompanyInfo.wearhouseAddress.latLong!).lastOrNull,
                                                                              toName: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName,
                                                                              toPhone: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingPhone,
                                                                              toAddress: columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1,
                                                                              toCity: columnUsersRecord.designerMainInfo.designerPickupAddress.city,
                                                                              toCountry: columnUsersRecord.designerMainInfo.designerPickupAddress.country,
                                                                              tolatitude: functions.getlatlong(columnUsersRecord.designerMainInfo.designerPickupAddress.latLong!).firstOrNull,
                                                                              tolongitude: functions.getlatlong(columnUsersRecord.designerMainInfo.designerPickupAddress.latLong!).lastOrNull,
                                                                              packageCount: valueOrDefault<int>(
                                                                                int.parse(_model.packageTextController.text),
                                                                                1,
                                                                              ),
                                                                              url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                              amount: 0.00,
                                                                              otpOnDelivery: false,
                                                                              b2bHandling: true,
                                                                              oversized: false,
                                                                              returnStatus: false,
                                                                              itemsListJson: FFAppState().item.toMap(),
                                                                              key: _model.settingsDocInventory?.settingsLogisticsInfo.environment == 'test' ? _model.settingsDocInventory?.settingsLogisticsInfo.testKey : _model.settingsDocInventory?.settingsLogisticsInfo.prodKey,
                                                                              deliveryInstructions: _model.textController1.text,
                                                                              toEmail: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingEmail,
                                                                              toCountryCode: 'KW',
                                                                              fromCountryCode: 'KW',
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.apiResultenquiryCreate?.succeeded ??
                                                                                true)) {
                                                                              var deliveryRecordReference2 = DeliveryRecord.collection.doc();
                                                                              await deliveryRecordReference2.set(createDeliveryRecordData(
                                                                                createdAt: getCurrentTimestamp,
                                                                                updatedAt: getCurrentTimestamp,
                                                                                status: 'REQUESTED',
                                                                                type: 'inventory',
                                                                                inventoryMovementRef: shippingInventorymovementlogRecord.reference,
                                                                                assignedBy: currentUserReference,
                                                                                deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                  (_model.apiResultenquiryCreate?.jsonBody ?? ''),
                                                                                ),
                                                                              ));
                                                                              _model.deliveryEnquiryResult = DeliveryRecord.getDocumentFromData(
                                                                                  createDeliveryRecordData(
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    updatedAt: getCurrentTimestamp,
                                                                                    status: 'REQUESTED',
                                                                                    type: 'inventory',
                                                                                    inventoryMovementRef: shippingInventorymovementlogRecord.reference,
                                                                                    assignedBy: currentUserReference,
                                                                                    deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                    deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                      (_model.apiResultenquiryCreate?.jsonBody ?? ''),
                                                                                    ),
                                                                                  ),
                                                                                  deliveryRecordReference2);
                                                                              _shouldSetState = true;

                                                                              await shippingInventorymovementlogRecord.reference.update(createInventorymovementlogRecordData(
                                                                                updateAt: getCurrentTimestamp,
                                                                                enquiryDeliveryInfo: createDeliveryInfoStruct(
                                                                                  updatedAt: getCurrentTimestamp,
                                                                                  deliveryRef: _model.deliveryEnquiryResult?.reference,
                                                                                  deliveryId: _model.deliveryEnquiryResult?.deliveryId,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                enquiryInfo: createEnquiryInfoStruct(
                                                                                  fulfillStatus: 'DeliveryPartnerAssigned',
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text('Failed to create shipping order'),
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

                                                                              await _model.idmapResult!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'delivery_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              FFAppState().item = InvitemListStruct.fromSerializableMap(jsonDecode('{\"quantity\":\"1\",\"name\":\" \",\"weight\":\"1.0\",\"skuNumber\":\" \",\"description\":\" \"}'));
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          }

                                                                          await _model
                                                                              .idmapResult!
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'delivery_id': FieldValue.increment(1),
                                                                              },
                                                                            ),
                                                                          });
                                                                          if (Navigator.of(context)
                                                                              .canPop()) {
                                                                            context.pop();
                                                                          }
                                                                          context
                                                                              .pushNamed(InventorySMWidget.routeName);

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'j8xlgoqx' /* Create shipping order */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              36.0,
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
                                                                          color: FFAppState()
                                                                              .theme
                                                                              .themeMain
                                                                              .primaryButtoncolor,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FFAppState().theme.themeMain.primaryButtonTextColor,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]
                                                  .addToStart(
                                                      SizedBox(height: 16.0))
                                                  .addToEnd(
                                                      SizedBox(height: 16.0)),
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
