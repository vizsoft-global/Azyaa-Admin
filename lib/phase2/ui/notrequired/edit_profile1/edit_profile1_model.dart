import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile1_widget.dart' show EditProfile1Widget;
import 'package:flutter/material.dart';

class EditProfile1Model extends FlutterFlowModel<EditProfile1Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for PhoneNo widget.
  FocusNode? phoneNoFocusNode;
  TextEditingController? phoneNoTextController;
  String? Function(BuildContext, String?)? phoneNoTextControllerValidator;
  // State field(s) for LocationCity widget.
  FocusNode? locationCityFocusNode;
  TextEditingController? locationCityTextController;
  String? Function(BuildContext, String?)? locationCityTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for BrandName widget.
  FocusNode? brandNameFocusNode1;
  TextEditingController? brandNameTextController1;
  String? Function(BuildContext, String?)? brandNameTextController1Validator;
  // State field(s) for Experience widget.
  FocusNode? experienceFocusNode;
  TextEditingController? experienceTextController;
  String? Function(BuildContext, String?)? experienceTextControllerValidator;
  // State field(s) for PlatformRate widget.
  String? platformRateValue;
  FormFieldController<String>? platformRateValueController;
  // State field(s) for AvailabilityforCustomOrders widget.
  String? availabilityforCustomOrdersValue;
  FormFieldController<String>? availabilityforCustomOrdersValueController;
  // State field(s) for OpenforEventsCollaborations widget.
  String? openforEventsCollaborationsValue;
  FormFieldController<String>? openforEventsCollaborationsValueController;
  // State field(s) for ProductionCapacity widget.
  String? productionCapacityValue;
  FormFieldController<String>? productionCapacityValueController;
  // State field(s) for BrandName widget.
  FocusNode? brandNameFocusNode2;
  TextEditingController? brandNameTextController2;
  String? Function(BuildContext, String?)? brandNameTextController2Validator;
  // State field(s) for BrandName widget.
  FocusNode? brandNameFocusNode3;
  TextEditingController? brandNameTextController3;
  String? Function(BuildContext, String?)? brandNameTextController3Validator;
  // State field(s) for OtherCertificate widget.
  String? otherCertificateValue;
  FormFieldController<String>? otherCertificateValueController;

  @override
  void initState(BuildContext context) {}

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

    brandNameFocusNode1?.dispose();
    brandNameTextController1?.dispose();

    experienceFocusNode?.dispose();
    experienceTextController?.dispose();

    brandNameFocusNode2?.dispose();
    brandNameTextController2?.dispose();

    brandNameFocusNode3?.dispose();
    brandNameTextController3?.dispose();
  }
}
