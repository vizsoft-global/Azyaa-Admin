import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'unavailable_inventory_widget.dart' show UnavailableInventoryWidget;
import 'package:flutter/material.dart';

class UnavailableInventoryModel
    extends FlutterFlowModel<UnavailableInventoryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Damaged widget.
  FocusNode? damagedFocusNode;
  TextEditingController? damagedTextController;
  String? Function(BuildContext, String?)? damagedTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    damagedFocusNode?.dispose();
    damagedTextController?.dispose();
  }
}
