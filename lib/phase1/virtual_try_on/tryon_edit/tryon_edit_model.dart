import '/flutter_flow/flutter_flow_util.dart';
import 'tryon_edit_widget.dart' show TryonEditWidget;
import 'package:flutter/material.dart';

class TryonEditModel extends FlutterFlowModel<TryonEditWidget> {
  ///  Local state fields for this component.

  String permissionKeyEdit = 'product_edit';

  String permissionKeyDelete = 'product_delete';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uvnsk5u2' /* name is required */,
      );
    }

    return null;
  }

  // State field(s) for crdeits widget.
  FocusNode? crdeitsFocusNode;
  TextEditingController? crdeitsTextController;
  String? Function(BuildContext, String?)? crdeitsTextControllerValidator;
  String? _crdeitsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'keoctu0g' /* credits is required */,
      );
    }

    return null;
  }

  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wekisb47' /* price is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    crdeitsTextControllerValidator = _crdeitsTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    crdeitsFocusNode?.dispose();
    crdeitsTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();
  }
}
