import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_thresholdinput_model.dart';
export 'alert_thresholdinput_model.dart';

class AlertThresholdinputWidget extends StatefulWidget {
  const AlertThresholdinputWidget({
    super.key,
    required this.total,
  });

  final int? total;

  @override
  State<AlertThresholdinputWidget> createState() =>
      _AlertThresholdinputWidgetState();
}

class _AlertThresholdinputWidgetState extends State<AlertThresholdinputWidget> {
  late AlertThresholdinputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertThresholdinputModel());

    _model.stockTextController ??=
        TextEditingController(text: FFAppState().totalstockinHand.toString());
    _model.stockFocusNode ??= FocusNode();

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

    return Container(
      width: 50.0,
      child: TextFormField(
        controller: _model.stockTextController,
        focusNode: _model.stockFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.stockTextController',
          Duration(milliseconds: 2000),
          () async {
            FFAppState().updateAdminFlowStruct(
              (e) => e
                ..stockOnHand = int.tryParse(_model.stockTextController.text),
            );
          },
        ),
        autofocus: false,
        textInputAction: TextInputAction.next,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
          hintText: FFLocalizations.of(context).getText(
            '5h5v4b4a' /* 5 */,
          ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
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
              color: FlutterFlowTheme.of(context).primary,
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
          contentPadding: EdgeInsets.all(12.0),
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
        maxLength: 15,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
        keyboardType: TextInputType.number,
        cursorColor: FFAppState().theme.themeMain.primary,
        validator: _model.stockTextControllerValidator.asValidator(context),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(
              '^(?!0+(\\.0+)?\$)(?:[1-9]\\d*(?:\\.\\d+)?|0?\\.\\d*[1-9]\\d*)\$'))
        ],
      ),
    );
  }
}
