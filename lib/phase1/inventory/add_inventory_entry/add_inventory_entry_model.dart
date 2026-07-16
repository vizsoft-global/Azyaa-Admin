import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'add_inventory_entry_widget.dart' show AddInventoryEntryWidget;
import 'package:flutter/material.dart';

class AddInventoryEntryModel extends FlutterFlowModel<AddInventoryEntryWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'product_add';

  DocumentReference? productRef;

  String? productId;

  String? designerUID;

  int? productSKU;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for SelectProduct widget.
  String? selectProductValue;
  FormFieldController<String>? selectProductValueController;
  // State field(s) for AzyaaWarehouse widget.
  String? azyaaWarehouseValue;
  FormFieldController<String>? azyaaWarehouseValueController;
  // State field(s) for stock widget.
  FocusNode? stockFocusNode;
  TextEditingController? stockTextController;
  String? Function(BuildContext, String?)? stockTextControllerValidator;
  String? _stockTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zi98x9yr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for prefferedvendor widget.
  bool? prefferedvendorValue;
  // State field(s) for ETA widget.
  FocusNode? etaFocusNode;
  TextEditingController? etaTextController;
  String? Function(BuildContext, String?)? etaTextControllerValidator;
  String? _etaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kl3qlx1o' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for LowStock widget.
  FocusNode? lowStockFocusNode1;
  TextEditingController? lowStockTextController1;
  String? Function(BuildContext, String?)? lowStockTextController1Validator;
  String? _lowStockTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dxttk4hv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for LowStock widget.
  FocusNode? lowStockFocusNode2;
  TextEditingController? lowStockTextController2;
  String? Function(BuildContext, String?)? lowStockTextController2Validator;
  // State field(s) for Notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // State field(s) for MainProductType widget.
  String? mainProductTypeValue1;
  FormFieldController<String>? mainProductTypeValueController1;
  // State field(s) for MainProductType widget.
  String? mainProductTypeValue2;
  FormFieldController<String>? mainProductTypeValueController2;
  // State field(s) for ProductPrice widget.
  FocusNode? productPriceFocusNode;
  TextEditingController? productPriceTextController;
  String? Function(BuildContext, String?)? productPriceTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapresult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InventoryRecord? newInvetory;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    stockTextControllerValidator = _stockTextControllerValidator;
    etaTextControllerValidator = _etaTextControllerValidator;
    lowStockTextController1Validator = _lowStockTextController1Validator;
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    stockFocusNode?.dispose();
    stockTextController?.dispose();

    etaFocusNode?.dispose();
    etaTextController?.dispose();

    lowStockFocusNode1?.dispose();
    lowStockTextController1?.dispose();

    lowStockFocusNode2?.dispose();
    lowStockTextController2?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();

    productPriceFocusNode?.dispose();
    productPriceTextController?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
