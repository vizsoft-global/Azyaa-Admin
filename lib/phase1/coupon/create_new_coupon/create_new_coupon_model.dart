import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'create_new_coupon_widget.dart' show CreateNewCouponWidget;
import 'package:flutter/material.dart';

class CreateNewCouponModel extends FlutterFlowModel<CreateNewCouponWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'coupon';

  double? minimumOrderAmount;

  double? discountprice;

  double? maxDiscount;

  String? discountType;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode1;
  TextEditingController? couponTextController1;
  String? Function(BuildContext, String?)? couponTextController1Validator;
  String? _couponTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qvbhoaoe' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Discount widget.
  String? discountValue;
  FormFieldController<String>? discountValueController;
  // State field(s) for EnterValue widget.
  String? enterValueValue;
  FormFieldController<String>? enterValueValueController;
  // State field(s) for discountValue widget.
  FocusNode? discountValueFocusNode;
  TextEditingController? discountValueTextController;
  String? Function(BuildContext, String?)? discountValueTextControllerValidator;
  String? _discountValueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4wa8qoy7' /* Discount value is required */,
      );
    }

    return null;
  }

  // State field(s) for minorderamt widget.
  FocusNode? minorderamtFocusNode;
  TextEditingController? minorderamtTextController;
  String? Function(BuildContext, String?)? minorderamtTextControllerValidator;
  String? _minorderamtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0ixx1lkh' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for maxdiscount widget.
  FocusNode? maxdiscountFocusNode;
  TextEditingController? maxdiscountTextController;
  String? Function(BuildContext, String?)? maxdiscountTextControllerValidator;
  String? _maxdiscountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'incou1qj' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for coupon-short widget.
  FocusNode? couponShortFocusNode;
  TextEditingController? couponShortTextController;
  String? Function(BuildContext, String?)? couponShortTextControllerValidator;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode2;
  TextEditingController? couponTextController2;
  String? Function(BuildContext, String?)? couponTextController2Validator;
  String? _couponTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9xpzaxje' /* Description is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeTextController;
  String? Function(BuildContext, String?)? timeTextControllerValidator;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode1;
  TextEditingController? inputFieldTextController1;
  String? Function(BuildContext, String?)? inputFieldTextController1Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? couponExists;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // State field(s) for Active widget.
  String? activeValue;
  FormFieldController<String>? activeValueController;
  // State field(s) for AllUsers widget.
  String? allUsersValue;
  FormFieldController<String>? allUsersValueController;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode2;
  TextEditingController? inputFieldTextController2;
  String? Function(BuildContext, String?)? inputFieldTextController2Validator;
  String? _inputFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wvwm9d2s' /* Minimum usage limit is require... */,
      );
    }

    return null;
  }

  // State field(s) for Eligibility widget.
  String? eligibilityValue;
  FormFieldController<String>? eligibilityValueController;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    couponTextController1Validator = _couponTextController1Validator;
    discountValueTextControllerValidator =
        _discountValueTextControllerValidator;
    minorderamtTextControllerValidator = _minorderamtTextControllerValidator;
    maxdiscountTextControllerValidator = _maxdiscountTextControllerValidator;
    couponTextController2Validator = _couponTextController2Validator;
    inputFieldTextController2Validator = _inputFieldTextController2Validator;
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    couponFocusNode1?.dispose();
    couponTextController1?.dispose();

    discountValueFocusNode?.dispose();
    discountValueTextController?.dispose();

    minorderamtFocusNode?.dispose();
    minorderamtTextController?.dispose();

    maxdiscountFocusNode?.dispose();
    maxdiscountTextController?.dispose();

    couponShortFocusNode?.dispose();
    couponShortTextController?.dispose();

    couponFocusNode2?.dispose();
    couponTextController2?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    inputFieldFocusNode1?.dispose();
    inputFieldTextController1?.dispose();

    inputFieldFocusNode2?.dispose();
    inputFieldTextController2?.dispose();

    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
