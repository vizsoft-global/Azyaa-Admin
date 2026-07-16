import '/flutter_flow/flutter_flow_util.dart';
import 'product_quick_edit_widget.dart' show ProductQuickEditWidget;
import 'package:flutter/material.dart';

class ProductQuickEditModel extends FlutterFlowModel<ProductQuickEditWidget> {
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
        'mzfp6773' /* product name is required */,
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
        'hp9p3ly7' /* product sku is required */,
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
        '06ohscj1' /* product price is required */,
      );
    }

    return null;
  }

  // State field(s) for producRegPrice widget.
  FocusNode? producRegPriceFocusNode;
  TextEditingController? producRegPriceTextController;
  String? Function(BuildContext, String?)?
      producRegPriceTextControllerValidator;
  // State field(s) for producStock widget.
  FocusNode? producStockFocusNode;
  TextEditingController? producStockTextController;
  String? Function(BuildContext, String?)? producStockTextControllerValidator;

  @override
  void initState(BuildContext context) {
    producttitleTextControllerValidator = _producttitleTextControllerValidator;
    producSKUTextControllerValidator = _producSKUTextControllerValidator;
    producPriceTextControllerValidator = _producPriceTextControllerValidator;
  }

  @override
  void dispose() {
    producttitleFocusNode?.dispose();
    producttitleTextController?.dispose();

    producSKUFocusNode?.dispose();
    producSKUTextController?.dispose();

    producPriceFocusNode?.dispose();
    producPriceTextController?.dispose();

    producRegPriceFocusNode?.dispose();
    producRegPriceTextController?.dispose();

    producStockFocusNode?.dispose();
    producStockTextController?.dispose();
  }
}
