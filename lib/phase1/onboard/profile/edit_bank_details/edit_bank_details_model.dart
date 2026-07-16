import '/flutter_flow/flutter_flow_util.dart';
import 'edit_bank_details_widget.dart' show EditBankDetailsWidget;
import 'package:flutter/material.dart';

class EditBankDetailsModel extends FlutterFlowModel<EditBankDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BankName widget.
  FocusNode? bankNameFocusNode;
  TextEditingController? bankNameTextController;
  String? Function(BuildContext, String?)? bankNameTextControllerValidator;
  String? _bankNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ixrz7xv5' /* Bank name is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'xkv8yy1x' /* Minimum 2 charcters are requir... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        '2jcdurnl' /* Maximum 50 characters are requ... */,
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
        'yry6t2h5' /* Account holder is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'boa66y1s' /* Minimum 2 charcters are requir... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'peo005d8' /* Maximum 50 characters are requ... */,
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
        'd9fv587y' /* Account number is required */,
      );
    }

    return null;
  }

  // State field(s) for IBAN-IFSC-Code widget.
  FocusNode? iBANIFSCCodeFocusNode;
  TextEditingController? iBANIFSCCodeTextController;
  String? Function(BuildContext, String?)? iBANIFSCCodeTextControllerValidator;
  String? _iBANIFSCCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f9g1yjf9' /* IBAN/IFSC code is required */,
      );
    }

    return null;
  }

  // State field(s) for PreferredPayoutMethod widget.
  FocusNode? preferredPayoutMethodFocusNode;
  TextEditingController? preferredPayoutMethodTextController;
  String? Function(BuildContext, String?)?
      preferredPayoutMethodTextControllerValidator;
  String? _preferredPayoutMethodTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h66vsu1q' /* Preferred Payout Method is req... */,
      );
    }

    if (!RegExp(
            '^(Visa|Master ?Card|KNET|Apple ?Pay|Google ?Pay|Samsung ?Pay|Cash|Bank ?Transfer|Credit ?Card|Debit ?Card)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '7uklum0z' /* Invalid payment method format */,
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
    iBANIFSCCodeTextControllerValidator = _iBANIFSCCodeTextControllerValidator;
    preferredPayoutMethodTextControllerValidator =
        _preferredPayoutMethodTextControllerValidator;
  }

  @override
  void dispose() {
    bankNameFocusNode?.dispose();
    bankNameTextController?.dispose();

    accountHolderFocusNode?.dispose();
    accountHolderTextController?.dispose();

    accountNumberFocusNode?.dispose();
    accountNumberTextController?.dispose();

    iBANIFSCCodeFocusNode?.dispose();
    iBANIFSCCodeTextController?.dispose();

    preferredPayoutMethodFocusNode?.dispose();
    preferredPayoutMethodTextController?.dispose();
  }
}
