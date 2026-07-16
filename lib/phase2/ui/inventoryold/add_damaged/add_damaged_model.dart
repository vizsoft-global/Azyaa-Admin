import '/flutter_flow/flutter_flow_util.dart';
import 'add_damaged_widget.dart' show AddDamagedWidget;
import 'package:flutter/material.dart';

class AddDamagedModel extends FlutterFlowModel<AddDamagedWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quantityFocusNode?.dispose();
    quantityTextController?.dispose();
  }
}
