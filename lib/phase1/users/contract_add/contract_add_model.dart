import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'contract_add_widget.dart' show ContractAddWidget;
import 'package:flutter/material.dart';

class ContractAddModel extends FlutterFlowModel<ContractAddWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for productDropdown widget.
  String? productDropdownValue;
  FormFieldController<String>? productDropdownValueController;
  // State field(s) for method widget.
  FocusNode? methodFocusNode1;
  TextEditingController? methodTextController1;
  String? Function(BuildContext, String?)? methodTextController1Validator;
  DateTime? datePicked1;
  // State field(s) for method widget.
  FocusNode? methodFocusNode2;
  TextEditingController? methodTextController2;
  String? Function(BuildContext, String?)? methodTextController2Validator;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    methodFocusNode1?.dispose();
    methodTextController1?.dispose();

    methodFocusNode2?.dispose();
    methodTextController2?.dispose();
  }
}
