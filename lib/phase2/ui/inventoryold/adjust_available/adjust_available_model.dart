import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adjust_available_widget.dart' show AdjustAvailableWidget;
import 'package:flutter/material.dart';

class AdjustAvailableModel extends FlutterFlowModel<AdjustAvailableWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for QuantityControl widget.
  FocusNode? quantityControlFocusNode;
  TextEditingController? quantityControlTextController;
  String? Function(BuildContext, String?)?
      quantityControlTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quantityControlFocusNode?.dispose();
    quantityControlTextController?.dispose();
  }
}
