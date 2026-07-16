import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tryon_add_widget.dart' show TryonAddWidget;
import 'package:flutter/material.dart';

class TryonAddModel extends FlutterFlowModel<TryonAddWidget> {
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
        'rwre8lt5' /* name is required */,
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
        '5oz8ino0' /* credits is required */,
      );
    }

    if (!RegExp('^(?!0\$)([1-9][0-9]*)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'opz7e06l' /* Credit  must be greater than z... */,
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
        'gtteb8ck' /* price is required */,
      );
    }

    if (!RegExp('^(?!0\$)([1-9][0-9]*)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'pi87sbgk' /* Price  must be greater than ze... */,
      );
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapResult;

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
