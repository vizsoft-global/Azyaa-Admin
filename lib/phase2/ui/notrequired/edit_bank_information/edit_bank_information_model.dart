import '/flutter_flow/flutter_flow_util.dart';
import 'edit_bank_information_widget.dart' show EditBankInformationWidget;
import 'package:flutter/material.dart';

class EditBankInformationModel
    extends FlutterFlowModel<EditBankInformationWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BankName widget.
  FocusNode? bankNameFocusNode;
  TextEditingController? bankNameTextController;
  String? Function(BuildContext, String?)? bankNameTextControllerValidator;
  String? _bankNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rsyzcxjh' /* Bank name is required */,
      );
    }

    return null;
  }

  // State field(s) for AccountHolder widget.
  FocusNode? accountHolderFocusNode;
  TextEditingController? accountHolderTextController;
  String? Function(BuildContext, String?)? accountHolderTextControllerValidator;
  String? _accountHolderTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8egslq1y' /* Account holder field is requir... */,
      );
    }

    return null;
  }

  // State field(s) for AccountNumber widget.
  FocusNode? accountNumberFocusNode;
  TextEditingController? accountNumberTextController;
  String? Function(BuildContext, String?)? accountNumberTextControllerValidator;
  String? _accountNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vkqr6j2o' /* Account number is required */,
      );
    }

    return null;
  }

  // State field(s) for ifsc widget.
  FocusNode? ifscFocusNode;
  TextEditingController? ifscTextController;
  String? Function(BuildContext, String?)? ifscTextControllerValidator;
  String? _ifscTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gitxbtyn' /* IFSC code is required */,
      );
    }

    return null;
  }

  // State field(s) for method widget.
  FocusNode? methodFocusNode;
  TextEditingController? methodTextController;
  String? Function(BuildContext, String?)? methodTextControllerValidator;
  String? _methodTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'szprqbz9' /* Payent method is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    bankNameTextControllerValidator = _bankNameTextControllerValidator;
    accountHolderTextControllerValidator =
        _accountHolderTextControllerValidator;
    accountNumberTextControllerValidator =
        _accountNumberTextControllerValidator;
    ifscTextControllerValidator = _ifscTextControllerValidator;
    methodTextControllerValidator = _methodTextControllerValidator;
  }

  @override
  void dispose() {
    bankNameFocusNode?.dispose();
    bankNameTextController?.dispose();

    accountHolderFocusNode?.dispose();
    accountHolderTextController?.dispose();

    accountNumberFocusNode?.dispose();
    accountNumberTextController?.dispose();

    ifscFocusNode?.dispose();
    ifscTextController?.dispose();

    methodFocusNode?.dispose();
    methodTextController?.dispose();
  }
}
