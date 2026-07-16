import '/flutter_flow/flutter_flow_util.dart';
import 'stockinput_widget.dart' show StockinputWidget;
import 'package:flutter/material.dart';

class StockinputModel extends FlutterFlowModel<StockinputWidget> {
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
