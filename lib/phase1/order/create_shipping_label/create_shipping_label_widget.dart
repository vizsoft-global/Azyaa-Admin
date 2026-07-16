import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
import '/phase1/component/blank_loading/blank_loading_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/phase1/order/weightcomp/weightcomp_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_shipping_label_model.dart';
export 'create_shipping_label_model.dart';

class CreateShippingLabelWidget extends StatefulWidget {
  const CreateShippingLabelWidget({
    super.key,
    required this.orderRef,
    required this.type,
    this.cartIndex,
  });

  final DocumentReference? orderRef;
  final String? type;
  final int? cartIndex;

  static String routeName = 'Create-Shipping-Label';
  static String routePath = '/createShippingLabel';

  @override
  State<CreateShippingLabelWidget> createState() =>
      _CreateShippingLabelWidgetState();
}

class _CreateShippingLabelWidgetState extends State<CreateShippingLabelWidget> {
  late CreateShippingLabelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateShippingLabelModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.totalWeightTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().deliveryflow.totalWeightCm.toString(),
      '0.0',
    ));
    _model.totalWeightFocusNode ??= FocusNode();

    _model.packageCountTextController ??= TextEditingController();
    _model.packageCountFocusNode ??= FocusNode();

    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false)
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
        title: 'Create-Shipping-Label',
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
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
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
                                          return Container(
                                            width: 0.0,
                                            height: 0.0,
                                            child: BlankLoadingWidget(),
                                          );
                                        }
                                        List<SettingsRecord>
                                            containerSettingsRecordList =
                                            snapshot.data!;
                                        final containerSettingsRecord =
                                            containerSettingsRecordList
                                                    .isNotEmpty
                                                ? containerSettingsRecordList
                                                    .first
                                                : null;

                                        return Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
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

                                                final ordersOrdersRecord =
                                                    snapshot.data!;

                                                return Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .backgroundpage,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color: Color(0xFFE6E7EB),
                                                    ),
                                                  ),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream: UsersRecord
                                                        .getDocument(FFAppState()
                                                            .deliveryflow
                                                            .selectedItemss
                                                            .firstOrNull!
                                                            .productDesignerRef!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Container(
                                                          width: 0.0,
                                                          height: 0.0,
                                                          child:
                                                              BlankLoadingWidget(),
                                                        );
                                                      }

                                                      final columnUsersRecord =
                                                          snapshot.data!;

                                                      return Column(
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
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
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
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().itemsList =
                                                                              [];
                                                                          context
                                                                              .safePop();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).border,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_back,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 20.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'd2txfogs' /* Create Shipping Labels */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault<Color>(
                                                                                      FFAppState().theme.themeMain.primary,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'v9dsx1ns' /* Order :  */,
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
                                                                                        text: ordersOrdersRecord.orderId,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )
                                                                                    ],
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
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: widget.type == 'shipcustomer' ? 'Ship to Customer' : 'Pickup from Designer',
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
                                                                                      )
                                                                                    ],
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
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Button pressed ...');
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'rep1oqlz' /* Print packing slip */,
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
                                                                        color: Color(
                                                                            0xFFCBCBCB),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
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
                                                                              Color(0xFFCBCBCB),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .notificatioAlertModel,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      NotificatioAlertWidget(),
                                                                ),
                                                              ].addToEnd(
                                                                  SizedBox(
                                                                      width:
                                                                          12.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .backgroundpage,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            0.0),
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
                                                                                  height: 120.0,
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
                                                                                              'oxa7k7vb' /* Notes */,
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
                                                                                            focusNode: _model.textFieldFocusNode,
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
                                                                                                'mcx3mmpy' /* First customer and order! */,
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
                                                                                                  color: Colors.transparent,
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                  topRight: Radius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                  topRight: Radius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                  topRight: Radius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(4.0),
                                                                                                  topRight: Radius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                    'loo6kj16' /* Shipping address */,
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
                                                                                                    't8gc7f2s' /* Emma Williams */,
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
                                                                                                    '3vd6qe1v' /* Kuwait City, Dubai, Riyadh */,
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
                                                                                                  't3bbv33w' /* Pickup address */,
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
                                                                                                widget.type == 'shipcustomer' ? containerSettingsRecord!.settingsCompanyInfo.wearhouseAddress.addressLine1 : columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName,
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
                                                                                              RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1 : columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1,
                                                                                                        '-',
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
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'emidh1kg' /* ,  */,
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city : columnUsersRecord.designerMainInfo.designerPickupAddress.city,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'bjdrux2j' /* ,  */,
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.state : columnUsersRecord.designerMainInfo.designerPickupAddress.state,
                                                                                                        ' - ',
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'yy8jdlau' /* ,  */,
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country : columnUsersRecord.designerMainInfo.designerPickupAddress.country,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    )
                                                                                                  ],
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
                                                                                                  'qkdjge1m' /* Drop address */,
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
                                                                                                valueOrDefault<String>(
                                                                                                  widget.type == 'shipcustomer' ? ordersOrdersRecord.shippingAddress.shippingName : containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                                                  '-',
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
                                                                                              RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? ordersOrdersRecord.shippingAddress.addressLine1 : containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                                                        '-',
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
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'oqot502k' /* ,  */,
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? ordersOrdersRecord.shippingAddress.city : containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'y1ukwgzd' /* ,  */,
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? ordersOrdersRecord.shippingAddress.state : containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.state,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'd8y4b8cl' /* ,  */,
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        widget.type == 'shipcustomer' ? ordersOrdersRecord.shippingAddress.country : containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: TextStyle(),
                                                                                                    )
                                                                                                  ],
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
                                                                                            ].divide(SizedBox(height: 4.0)),
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
                                                                                  child: Padding(
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
                                                                                                      'yabyux4i' /* Selected by customer */,
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
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'ahu97m5e' /* Free shipping */,
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
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6pv50e82' /* KWD 0.00 */,
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
                                                                                                ],
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 2.0,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '3l6nh163' /* Shipping service */,
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
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      border: Border.all(
                                                                                                        color: Color(0xFF8A8A8A),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    'f14aejs3' /* Sort by  */,
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
                                                                                                                )
                                                                                                              ],
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
                                                                                                          ),
                                                                                                          Icon(
                                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                                            color: Color(0xFF303030),
                                                                                                            size: 16.0,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
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
                                                                                                    padding: EdgeInsets.all(16.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/fedex.png',
                                                                                                            width: 60.0,
                                                                                                            height: 40.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '85x7gh8n' /* FedEx Home Delivery® by Shippo */,
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
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'i2ujki9o' /* KWD 10.00 */,
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
                                                                                                                ].divide(SizedBox(width: 16.0)),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'cst9nyoc' /* Including insurance (up to KWD... */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          color: Color(0xFF616161),
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'zd8rzc7w' /* 1 business day */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          color: Color(0xFF616161),
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(width: 16.0)),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 16.0)),
                                                                                          ),
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
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'm6lm57mg' /* Item */,
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
                                                                                                'wf93u9xf' /* Edit weight */,
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
                                                                                    Expanded(
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final productList = FFAppState().deliveryflow.selectedItemss.map((e) => e).toList();

                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.fromLTRB(
                                                                                              0,
                                                                                              0,
                                                                                              0,
                                                                                              12.0,
                                                                                            ),
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: productList.length,
                                                                                            itemBuilder: (context, productListIndex) {
                                                                                              final productListItem = productList[productListIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                                                                                                child: Wrap(
                                                                                                  spacing: 12.0,
                                                                                                  runSpacing: 12.0,
                                                                                                  alignment: WrapAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                  direction: Axis.horizontal,
                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                  clipBehavior: Clip.none,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        child: Image.network(
                                                                                                          getCORSProxyUrl(
                                                                                                            productListItem.productInfo.featureImage != '' ? productListItem.productInfo.featureImage : productListItem.productInfo.galleryImage.firstOrNull!,
                                                                                                          ),
                                                                                                          width: 60.0,
                                                                                                          height: 60.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                          alignment: Alignment(0.0, 0.0),
                                                                                                        ),
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
                                                                                                            productListItem.productInfo.name,
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
                                                                                                          if (responsiveVisibility(
                                                                                                            context: context,
                                                                                                            phone: false,
                                                                                                            tablet: false,
                                                                                                            tabletLandscape: false,
                                                                                                            desktop: false,
                                                                                                          ))
                                                                                                            Container(
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Colors.transparent,
                                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                                                border: Border.all(
                                                                                                                  color: Colors.transparent,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          '842pn45f' /* White */,
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
                                                                                                                          '5uuxrle5' /*  /  */,
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
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          Builder(
                                                                                                            builder: (context) {
                                                                                                              final attributeList = productListItem.cartItemAttribute.toList();

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
                                                                                                                                        '2akxf4q8' /*  -  */,
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
                                                                                                        ].divide(SizedBox(height: 8.0)).addToStart(SizedBox(height: 4.0)).addToEnd(SizedBox(height: 12.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'jiqzlprz' /* Quantity */,
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
                                                                                                                  text: valueOrDefault<String>(
                                                                                                                    productListItem.quantity.toString(),
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
                                                                                                        ].divide(SizedBox(height: 2.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        border: Border.all(
                                                                                                          color: Color(0xFF8A8A8A),
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: WeightcompWidget(
                                                                                                        key: Key('Keylw7_${productListIndex}_of_${productList.length}'),
                                                                                                        weight: productListItem.productStockInfo.weightGm,
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (FFAppState().deliveryflow.selectedItemss.length > 1)
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderColor: FFAppState().theme.themeMain.primary,
                                                                                                        borderRadius: 8.0,
                                                                                                        borderWidth: 0.5,
                                                                                                        buttonSize: 30.0,
                                                                                                        fillColor: FFAppState().theme.themeMain.secondary,
                                                                                                        icon: Icon(
                                                                                                          Icons.close,
                                                                                                          color: FFAppState().theme.themeMain.primary,
                                                                                                          size: 15.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          FFAppState().updateDeliveryflowStruct(
                                                                                                            (e) => e
                                                                                                              ..updateSelectedItemss(
                                                                                                                (e) => e.remove(productListItem),
                                                                                                              ),
                                                                                                          );
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ].addToEnd(SizedBox(height: 16.0)),
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
                                                                                                  'uqmnn2pe' /* Package and weight */,
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
                                                                                                    'tx14g9sq' /* Add package */,
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
                                                                                                        controller: _model.expandableExpandableController1,
                                                                                                        child: ExpandablePanel(
                                                                                                          header: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'lhomwv7j' /* Select Package and weight */,
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
                                                                                                                  'r3zoxn3k' /* Collapsed body text */,
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
                                                                                                                  'pc9z54ql' /* Expanded body text */,
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
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'gyyqiq6x' /* Total Weight */,
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
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 50.0,
                                                                                                        child: TextFormField(
                                                                                                          controller: _model.totalWeightTextController,
                                                                                                          focusNode: _model.totalWeightFocusNode,
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
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    FFAppState().theme.themeMain.secondaryText,
                                                                                                                    FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                ),
                                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                                              'eahvfvbo' /* 500 */,
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
                                                                                                          validator: _model.totalWeightTextControllerValidator.asValidator(context),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    FlutterFlowDropDown<String>(
                                                                                                      controller: _model.dropDownValueController ??= FormFieldController<String>(
                                                                                                        _model.dropDownValue ??= FFLocalizations.of(context).getText(
                                                                                                          '80cidqxl' /* gm */,
                                                                                                        ),
                                                                                                      ),
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'vk8t0eae' /* gm */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'ohylgb8t' /* kg */,
                                                                                                        )
                                                                                                      ],
                                                                                                      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                                                                                                      width: 70.0,
                                                                                                      height: 40.0,
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
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        '41ok5bpf' /* gm */,
                                                                                                      ),
                                                                                                      icon: Icon(
                                                                                                        Icons.keyboard_arrow_down_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      elevation: 2.0,
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderWidth: 0.0,
                                                                                                      borderRadius: 8.0,
                                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      hidesUnderline: true,
                                                                                                      isOverButton: false,
                                                                                                      isSearchable: false,
                                                                                                      isMultiSelect: false,
                                                                                                    ),
                                                                                                  ],
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
                                                                                                  '54ystbrz' /* Package Count */,
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
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 50.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.packageCountTextController,
                                                                                                    focusNode: _model.packageCountFocusNode,
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
                                                                                                            color: valueOrDefault<Color>(
                                                                                                              FFAppState().theme.themeMain.secondaryText,
                                                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'r2jwov2s' /* 1 */,
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
                                                                                                    validator: _model.packageCountTextControllerValidator.asValidator(context),
                                                                                                  ),
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
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
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
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'mzdp2xi7' /* Summary */,
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
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'pat3icb5' /* Subtotal */,
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
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'hbvydgia' /* KWD 20.00 */,
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
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'xjjcbie7' /* Azyaa plan discount  */,
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
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '7falfn55' /* KWD 20.00 */,
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
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '00wb4y8b' /* Total */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFF303030),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'lk9ll464' /* KWD 20.00 */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFF303030),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(
                                                                                            thickness: 2.0,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '5ziyl13b' /* Shipping date */,
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
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                height: 80.0,
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
                                                                                                      controller: _model.expandableExpandableController2,
                                                                                                      child: ExpandablePanel(
                                                                                                        header: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'ufw8bz6o' /* Today */,
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
                                                                                                                'v7o7yxnl' /* Collapsed body text */,
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
                                                                                                                'bnq5pxwp' /* Expanded body text */,
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
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
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
                                                                                                    value: _model.checkboxValue ??= true,
                                                                                                    onChanged: (newValue) async {
                                                                                                      safeSetState(() => _model.checkboxValue = newValue!);
                                                                                                    },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: RichText(
                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                    text: TextSpan(
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                            'tuwgowp0' /* Send a  */,
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
                                                                                                        TextSpan(
                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                            'netijh1v' /* shipping information */,
                                                                                                          ),
                                                                                                          style: TextStyle(
                                                                                                            color: Color(0xFF005DC0),
                                                                                                            fontSize: 14.0,
                                                                                                            decoration: TextDecoration.underline,
                                                                                                          ),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                            '7o7xr71t' /*  to the customer now. */,
                                                                                                          ),
                                                                                                          style: TextStyle(
                                                                                                            color: Color(0xFF303030),
                                                                                                            fontSize: 14.0,
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
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
                                                                                                    textAlign: TextAlign.start,
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'fevt7lkv' /* By buying this Azyaa shipping ... */,
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
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'u4t5xg75' /* terms of services  */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: Color(0xFF005DC0),
                                                                                                      fontSize: 14.0,
                                                                                                      decoration: TextDecoration.underline,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
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
                                                                                            ),
                                                                                        ].divide(SizedBox(height: 16.0)),
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
                                                                  if (widget
                                                                          .type ==
                                                                      'shipcustomer')
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (_model.formKey.currentState == null ||
                                                                                !_model.formKey.currentState!.validate()) {
                                                                              return;
                                                                            }
                                                                            _model.count =
                                                                                FFAppState().deliveryflow.selectedItemss.length;
                                                                            while (_model.count! >
                                                                                0) {
                                                                              FFAppState().addToItemsList(InvitemListStruct(
                                                                                quantity: FFAppState().deliveryflow.selectedItemss.elementAtOrNull((_model.count!) - 1)?.quantity,
                                                                                name: FFAppState().deliveryflow.selectedItemss.elementAtOrNull((_model.count!) - 1)?.productInfo.name,
                                                                                sku: valueOrDefault<String>(
                                                                                  FFAppState().deliveryflow.selectedItemss.elementAtOrNull((_model.count!) - 1)?.productInfo.name,
                                                                                  '-',
                                                                                ),
                                                                                skuNumber: FFAppState().deliveryflow.selectedItemss.elementAtOrNull((_model.count!) - 1)?.productId,
                                                                                weight: FFAppState().deliveryflow.selectedItemss.elementAtOrNull((_model.count!) - 1)?.productStockInfo.weightGm,
                                                                                weightUnit: 'gm',
                                                                              ));
                                                                              _model.addToProductIds(FFAppState().deliveryflow.selectedItemss.elementAtOrNull((_model.count!) - 1)!.productId);
                                                                              _model.count = (_model.count!) - 1;
                                                                            }
                                                                            _model.idmapResult =
                                                                                await queryIdMapRecordOnce(
                                                                              queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                'type',
                                                                                isEqualTo: 'Main',
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((containerSettingsRecord?.settingsLogisticsInfo.environment != 'test') &&
                                                                                (getCurrentTimestamp >= containerSettingsRecord!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                              _model.getAccessKey = await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                                env: 'prod',
                                                                                clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                                clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                                url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                              );

                                                                              _shouldSetState = true;
                                                                              if ((_model.getAccessKey?.succeeded ?? true)) {
                                                                                await containerSettingsRecord.reference.update(createSettingsRecordData(
                                                                                  settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                    prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                      (_model.getAccessKey?.jsonBody ?? ''),
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
                                                                                FFAppState().itemsList = [];
                                                                                _model.productIds = [];
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            }
                                                                            _model.settingsDoc =
                                                                                await querySettingsRecordOnce(
                                                                              queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                'type',
                                                                                isEqualTo: 'Company',
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.apiResultShippingCreate =
                                                                                await PrimeExpressDeliveryGroup.createDeliveryCall.call(
                                                                              env: _model.settingsDoc?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'prod',
                                                                              orderID: _model.idmapResult?.deliveryId.toString(),
                                                                              invtrackID: ordersOrdersRecord.orderId,
                                                                              fromName: _model.settingsDoc?.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                              fromPhone: _model.settingsDoc?.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                              fromAddress: _model.settingsDoc?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                              fromCity: _model.settingsDoc?.settingsCompanyInfo.wearhouseAddress.city,
                                                                              fromCountry: _model.settingsDoc?.settingsCompanyInfo.wearhouseAddress.country,
                                                                              fromlatitude: functions.getlatlong(_model.settingsDoc!.settingsCompanyInfo.wearhouseAddress.latLong!).firstOrNull,
                                                                              fromlongitude: functions.getlatlong(_model.settingsDoc!.settingsCompanyInfo.wearhouseAddress.latLong!).lastOrNull,
                                                                              toName: ordersOrdersRecord.shippingAddress.shippingName,
                                                                              toPhone: ordersOrdersRecord.shippingAddress.shippingPhone,
                                                                              toAddress: ordersOrdersRecord.shippingAddress.addressLine1,
                                                                              toCity: ordersOrdersRecord.shippingAddress.city,
                                                                              toCountry: ordersOrdersRecord.shippingAddress.country,
                                                                              tolatitude: functions.getlatlong(ordersOrdersRecord.shippingAddress.latLong!).firstOrNull,
                                                                              tolongitude: functions.getlatlong(ordersOrdersRecord.shippingAddress.latLong!).lastOrNull,
                                                                              packageCount: valueOrDefault<int>(
                                                                                int.parse(_model.packageCountTextController.text),
                                                                                1,
                                                                              ),
                                                                              url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                              amount: 0.00,
                                                                              otpOnDelivery: false,
                                                                              b2bHandling: false,
                                                                              oversized: false,
                                                                              returnStatus: false,
                                                                              itemsListJson: FFAppState().itemsList.map((e) => e.toMap()).toList(),
                                                                              key: _model.settingsDoc?.settingsLogisticsInfo.environment == 'test' ? _model.settingsDoc?.settingsLogisticsInfo.testKey : _model.settingsDoc?.settingsLogisticsInfo.prodKey,
                                                                              deliveryInstructions: _model.textController1.text,
                                                                              toEmail: ordersOrdersRecord.shippingAddress.shippingEmail,
                                                                              fromCountryCode: 'KW',
                                                                              toCountryCode: 'KW',
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.apiResultShippingCreate?.succeeded ??
                                                                                true)) {
                                                                              var deliveryRecordReference = DeliveryRecord.collection.doc();
                                                                              await deliveryRecordReference.set(createDeliveryRecordData(
                                                                                createdAt: getCurrentTimestamp,
                                                                                updatedAt: getCurrentTimestamp,
                                                                                type: 'order',
                                                                                status: 'REQUESTED',
                                                                                orderRef: widget.orderRef,
                                                                                assignedBy: currentUserReference,
                                                                                deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                  (_model.apiResultShippingCreate?.jsonBody ?? ''),
                                                                                ),
                                                                              ));
                                                                              _model.deliveryDoc = DeliveryRecord.getDocumentFromData(
                                                                                  createDeliveryRecordData(
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    updatedAt: getCurrentTimestamp,
                                                                                    type: 'order',
                                                                                    status: 'REQUESTED',
                                                                                    orderRef: widget.orderRef,
                                                                                    assignedBy: currentUserReference,
                                                                                    deliveryId: _model.idmapResult?.deliveryId.toString(),
                                                                                    deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                      (_model.apiResultShippingCreate?.jsonBody ?? ''),
                                                                                    ),
                                                                                  ),
                                                                                  deliveryRecordReference);
                                                                              _shouldSetState = true;
                                                                              unawaited(
                                                                                () async {
                                                                                  await _model.idmapResult!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'delivery_id': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }(),
                                                                              );

                                                                              await widget.orderRef!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'delivery_info_list': FieldValue.arrayUnion([
                                                                                      getDeliveryInfoFirestoreData(
                                                                                        createDeliveryInfoStruct(
                                                                                          deliveryId: _model.deliveryDoc?.deliveryId,
                                                                                          createdAt: getCurrentTimestamp,
                                                                                          updatedAt: getCurrentTimestamp,
                                                                                          deliveryRef: _model.deliveryDoc?.reference,
                                                                                          deliveryTrackingId: _model.deliveryDoc?.deliveryTrackingId,
                                                                                          fieldValues: {
                                                                                            'product_ids': _model.productIds,
                                                                                          },
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        true,
                                                                                      )
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'Shipping Order created!!',
                                                                                      arText: 'تم إنشاء أمر الشحن!!',
                                                                                    ),
                                                                                    style: GoogleFonts.inter(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );

                                                                              context.goNamed(
                                                                                OrderDetailsWidget.routeName,
                                                                                queryParameters: {
                                                                                  'orderRef': serializeParam(
                                                                                    widget.orderRef,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().updateDeliveryflowStruct(
                                                                                (e) => e
                                                                                  ..selectedItemss = []
                                                                                  ..totalWeightCm = null,
                                                                              );
                                                                              FFAppState().itemsList = [];
                                                                            } else {
                                                                              await _model.idmapResult!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'delivery_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              FFAppState().itemsList = [];
                                                                              _model.productIds = [];
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Failed to create shipping order retry',
                                                                                        arText: 'فشل في إنشاء طلب الشحن، أعد المحاولة',
                                                                                      )),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text(FFLocalizations.of(context).getVariableText(
                                                                                            enText: 'Ok',
                                                                                            arText: 'نعم',
                                                                                          )),
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

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'd54zf9ld' /* Create shipping order */,
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
                                                                            color:
                                                                                FFAppState().theme.themeMain.primaryButtoncolor,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                              color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (widget
                                                                          .type !=
                                                                      'shipcustomer')
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (_model.formKey.currentState == null ||
                                                                                !_model.formKey.currentState!.validate()) {
                                                                              return;
                                                                            }
                                                                            FFAppState().updateItemStruct(
                                                                              (e) => e
                                                                                ..quantity = FFAppState().deliveryflow.selectedItemss.firstOrNull?.quantity
                                                                                ..name = FFAppState().deliveryflow.selectedItemss.firstOrNull?.productInfo.name
                                                                                ..sku = FFAppState().deliveryflow.selectedItemss.firstOrNull?.productInfo.name
                                                                                ..skuNumber = FFAppState().deliveryflow.selectedItemss.firstOrNull?.productId
                                                                                ..weight = double.tryParse(_model.totalWeightTextController.text)
                                                                                ..weightUnit = 'gm',
                                                                            );
                                                                            _model.idmapResultpickup =
                                                                                await queryIdMapRecordOnce(
                                                                              queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                'type',
                                                                                isEqualTo: 'Main',
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((containerSettingsRecord?.settingsLogisticsInfo.environment != 'test') &&
                                                                                (getCurrentTimestamp >= containerSettingsRecord!.settingsLogisticsInfo.prodKeyValidTime!)) {
                                                                              _model.getAccessKeyPickup = await PrimeExpressDeliveryGroup.getAccessTokenCall.call(
                                                                                env: 'prod',
                                                                                clientId: '2527e1a8-5d3d-44f9-9563-8d96e0622c96',
                                                                                clientSecret: '1858d5fced8e6522c5f192e9e8456b13fed3e86dfd2c2f57a4485ac0df54c859',
                                                                                url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                              );

                                                                              _shouldSetState = true;
                                                                              if ((_model.getAccessKeyPickup?.succeeded ?? true)) {
                                                                                await containerSettingsRecord.reference.update(createSettingsRecordData(
                                                                                  settingsLogisticsInfo: createSettingsLogisticsInfoStruct(
                                                                                    prodKey: PrimeExpressDeliveryGroup.getAccessTokenCall.token(
                                                                                      (_model.getAccessKeyPickup?.jsonBody ?? ''),
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
                                                                                FFAppState().item = InvitemListStruct.fromSerializableMap(jsonDecode('{\"quantity\":\"1\",\"name\":\" \",\"weight\":\"1.0\",\"skuNumber\":\" \",\"description\":\" \"}'));
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            }
                                                                            _model.settingsDocPickup =
                                                                                await querySettingsRecordOnce(
                                                                              queryBuilder: (settingsRecord) => settingsRecord.where(
                                                                                'type',
                                                                                isEqualTo: 'Company',
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.apiResultShippingCreatepickup =
                                                                                await PrimeExpressDeliveryGroup.createDeliveryCall.call(
                                                                              env: _model.settingsDocPickup?.settingsLogisticsInfo.environment == 'test' ? 'test' : 'prod',
                                                                              orderID: _model.idmapResultpickup?.deliveryId.toString(),
                                                                              invtrackID: ordersOrdersRecord.orderId,
                                                                              fromName: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingName,
                                                                              fromPhone: columnUsersRecord.designerMainInfo.designerPickupAddress.shippingPhone,
                                                                              fromAddress: columnUsersRecord.designerMainInfo.designerPickupAddress.addressLine1,
                                                                              fromCity: columnUsersRecord.designerMainInfo.designerPickupAddress.city,
                                                                              fromCountry: columnUsersRecord.designerMainInfo.designerPickupAddress.country,
                                                                              fromlatitude: functions.getlatlong(columnUsersRecord.designerMainInfo.designerPickupAddress.latLong!).firstOrNull,
                                                                              fromlongitude: functions.getlatlong(columnUsersRecord.designerMainInfo.designerPickupAddress.latLong!).lastOrNull,
                                                                              toName: containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingName,
                                                                              toPhone: containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.shippingPhone,
                                                                              toAddress: containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.addressLine1,
                                                                              toCity: containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.city,
                                                                              toCountry: containerSettingsRecord?.settingsCompanyInfo.wearhouseAddress.country,
                                                                              tolatitude: functions.getlatlong(containerSettingsRecord!.settingsCompanyInfo.wearhouseAddress.latLong!).firstOrNull,
                                                                              tolongitude: functions.getlatlong(containerSettingsRecord.settingsCompanyInfo.wearhouseAddress.latLong!).lastOrNull,
                                                                              packageCount: valueOrDefault<int>(
                                                                                int.tryParse(_model.packageCountTextController.text),
                                                                                1,
                                                                              ),
                                                                              url: isWeb ? 'https://proxy.vizsoft.in/https://backend.vizsoft.in/' : 'https://backend.vizsoft.in/',
                                                                              amount: 0.00,
                                                                              otpOnDelivery: false,
                                                                              b2bHandling: true,
                                                                              oversized: false,
                                                                              returnStatus: false,
                                                                              itemsListJson: FFAppState().item.toMap(),
                                                                              key: _model.settingsDocPickup?.settingsLogisticsInfo.environment == 'test' ? _model.settingsDocPickup?.settingsLogisticsInfo.testKey : _model.settingsDocPickup?.settingsLogisticsInfo.prodKey,
                                                                              deliveryInstructions: _model.textController1.text,
                                                                              toEmail: containerSettingsRecord.settingsCompanyInfo.wearhouseAddress.shippingEmail,
                                                                              fromCountryCode: 'KW',
                                                                              toCountryCode: 'KW',
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.apiResultShippingCreatepickup?.succeeded ??
                                                                                true)) {
                                                                              var deliveryRecordReference = DeliveryRecord.collection.doc();
                                                                              await deliveryRecordReference.set(createDeliveryRecordData(
                                                                                createdAt: getCurrentTimestamp,
                                                                                updatedAt: getCurrentTimestamp,
                                                                                type: 'orderPickup',
                                                                                status: 'REQUESTED',
                                                                                orderRef: widget.orderRef,
                                                                                assignedBy: currentUserReference,
                                                                                deliveryId: _model.idmapResultpickup?.deliveryId.toString(),
                                                                                deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                  (_model.apiResultShippingCreatepickup?.jsonBody ?? ''),
                                                                                ),
                                                                              ));
                                                                              _model.deliveryDocPickup = DeliveryRecord.getDocumentFromData(
                                                                                  createDeliveryRecordData(
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    updatedAt: getCurrentTimestamp,
                                                                                    type: 'orderPickup',
                                                                                    status: 'REQUESTED',
                                                                                    orderRef: widget.orderRef,
                                                                                    assignedBy: currentUserReference,
                                                                                    deliveryId: _model.idmapResultpickup?.deliveryId.toString(),
                                                                                    deliveryTrackingId: PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
                                                                                      (_model.apiResultShippingCreatepickup?.jsonBody ?? ''),
                                                                                    ),
                                                                                  ),
                                                                                  deliveryRecordReference);
                                                                              _shouldSetState = true;

                                                                              await _model.idmapResultpickup!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'delivery_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              FFAppState().orderCartItems = ordersOrdersRecord.orderItems.cartItems.toList().cast<UserCartItemsStruct>();
                                                                              FFAppState().updateOrderCartItemsAtIndex(
                                                                                widget.cartIndex!,
                                                                                (e) => e
                                                                                  ..updateProductPickupInfo(
                                                                                    (e) => e
                                                                                      ..createdAt = getCurrentTimestamp
                                                                                      ..deliveryId = _model.deliveryDocPickup?.deliveryId
                                                                                      ..deliveryTrackingId = _model.deliveryDocPickup?.deliveryTrackingId
                                                                                      ..status = 'processing',
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});

                                                                              await widget.orderRef!.update(createOrdersRecordData(
                                                                                orderItems: createUserCartStruct(
                                                                                  fieldValues: {
                                                                                    'cart_items': getUserCartItemsListFirestoreData(
                                                                                      FFAppState().orderCartItems,
                                                                                    ),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'Pickup Order created!!',
                                                                                      arText: 'تم إنشاء طلب الاستلام!',
                                                                                    ),
                                                                                    style: GoogleFonts.inter(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 3000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );

                                                                              context.goNamed(
                                                                                OrderDetailsWidget.routeName,
                                                                                queryParameters: {
                                                                                  'orderRef': serializeParam(
                                                                                    widget.orderRef,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().deliveryflow = DeliveryFlowStruct();
                                                                            } else {
                                                                              await _model.idmapResultpickup!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'delivery_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              FFAppState().item = InvitemListStruct.fromSerializableMap(jsonDecode('{\"quantity\":\"1\",\"name\":\" \",\"weight\":\"1.0\",\"skuNumber\":\" \",\"description\":\" \"}'));
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Failed to create shipping order retry',
                                                                                        arText: 'فشل في إنشاء طلب الشحن، أعد المحاولة',
                                                                                      )),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text(FFLocalizations.of(context).getVariableText(
                                                                                            enText: 'Ok',
                                                                                            arText: 'نعم',
                                                                                          )),
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

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'd23t4lr9' /* Create pickup order */,
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
                                                                            color:
                                                                                FFAppState().theme.themeMain.primaryButtoncolor,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                              color: FFAppState().theme.themeMain.primaryButtonBorder!,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
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
