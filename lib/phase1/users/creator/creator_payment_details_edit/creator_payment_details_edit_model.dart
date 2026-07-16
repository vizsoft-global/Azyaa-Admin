import '/flutter_flow/flutter_flow_util.dart';
import 'creator_payment_details_edit_widget.dart'
    show CreatorPaymentDetailsEditWidget;
import 'package:flutter/material.dart';

class CreatorPaymentDetailsEditModel
    extends FlutterFlowModel<CreatorPaymentDetailsEditWidget> {
  ///  Local state fields for this component.

  String permissionKeyEdit = 'product_edit';

  String permissionKeyDelete = 'product_delete';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BankName widget.
  FocusNode? bankNameFocusNode;
  TextEditingController? bankNameTextController;
  String? Function(BuildContext, String?)? bankNameTextControllerValidator;
  String? _bankNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4ljnne3a' /* name is required */,
      );
    }

    return null;
  }

  // State field(s) for AccountNo widget.
  FocusNode? accountNoFocusNode;
  TextEditingController? accountNoTextController;
  String? Function(BuildContext, String?)? accountNoTextControllerValidator;
  String? _accountNoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jstjn6o8' /* product_sku is required */,
      );
    }

    return null;
  }

  // State field(s) for AccountHolderName widget.
  FocusNode? accountHolderNameFocusNode;
  TextEditingController? accountHolderNameTextController;
  String? Function(BuildContext, String?)?
      accountHolderNameTextControllerValidator;
  String? _accountHolderNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'upeeet8q' /* product_price is required */,
      );
    }

    return null;
  }

  // State field(s) for IBANCode widget.
  FocusNode? iBANCodeFocusNode;
  TextEditingController? iBANCodeTextController;
  String? Function(BuildContext, String?)? iBANCodeTextControllerValidator;
  String? _iBANCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mehu5eyw' /* product quantity is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    bankNameTextControllerValidator = _bankNameTextControllerValidator;
    accountNoTextControllerValidator = _accountNoTextControllerValidator;
    accountHolderNameTextControllerValidator =
        _accountHolderNameTextControllerValidator;
    iBANCodeTextControllerValidator = _iBANCodeTextControllerValidator;
  }

  @override
  void dispose() {
    bankNameFocusNode?.dispose();
    bankNameTextController?.dispose();

    accountNoFocusNode?.dispose();
    accountNoTextController?.dispose();

    accountHolderNameFocusNode?.dispose();
    accountHolderNameTextController?.dispose();

    iBANCodeFocusNode?.dispose();
    iBANCodeTextController?.dispose();
  }
}
