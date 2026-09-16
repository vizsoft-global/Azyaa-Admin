import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pick_up_address_add_widget.dart' show PickUpAddressAddWidget;
import 'package:flutter/material.dart';

class PickUpAddressAddModel extends FlutterFlowModel<PickUpAddressAddWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pk0brogw' /* Name is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'w9jchib9' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 30) {
      return FFLocalizations.of(context).getText(
        'qj9deeld' /* Maximum 30 characters are requ... */,
      );
    }

    return null;
  }

  // State field(s) for MobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberTextController;
  String? Function(BuildContext, String?)? mobileNumberTextControllerValidator;
  String? _mobileNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5r4gge7t' /* Mobile Number is required */,
      );
    }

    if (!RegExp(
            '^(?:\\+?(?:965|966|971|968|974|973)|0)?(5\\d{8}|[569]\\d{7}|9[1-9]\\d{6}|3\\d{7}|[3-7]\\d{7}|5[024568]\\d{7})\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'alhr05qs' /* Please enter a valid mobile nu... */,
      );
    }
    return null;
  }

  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b70a42t8' /* Address is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '567oemd0' /* Minimum 3 characters are requi... */,
      );
    }
    if (val.length > 250) {
      return FFLocalizations.of(context).getText(
        'daedc84h' /* Maximum 250 characters are req... */,
      );
    }
    if (!RegExp('^[A-Za-z0-9\\s,.\\-\\/#]{3,250}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '9ks1s8r5' /* Invalid address format. */,
      );
    }
    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jh36447r' /* City is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '9zp6swzh' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        '7ysjzdyo' /* Maximum 50 characters are requ... */,
      );
    }
    if (!RegExp('^[A-Za-z\\u0600-\\u06FF\\s\\-]{2,50}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'naso4i63' /* Invalid city format. */,
      );
    }
    return null;
  }

  // State field(s) for Governorate widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  String? _regionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return null;
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'z9id15z4' /* Maximum 50 characters are requ... */,
      );
    }
    return null;
  }

  // State field(s) for Country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for Building widget.
  FocusNode? buildingFocusNode;
  TextEditingController? buildingTextController;
  String? Function(BuildContext, String?)? buildingTextControllerValidator;
  // State field(s) for Block widget.
  FocusNode? blockFocusNode;
  TextEditingController? blockTextController;
  String? Function(BuildContext, String?)? blockTextControllerValidator;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    mobileNumberTextControllerValidator = _mobileNumberTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    regionTextControllerValidator = _regionTextControllerValidator;
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mobileNumberFocusNode?.dispose();
    mobileNumberTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    regionFocusNode?.dispose();
    regionTextController?.dispose();

    buildingFocusNode?.dispose();
    buildingTextController?.dispose();

    blockFocusNode?.dispose();
    blockTextController?.dispose();

    themeStatusCheckerModel.dispose();
  }
}
