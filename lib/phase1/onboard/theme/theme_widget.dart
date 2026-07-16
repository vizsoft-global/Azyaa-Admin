import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';
export 'theme_model.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({
    super.key,
    required this.status,
    this.themeId,
    this.themeDoc,
  });

  final String? status;
  final int? themeId;
  final ThemeRecord? themeDoc;

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  late ThemeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThemeModel());

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

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ht4id3x6' /* Theme */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FFAppState().theme.themeMain.primary,
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
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).border,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 16.0,
                              runSpacing: 16.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked1Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked1 ??
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked1Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked1 =
                                                    _colorPicked1Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..primary =
                                                      _model.colorPicked1,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'vr6tuqqy' /* Primary Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 100.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .primary,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked2Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked2 ??
                                                Color(0xFFFAFAFA),
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked2Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked2 =
                                                    _colorPicked2Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..secondary =
                                                      _model.colorPicked2,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'k0bwaor5' /* Secondary Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 80.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .secondary,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked3Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked3 ??
                                                Color(0xFF303030),
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked3Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked3 =
                                                    _colorPicked3Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..primaryText =
                                                      _model.colorPicked3,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'v9qlmwy5' /* Primary Text  Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 65.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .primaryText,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked4Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked4 ??
                                                Color(0xFF8F8F8F),
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked4Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked4 =
                                                    _colorPicked4Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..secondaryText =
                                                      _model.colorPicked4,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9f9m7djx' /* Secondary Text Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 50.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .secondaryText,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked5Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked5 ??
                                                Color(0xFFF1F4F8),
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked5Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked5 =
                                                    _colorPicked5Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..primaryBackground =
                                                      _model.colorPicked5,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '03rzy6tf' /* Primary Background Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 18.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .primaryBackground,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked6Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked6 ??
                                                Colors.white,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked6Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked6 =
                                                    _colorPicked6Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..secondaryBackground =
                                                      _model.colorPicked6,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '0ncjdisn' /* Secondary Background Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .secondaryBackground,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked7Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked7 ??
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked7Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked7 =
                                                    _colorPicked7Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..primaryButtoncolor =
                                                      _model.colorPicked7,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'c1l87teu' /* Primary Button Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 50.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .primaryButtoncolor,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked8Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked8 ??
                                                Colors.white,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked8Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked8 =
                                                    _colorPicked8Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..secondaryButtonColor =
                                                      _model.colorPicked8,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'iztjnh0f' /* Secondary Button Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 33.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .secondaryButtonColor,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked9Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor: _model.colorPicked9 ??
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked9Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked9 =
                                                    _colorPicked9Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..primaryButtonTextColor =
                                                      _model.colorPicked9,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '1vwmif12' /* Primary Button Text Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 18.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .primaryButtonTextColor,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked10Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor:
                                                _model.colorPicked10 ??
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked10Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked10 =
                                                    _colorPicked10Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..secondaryButtonTextColor =
                                                      _model.colorPicked10,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'rspdv370' /* Secondary Button Text Color */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .secondaryButtonTextColor,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked11Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor:
                                                _model.colorPicked11 ??
                                                    Colors.black,
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked11Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked11 =
                                                    _colorPicked11Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..primaryButtonBorder =
                                                      _model.colorPicked11,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'oj1tgdi1' /* Primary Button Border  */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 36.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .primaryButtonBorder,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final _colorPicked12Color =
                                              await showFFColorPicker(
                                            context,
                                            currentColor:
                                                _model.colorPicked12 ??
                                                    Color(0xFFE3E3E3),
                                            showRecentColors: true,
                                            allowOpacity: true,
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            secondaryTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            primaryButtonBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            primaryButtonTextColor:
                                                Colors.white,
                                            primaryButtonBorderColor:
                                                Colors.transparent,
                                            displayAsBottomSheet:
                                                isMobileWidth(context),
                                          );

                                          if (_colorPicked12Color != null) {
                                            safeSetState(() =>
                                                _model.colorPicked12 =
                                                    _colorPicked12Color);
                                          }

                                          FFAppState().updateAdminFlowStruct(
                                            (e) => e
                                              ..updateAdminThemeAe(
                                                (e) => e
                                                  ..secondaryButtonBorder =
                                                      _model.colorPicked12,
                                              ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9r9fhoup' /* Secondary Button Border  */,
                                        ),
                                        icon: Icon(
                                          Icons.circle,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 15.0, 0.0),
                                          iconPadding: EdgeInsets.all(0.0),
                                          iconColor: FFAppState()
                                              .adminFlow
                                              .adminThemeAe
                                              .secondaryButtonBorder,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
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
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
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
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final _colorPicked13Color =
                                                await showFFColorPicker(
                                              context,
                                              currentColor: _model
                                                      .colorPicked13 ??
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              showRecentColors: true,
                                              allowOpacity: true,
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              secondaryTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              primaryButtonBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              primaryButtonTextColor:
                                                  Colors.white,
                                              primaryButtonBorderColor:
                                                  Colors.transparent,
                                              displayAsBottomSheet:
                                                  isMobileWidth(context),
                                            );

                                            if (_colorPicked13Color != null) {
                                              safeSetState(() =>
                                                  _model.colorPicked13 =
                                                      _colorPicked13Color);
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'x4a14snz' /* Tertiary */,
                                          ),
                                          icon: Icon(
                                            Icons.circle,
                                            size: 32.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 155.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                _model.colorPicked13 != null
                                                    ? _model.colorPicked13
                                                    : Color(0x00000000),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final _colorPicked14Color =
                                                await showFFColorPicker(
                                              context,
                                              currentColor: _model
                                                      .colorPicked14 ??
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              showRecentColors: true,
                                              allowOpacity: true,
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              secondaryTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              primaryButtonBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              primaryButtonTextColor:
                                                  Colors.white,
                                              primaryButtonBorderColor:
                                                  Colors.transparent,
                                              displayAsBottomSheet:
                                                  isMobileWidth(context),
                                            );

                                            if (_colorPicked14Color != null) {
                                              safeSetState(() =>
                                                  _model.colorPicked14 =
                                                      _colorPicked14Color);
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'dx077td0' /* Alternate */,
                                          ),
                                          icon: Icon(
                                            Icons.circle,
                                            size: 32.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 150.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                _model.colorPicked14 != null
                                                    ? _model.colorPicked14
                                                    : Color(0x00000000),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).border,
                                    ),
                                  ),
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
                                          switchListTileSettingsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final switchListTileSettingsRecord =
                                          switchListTileSettingsRecordList
                                                  .isNotEmpty
                                              ? switchListTileSettingsRecordList
                                                  .first
                                              : null;

                                      return Material(
                                        color: Colors.transparent,
                                        child: SwitchListTile.adaptive(
                                          value: _model
                                              .switchListTileValue ??= widget
                                                      .status ==
                                                  'new'
                                              ? true
                                              : (widget.themeDoc?.themeId ==
                                                      switchListTileSettingsRecord
                                                          ?.mainThemeId
                                                  ? true
                                                  : false),
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.switchListTileValue =
                                                    newValue);
                                          },
                                          title: Text(
                                            FFLocalizations.of(context).getText(
                                              '11kimds0' /* Set as default */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
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
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          activeColor: FFAppState()
                                              .theme
                                              .themeMain
                                              .secondaryBackground,
                                          activeTrackColor:
                                              valueOrDefault<Color>(
                                            FFAppState()
                                                .theme
                                                .themeMain
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      '0iyyr47l' /* Cancel */,
                    ),
                    options: FFButtonOptions(
                      height: 30.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: valueOrDefault<Color>(
                        FFAppState().theme.themeMain.secondaryButtonColor,
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                        color:
                            FFAppState().theme.themeMain.secondaryButtonBorder!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget.status == 'new') {
                        _model.idMapResult1 = await queryIdMapRecordOnce(
                          queryBuilder: (idMapRecord) => idMapRecord.where(
                            'type',
                            isEqualTo: 'Main',
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);

                        var themeRecordReference = ThemeRecord.collection.doc();
                        await themeRecordReference.set(createThemeRecordData(
                          themeStatus: 'active',
                          themeCreatedAt: getCurrentTimestamp,
                          themeId: _model.idMapResult1?.themeId,
                          themeInfo: updateThemeColourStruct(
                            FFAppState().adminFlow.adminThemeAe,
                            clearUnsetFields: false,
                            create: true,
                          ),
                        ));
                        _model.themeNewResult1 =
                            ThemeRecord.getDocumentFromData(
                                createThemeRecordData(
                                  themeStatus: 'active',
                                  themeCreatedAt: getCurrentTimestamp,
                                  themeId: _model.idMapResult1?.themeId,
                                  themeInfo: updateThemeColourStruct(
                                    FFAppState().adminFlow.adminThemeAe,
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                ),
                                themeRecordReference);

                        await _model.idMapResult1!.reference.update({
                          ...mapToFirestore(
                            {
                              'theme_id': FieldValue.increment(1),
                            },
                          ),
                        });
                        if (_model.switchListTileValue == true) {
                          _model.settingsResult1 =
                              await querySettingsRecordOnce(
                            queryBuilder: (settingsRecord) =>
                                settingsRecord.where(
                              'type',
                              isEqualTo: 'Company',
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);

                          await _model.settingsResult1!.reference
                              .update(createSettingsRecordData(
                            mainThemeId: _model.themeNewResult1?.themeId,
                            mainTheme: updateThemeColourStruct(
                              _model.themeNewResult1?.themeInfo,
                              clearUnsetFields: false,
                            ),
                          ));
                        }
                        Navigator.pop(context);
                      } else {
                        if (widget.status == 'update') {
                          await widget.themeDoc!.reference
                              .update(createThemeRecordData(
                            themeInfo: updateThemeColourStruct(
                              FFAppState().adminFlow.adminThemeAe,
                              clearUnsetFields: false,
                            ),
                          ));
                          if (_model.switchListTileValue == true) {
                            _model.settingsResultUpdate2 =
                                await querySettingsRecordOnce(
                              queryBuilder: (settingsRecord) =>
                                  settingsRecord.where(
                                'type',
                                isEqualTo: 'Company',
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await _model.settingsResultUpdate2!.reference
                                .update(createSettingsRecordData(
                              mainTheme: updateThemeColourStruct(
                                FFAppState().adminFlow.adminThemeAe,
                                clearUnsetFields: false,
                              ),
                              mainThemeId: widget.themeId,
                            ));
                          }
                          Navigator.pop(context);
                        }
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '1fktqxy6' /* Save */,
                    ),
                    options: FFButtonOptions(
                      height: 30.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FFAppState().theme.themeMain.primaryButtoncolor,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: valueOrDefault<Color>(
                                  FFAppState()
                                      .theme
                                      .themeMain
                                      .primaryButtonTextColor,
                                  FlutterFlowTheme.of(context).secondary,
                                ),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color:
                            FFAppState().theme.themeMain.primaryButtonBorder!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
