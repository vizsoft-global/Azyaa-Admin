import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tryon_add_copy_widget.dart' show TryonAddCopyWidget;
import 'package:flutter/material.dart';

class TryonAddCopyModel extends FlutterFlowModel<TryonAddCopyWidget> {
  ///  Local state fields for this component.

  String permissionKeyEdit = 'product_edit';

  String permissionKeyDelete = 'product_delete';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for producttitle widget.
  FocusNode? producttitleFocusNode;
  TextEditingController? producttitleTextController;
  String? Function(BuildContext, String?)? producttitleTextControllerValidator;
  String? _producttitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xe586p6g' /* name is required */,
      );
    }

    return null;
  }

  // State field(s) for producSKU widget.
  FocusNode? producSKUFocusNode;
  TextEditingController? producSKUTextController;
  String? Function(BuildContext, String?)? producSKUTextControllerValidator;
  String? _producSKUTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7ye7y8hk' /* product_sku is required */,
      );
    }

    return null;
  }

  // State field(s) for producPrice widget.
  FocusNode? producPriceFocusNode;
  TextEditingController? producPriceTextController;
  String? Function(BuildContext, String?)? producPriceTextControllerValidator;
  String? _producPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't08yov3u' /* product_price is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for producStock widget.
  FocusNode? producStockFocusNode;
  TextEditingController? producStockTextController;
  String? Function(BuildContext, String?)? producStockTextControllerValidator;
  String? _producStockTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't2czpai1' /* product_quantity is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    producttitleTextControllerValidator = _producttitleTextControllerValidator;
    producSKUTextControllerValidator = _producSKUTextControllerValidator;
    producPriceTextControllerValidator = _producPriceTextControllerValidator;
    producStockTextControllerValidator = _producStockTextControllerValidator;
  }

  @override
  void dispose() {
    producttitleFocusNode?.dispose();
    producttitleTextController?.dispose();

    producSKUFocusNode?.dispose();
    producSKUTextController?.dispose();

    producPriceFocusNode?.dispose();
    producPriceTextController?.dispose();

    producStockFocusNode?.dispose();
    producStockTextController?.dispose();
  }
}
