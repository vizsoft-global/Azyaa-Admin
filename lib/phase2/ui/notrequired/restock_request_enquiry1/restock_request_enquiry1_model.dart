import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'restock_request_enquiry1_widget.dart' show RestockRequestEnquiry1Widget;
import 'package:flutter/material.dart';

class RestockRequestEnquiry1Model
    extends FlutterFlowModel<RestockRequestEnquiry1Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PlatformRate widget.
  String? platformRateValue;
  FormFieldController<String>? platformRateValueController;
  // State field(s) for method widget.
  FocusNode? methodFocusNode1;
  TextEditingController? methodTextController1;
  String? Function(BuildContext, String?)? methodTextController1Validator;
  // State field(s) for method widget.
  FocusNode? methodFocusNode2;
  TextEditingController? methodTextController2;
  String? Function(BuildContext, String?)? methodTextController2Validator;

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
