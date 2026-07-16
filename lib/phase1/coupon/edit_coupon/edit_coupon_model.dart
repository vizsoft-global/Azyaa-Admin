import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_coupon_widget.dart' show EditCouponWidget;
import 'package:flutter/material.dart';

class EditCouponModel extends FlutterFlowModel<EditCouponWidget> {
  ///  Local state fields for this component.

  String permissionKeyEdit = 'coupon';

  DateTime? startDate;

  DateTime? endDate;

  String? discountType;

  double? discountPrice;

  double? maxdiscount;

  double? minOrder;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode1;
  TextEditingController? couponTextController1;
  String? Function(BuildContext, String?)? couponTextController1Validator;
  String? _couponTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nm0mje2o' /* coupon_value is required */,
      );
    }

    return null;
  }

  // State field(s) for Discount widget.
  String? discountValue;
  FormFieldController<String>? discountValueController;
  // State field(s) for discountValue widget.
  FocusNode? discountValueFocusNode;
  TextEditingController? discountValueTextController;
  String? Function(BuildContext, String?)? discountValueTextControllerValidator;
  String? _discountValueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l52c1wy8' /* Discount Value is required */,
      );
    }

    return null;
  }

  // State field(s) for Active widget.
  String? activeValue;
  FormFieldController<String>? activeValueController;
  // State field(s) for AllUsers widget.
  String? allUsersValue;
  FormFieldController<String>? allUsersValueController;
  // State field(s) for InputField widget.
  FocusNode? inputFieldFocusNode;
  TextEditingController? inputFieldTextController;
  String? Function(BuildContext, String?)? inputFieldTextControllerValidator;
  String? _inputFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'otkid184' /* coupon limit is required */,
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
        '1ya9c9fo' /* Minimum order amount is requir... */,
      );
    }

    return null;
  }

  // State field(s) for maxdiscount widget.
  FocusNode? maxdiscountFocusNode;
  TextEditingController? maxdiscountTextController;
  String? Function(BuildContext, String?)? maxdiscountTextControllerValidator;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode2;
  TextEditingController? couponTextController2;
  String? Function(BuildContext, String?)? couponTextController2Validator;
  // State field(s) for coupon widget.
  FocusNode? couponFocusNode3;
  TextEditingController? couponTextController3;
  String? Function(BuildContext, String?)? couponTextController3Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    couponTextController1Validator = _couponTextController1Validator;
    discountValueTextControllerValidator =
        _discountValueTextControllerValidator;
    inputFieldTextControllerValidator = _inputFieldTextControllerValidator;
    minorderamtTextControllerValidator = _minorderamtTextControllerValidator;
  }

  @override
  void dispose() {
    couponFocusNode1?.dispose();
    couponTextController1?.dispose();

    discountValueFocusNode?.dispose();
    discountValueTextController?.dispose();

    inputFieldFocusNode?.dispose();
    inputFieldTextController?.dispose();

    minorderamtFocusNode?.dispose();
    minorderamtTextController?.dispose();

    maxdiscountFocusNode?.dispose();
    maxdiscountTextController?.dispose();

    couponFocusNode2?.dispose();
    couponTextController2?.dispose();

    couponFocusNode3?.dispose();
    couponTextController3?.dispose();
  }
}
