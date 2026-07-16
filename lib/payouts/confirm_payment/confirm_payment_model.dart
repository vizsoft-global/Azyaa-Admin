import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'confirm_payment_widget.dart' show ConfirmPaymentWidget;
import 'package:flutter/material.dart';

class ConfirmPaymentModel extends FlutterFlowModel<ConfirmPaymentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaymentMethod widget.
  String? paymentMethodValue;
  FormFieldController<String>? paymentMethodValueController;
  // State field(s) for ReferenceID widget.
  FocusNode? referenceIDFocusNode;
  TextEditingController? referenceIDTextController;
  String? Function(BuildContext, String?)? referenceIDTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    referenceIDFocusNode?.dispose();
    referenceIDTextController?.dispose();
  }
}
