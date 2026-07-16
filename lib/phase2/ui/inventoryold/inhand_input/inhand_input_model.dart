import '/flutter_flow/flutter_flow_util.dart';
import 'inhand_input_widget.dart' show InhandInputWidget;
import 'package:flutter/material.dart';

class InhandInputModel extends FlutterFlowModel<InhandInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for stock widget.
  FocusNode? stockFocusNode;
  TextEditingController? stockTextController;
  String? Function(BuildContext, String?)? stockTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    stockFocusNode?.dispose();
    stockTextController?.dispose();
  }
}
