import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pick_up_address_edit_widget.dart' show PickUpAddressEditWidget;
import 'package:flutter/material.dart';

class PickUpAddressEditModel extends FlutterFlowModel<PickUpAddressEditWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '90au1n4s' /* Name is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'ullys7yv' /* Minimum 3 characters are requi... */,
      );
    }
    if (val.length > 30) {
      return FFLocalizations.of(context).getText(
        '9r6g14bw' /* Maximum 30 characters are requ... */,
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
        'hs616f7h' /* Mobile number is required */,
      );
    }

    if (!RegExp(
            '^(?:\\+?(?:965|966|971|968|974|973)|0)?(5\\d{8}|[569]\\d{7}|9[1-9]\\d{6}|3\\d{7}|[3-7]\\d{7}|5[024568]\\d{7})\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'y48wlijm' /* Please enter a valid mobile nu... */,
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
        '1brfhh1l' /* Address is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '8jiditsv' /* Minimum 3 characters are requi... */,
      );
    }
    if (val.length > 250) {
      return FFLocalizations.of(context).getText(
        '1rkibh4d' /* Maximum 250 characters are req... */,
      );
    }
    if (!RegExp('^[A-Za-z0-9\\s,.\\-\\/#]{3,250}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'xt72fiw2' /* Invalid address format. */,
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
        'a4f12svx' /* City is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'qqsfscbe' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'j3podglh' /* Maximum 50 characters are requ... */,
      );
    }
    if (!RegExp('^[A-Za-z\\u0600-\\u06FF\\s\\-]{2,50}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0de7diou' /* Invalid city format. */,
      );
    }
    return null;
  }

  // State field(s) for Region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  String? _regionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e82pfs1l' /* Region is required. */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'hotzbekc' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'ogstumje' /* Maximum 50 characters are requ... */,
      );
    }
    if (!RegExp('^[A-Za-z\\u0600-\\u06FF\\s\\-]{2,50}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '31lbz9hq' /* Invalid region format */,
      );
    }
    return null;
  }

  // State field(s) for Country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // Stores action output result for [Backend Call - API (CountryISO)] action in Country widget.
  ApiCallResponse? apiResultCtryISO;
  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeTextController;
  String? Function(BuildContext, String?)? postalCodeTextControllerValidator;
  String? _postalCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '56rjsq5f' /* Postal code is required */,
      );
    }

    if (!RegExp('^\\d{3,5}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'bgc7ub2f' /* Invalid input */,
      );
    }
    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    mobileNumberTextControllerValidator = _mobileNumberTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    regionTextControllerValidator = _regionTextControllerValidator;
    postalCodeTextControllerValidator = _postalCodeTextControllerValidator;
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

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();
  }
}
