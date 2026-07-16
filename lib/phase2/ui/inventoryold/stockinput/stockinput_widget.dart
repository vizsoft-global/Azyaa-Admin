import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stockinput_model.dart';
export 'stockinput_model.dart';

class StockinputWidget extends StatefulWidget {
  const StockinputWidget({
    super.key,
    this.productRef,
    this.quantity,
  });

  final DocumentReference? productRef;
  final int? quantity;

  @override
  State<StockinputWidget> createState() => _StockinputWidgetState();
}

class _StockinputWidgetState extends State<StockinputWidget> {
  late StockinputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockinputModel());

    _model.stockTextController ??=
        TextEditingController(text: widget.quantity?.toString());
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
    return TextFormField(
      controller: _model.stockTextController,
      focusNode: _model.stockFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.stockTextController',
        Duration(milliseconds: 2000),
        () async {
          await widget.productRef!.update(createProductsRecordData(
            product: createProductStockStruct(
              productQuantity: int.tryParse(_model.stockTextController.text),
              clearUnsetFields: false,
            ),
          ));
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
          't1o183ym' /* Input here */,
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
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      keyboardType: TextInputType.number,
      validator: _model.stockTextControllerValidator.asValidator(context),
    );
  }
}
