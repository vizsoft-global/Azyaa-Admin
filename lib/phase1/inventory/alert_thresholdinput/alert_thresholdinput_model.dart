import '/flutter_flow/flutter_flow_util.dart';
import 'alert_thresholdinput_widget.dart' show AlertThresholdinputWidget;
import 'package:flutter/material.dart';

class AlertThresholdinputModel
    extends FlutterFlowModel<AlertThresholdinputWidget> {
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
