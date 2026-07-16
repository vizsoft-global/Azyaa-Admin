import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_personal_info_widget.dart' show EditPersonalInfoWidget;
import 'package:flutter/material.dart';

class EditPersonalInfoModel extends FlutterFlowModel<EditPersonalInfoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qyt76ppi' /* Name is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'lc9w8fhe' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'i0gtdgtr' /* Maximum 50 characters are requ... */,
      );
    }
    if (!RegExp('^[A-Za-z\\u0600-\\u06FF\\s\\-]{2,50}\$^[A-Za-z .]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'vyfjmo49' /* Invalid name format */,
      );
    }
    return null;
  }

  // State field(s) for PhoneNo widget.
  FocusNode? phoneNoFocusNode;
  TextEditingController? phoneNoTextController;
  String? Function(BuildContext, String?)? phoneNoTextControllerValidator;
  // State field(s) for LocationCity widget.
  FocusNode? locationCityFocusNode;
  TextEditingController? locationCityTextController;
  String? Function(BuildContext, String?)? locationCityTextControllerValidator;
  String? _locationCityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i3t3ri9s' /* Location/City is required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'fmy2ls0z' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'shkfmfn3' /* Maximum 50 characters are requ... */,
      );
    }
    if (!RegExp('^[A-Za-z]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'frmlsynl' /* Invalid format */,
      );
    }
    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5ldhnxnx' /* Email is required. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'uwmr3krt' /* Invalid email format. */,
      );
    }
    return null;
  }

  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel1;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel2;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    locationCityTextControllerValidator = _locationCityTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    themeStatusCheckerModel1 =
        createModel(context, () => ThemeStatusCheckerModel());
    themeStatusCheckerModel2 =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneNoFocusNode?.dispose();
    phoneNoTextController?.dispose();

    locationCityFocusNode?.dispose();
    locationCityTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    themeStatusCheckerModel1.dispose();
    themeStatusCheckerModel2.dispose();
  }
}
