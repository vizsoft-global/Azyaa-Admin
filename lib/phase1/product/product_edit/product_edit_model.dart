import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'product_edit_widget.dart' show ProductEditWidget;
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductEditModel extends FlutterFlowModel<ProductEditWidget> {
  ///  Local state fields for this page.

  ProductStockStruct? product;
  void updateProductStruct(Function(ProductStockStruct) updateFn) {
    updateFn(product ??= ProductStockStruct());
  }

  String setStatus = 'Pending';

  String permissionKey = 'product_edit';

  String? returnStatus;

  DateTime? affiliateEnddate;

  String? vto = '';

  String? refundable;

  String? affilliation;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for producttitle widget.
  FocusNode? producttitleFocusNode;
  TextEditingController? producttitleTextController;
  String? Function(BuildContext, String?)? producttitleTextControllerValidator;
  String? _producttitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8l4d9rnx' /* Enter product title !! */,
      );
    }

    return null;
  }

  // State field(s) for short-description widget.
  FocusNode? shortDescriptionFocusNode;
  TextEditingController? shortDescriptionTextController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextControllerValidator;
  // State field(s) for productDescription widget.
  FocusNode? productDescriptionFocusNode;
  TextEditingController? productDescriptionTextController;
  String? Function(BuildContext, String?)?
      productDescriptionTextControllerValidator;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode1;
  TextEditingController? skuTextController1;
  String? Function(BuildContext, String?)? skuTextController1Validator;
  String? _skuTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j81hhq2u' /* Add product SKU */,
      );
    }

    return null;
  }

  // State field(s) for SKU widget.
  FocusNode? skuFocusNode2;
  TextEditingController? skuTextController2;
  String? Function(BuildContext, String?)? skuTextController2Validator;
  // State field(s) for MainProductType widget.
  String? mainProductTypeValue;
  FormFieldController<String>? mainProductTypeValueController;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode3;
  TextEditingController? skuTextController3;
  String? Function(BuildContext, String?)? skuTextController3Validator;
  // State field(s) for SKU widget.
  FocusNode? skuFocusNode4;
  TextEditingController? skuTextController4;
  String? Function(BuildContext, String?)? skuTextController4Validator;
  // State field(s) for MainNoOfDateShipp widget.
  FocusNode? mainNoOfDateShippFocusNode;
  TextEditingController? mainNoOfDateShippTextController;
  String? Function(BuildContext, String?)?
      mainNoOfDateShippTextControllerValidator;
  String? _mainNoOfDateShippTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f6p9qv32' /* Enter estimated shipping date. */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for VirtualTryonOld widget.
  bool? virtualTryonOldValue;
  // State field(s) for alertthreshold widget.
  FocusNode? alertthresholdFocusNode;
  TextEditingController? alertthresholdTextController;
  String? Function(BuildContext, String?)?
      alertthresholdTextControllerValidator;
  String? _alertthresholdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'va1t7oyg' /* Enter threshold limit for rest... */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ProductPrice widget.
  FocusNode? productPriceFocusNode;
  TextEditingController? productPriceTextController;
  String? Function(BuildContext, String?)? productPriceTextControllerValidator;
  String? _productPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e9qugmfp' /* Add Product price !! */,
      );
    }

    return null;
  }

  // State field(s) for CompareatPrice widget.
  FocusNode? compareatPriceFocusNode;
  TextEditingController? compareatPriceTextController;
  String? Function(BuildContext, String?)?
      compareatPriceTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rwg1sxnj' /* Enter product weight(gm) */,
      );
    }

    return null;
  }

  // State field(s) for StockAlert widget.
  FocusNode? stockAlertFocusNode;
  TextEditingController? stockAlertTextController;
  String? Function(BuildContext, String?)? stockAlertTextControllerValidator;
  // State field(s) for return-allow widget.
  bool? returnAllowValue;
  // State field(s) for returnDays widget.
  FocusNode? returnDaysFocusNode;
  TextEditingController? returnDaysTextController;
  String? Function(BuildContext, String?)? returnDaysTextControllerValidator;
  // State field(s) for AttrbuteDropDown widget.
  String? attrbuteDropDownValue;
  FormFieldController<String>? attrbuteDropDownValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for ProductType1 widget.
  String? productType1Value;
  FormFieldController<String>? productType1ValueController;
  // State field(s) for ProductType2 widget.
  String? productType2Value;
  FormFieldController<String>? productType2ValueController;
  // State field(s) for NoOfDateShipp widget.
  FocusNode? noOfDateShippFocusNode1;
  TextEditingController? noOfDateShippTextController1;
  String? Function(BuildContext, String?)?
      noOfDateShippTextController1Validator;
  // State field(s) for NoOfDateShipp widget.
  FocusNode? noOfDateShippFocusNode2;
  TextEditingController? noOfDateShippTextController2;
  String? Function(BuildContext, String?)?
      noOfDateShippTextController2Validator;
  // State field(s) for NoOfDateShipp widget.
  FocusNode? noOfDateShippFocusNode3;
  TextEditingController? noOfDateShippTextController3;
  String? Function(BuildContext, String?)?
      noOfDateShippTextController3Validator;
  // State field(s) for NoOfDateShipp widget.
  FocusNode? noOfDateShippFocusNode4;
  TextEditingController? noOfDateShippTextController4;
  String? Function(BuildContext, String?)?
      noOfDateShippTextController4Validator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for ProductType3 widget.
  String? productType3Value;
  FormFieldController<String>? productType3ValueController;
  // State field(s) for ProductType4 widget.
  String? productType4Value;
  FormFieldController<String>? productType4ValueController;
  // State field(s) for SizeOptions widget.
  String? sizeOptionsValue;
  FormFieldController<String>? sizeOptionsValueController;
  // State field(s) for NoOfDateShipp widget.
  FocusNode? noOfDateShippFocusNode5;
  TextEditingController? noOfDateShippTextController5;
  String? Function(BuildContext, String?)?
      noOfDateShippTextController5Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? presentProductResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? editProductDesignerResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? indCategoryResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TagsRecord? indTagResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? unselectCatResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TagsRecord? unselectTagResult;
  // State field(s) for featureCheckbox widget.
  bool? featureCheckboxValue;
  // State field(s) for popularCheckbox widget.
  bool? popularCheckboxValue;
  // State field(s) for recommendedCheckbox widget.
  bool? recommendedCheckboxValue;
  // State field(s) for ProductStatus widget.
  String? productStatusValue;
  FormFieldController<String>? productStatusValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ImagesRecord? featureImageResult;
  // State field(s) for DropDown-UK widget.
  String? dropDownUKValue;
  FormFieldController<String>? dropDownUKValueController;
  // State field(s) for DropDown-US widget.
  String? dropDownUSValue;
  FormFieldController<String>? dropDownUSValueController;
  // State field(s) for CheckboxListTile widget.
  Map<CategoryRecord, bool> checkboxListTileValueMap1 = {};
  List<CategoryRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.
  Map<TagsRecord, bool> checkboxListTileValueMap2 = {};
  List<TagsRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for AffiliationSwitch widget.
  bool? affiliationSwitchValue;
  // State field(s) for CommisionRate widget.
  FocusNode? commisionRateFocusNode;
  TextEditingController? commisionRateTextController;
  String? Function(BuildContext, String?)? commisionRateTextControllerValidator;
  // State field(s) for CommisionPrice widget.
  FocusNode? commisionPriceFocusNode;
  TextEditingController? commisionPriceTextController;
  String? Function(BuildContext, String?)?
      commisionPriceTextControllerValidator;
  DateTime? datePicked;
  bool isDataUploading_uploadDataUKEdit12 = false;
  FFUploadedFile uploadedLocalFile_uploadDataUKEdit12 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUKEdit12 = '';

  bool isDataUploading_uploadDataUSAEdit = false;
  FFUploadedFile uploadedLocalFile_uploadDataUSAEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUSAEdit = '';

  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    producttitleTextControllerValidator = _producttitleTextControllerValidator;
    skuTextController1Validator = _skuTextController1Validator;
    mainNoOfDateShippTextControllerValidator =
        _mainNoOfDateShippTextControllerValidator;
    alertthresholdTextControllerValidator =
        _alertthresholdTextControllerValidator;
    productPriceTextControllerValidator = _productPriceTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    producttitleFocusNode?.dispose();
    producttitleTextController?.dispose();

    shortDescriptionFocusNode?.dispose();
    shortDescriptionTextController?.dispose();

    productDescriptionFocusNode?.dispose();
    productDescriptionTextController?.dispose();

    skuFocusNode1?.dispose();
    skuTextController1?.dispose();

    skuFocusNode2?.dispose();
    skuTextController2?.dispose();

    skuFocusNode3?.dispose();
    skuTextController3?.dispose();

    skuFocusNode4?.dispose();
    skuTextController4?.dispose();

    mainNoOfDateShippFocusNode?.dispose();
    mainNoOfDateShippTextController?.dispose();

    alertthresholdFocusNode?.dispose();
    alertthresholdTextController?.dispose();

    productPriceFocusNode?.dispose();
    productPriceTextController?.dispose();

    compareatPriceFocusNode?.dispose();
    compareatPriceTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    stockAlertFocusNode?.dispose();
    stockAlertTextController?.dispose();

    returnDaysFocusNode?.dispose();
    returnDaysTextController?.dispose();

    expandableExpandableController1.dispose();
    noOfDateShippFocusNode1?.dispose();
    noOfDateShippTextController1?.dispose();

    noOfDateShippFocusNode2?.dispose();
    noOfDateShippTextController2?.dispose();

    noOfDateShippFocusNode3?.dispose();
    noOfDateShippTextController3?.dispose();

    noOfDateShippFocusNode4?.dispose();
    noOfDateShippTextController4?.dispose();

    expandableExpandableController2.dispose();
    noOfDateShippFocusNode5?.dispose();
    noOfDateShippTextController5?.dispose();

    commisionRateFocusNode?.dispose();
    commisionRateTextController?.dispose();

    commisionPriceFocusNode?.dispose();
    commisionPriceTextController?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
