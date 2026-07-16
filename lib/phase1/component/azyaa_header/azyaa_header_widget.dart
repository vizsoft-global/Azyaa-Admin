import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'azyaa_header_model.dart';
export 'azyaa_header_model.dart';

class AzyaaHeaderWidget extends StatefulWidget {
  const AzyaaHeaderWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<AzyaaHeaderWidget> createState() => _AzyaaHeaderWidgetState();
}

class _AzyaaHeaderWidgetState extends State<AzyaaHeaderWidget> {
  late AzyaaHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AzyaaHeaderModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.title!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.themeMain.primary,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).border,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
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
                Container(
                  width: 130.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        getCORSProxyUrl(
                          _model.dropDownValue == 'English'
                              ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/rt3n2xp1mfnx/uk-flag.png'
                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/pu804qvgkkko/kuwait-flag.png',
                        ),
                        width: 30.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                        alignment: Alignment(0.0, -1.0),
                      ),
                      Expanded(
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??=
                                FFLocalizations.of(context).getText(
                              'rlqzgdpi' /* English */,
                            ),
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              '8o2ldhcx' /* English */,
                            ),
                            FFLocalizations.of(context).getText(
                              'zrdp6qdn' /* Arabic */,
                            )
                          ],
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue = val),
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'rfmmg658' /* English */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
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
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).border,
                  borderRadius: 100.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).border,
                  borderRadius: 100.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.notifications_none,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().appLanguage = '';
                      setAppLanguage(context, 'en');
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/uk.png',
                                width: 25.0,
                                height: 25.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setAppLanguage(context, 'en');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gpcg2bxl' /* EN */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
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
                      setAppLanguage(context, 'ar');
                      FFAppState().appLanguage = 'ar';
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/kuwait.png',
                                width: 25.0,
                                height: 25.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setAppLanguage(context, 'ar');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '3jp4ixw4' /* AR */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 0.0)),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(EditProfileWidget.routeName);
                },
                child: Container(
                  width: 180.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FFAppState().theme.themeMain.primary,
                            borderRadius: BorderRadius.circular(100.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: valueOrDefault<Color>(
                                FFAppState().theme.themeMain.primary,
                                FlutterFlowTheme.of(context).border,
                              ),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: FFAppState().theme.themeMain.primary,
                                borderRadius: BorderRadius.circular(100.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.network(
                                      getCORSProxyUrl(
                                        () {
                                          if (currentUserDocument
                                                      ?.designerMainInfo
                                                      .designerInfo
                                                      .brandPhoto !=
                                                  null &&
                                              currentUserDocument
                                                      ?.designerMainInfo
                                                      .designerInfo
                                                      .brandPhoto !=
                                                  '') {
                                            return currentUserDocument!
                                                .designerMainInfo
                                                .designerInfo
                                                .brandPhoto;
                                          } else if (currentUserPhoto != '') {
                                            return currentUserPhoto;
                                          } else if (currentUserDocument
                                                      ?.designerMainInfo
                                                      .designerInfo
                                                      .brandPhoto !=
                                                  null &&
                                              currentUserDocument
                                                      ?.designerMainInfo
                                                      .designerInfo
                                                      .brandPhoto !=
                                                  '') {
                                            return currentUserDocument!
                                                .designerMainInfo
                                                .designerInfo
                                                .brandPhoto;
                                          } else if (currentUserPhoto != '') {
                                            return currentUserPhoto;
                                          } else {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/5oz3c3kkk8cw/azyaa-white-logo.png';
                                          }
                                        }(),
                                      ),
                                      fit: BoxFit.contain,
                                      alignment: Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => SelectionArea(
                                    child: Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
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
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                )),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => SelectionArea(
                                    child: Text(
                                  valueOrDefault(
                                      currentUserDocument?.userRole, ''),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE1E1E1),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).border,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.notificatioAlertModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: NotificatioAlertWidget(),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
