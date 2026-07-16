import '/flutter_flow/flutter_flow_util.dart';
import 'azyaa_forgot_widget.dart' show AzyaaForgotWidget;
import 'package:flutter/material.dart';

class AzyaaForgotModel extends FlutterFlowModel<AzyaaForgotWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? userCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
