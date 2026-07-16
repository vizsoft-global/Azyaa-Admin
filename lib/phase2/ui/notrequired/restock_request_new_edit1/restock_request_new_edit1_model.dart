import '/flutter_flow/flutter_flow_util.dart';
import 'restock_request_new_edit1_widget.dart'
    show RestockRequestNewEdit1Widget;
import 'package:flutter/material.dart';

class RestockRequestNewEdit1Model
    extends FlutterFlowModel<RestockRequestNewEdit1Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for method widget.
  FocusNode? methodFocusNode1;
  TextEditingController? methodTextController1;
  String? Function(BuildContext, String?)? methodTextController1Validator;
  // State field(s) for method widget.
  FocusNode? methodFocusNode2;
  TextEditingController? methodTextController2;
  String? Function(BuildContext, String?)? methodTextController2Validator;
  // State field(s) for method widget.
  FocusNode? methodFocusNode3;
  TextEditingController? methodTextController3;
  String? Function(BuildContext, String?)? methodTextController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    methodFocusNode1?.dispose();
    methodTextController1?.dispose();

    methodFocusNode2?.dispose();
    methodTextController2?.dispose();

    methodFocusNode3?.dispose();
    methodTextController3?.dispose();
  }
}
