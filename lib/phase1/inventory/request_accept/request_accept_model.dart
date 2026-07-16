import '/flutter_flow/flutter_flow_util.dart';
import 'request_accept_widget.dart' show RequestAcceptWidget;
import 'package:flutter/material.dart';

class RequestAcceptModel extends FlutterFlowModel<RequestAcceptWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for method widget.
  FocusNode? methodFocusNode1;
  TextEditingController? methodTextController1;
  String? Function(BuildContext, String?)? methodTextController1Validator;
  DateTime? datePicked;
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
