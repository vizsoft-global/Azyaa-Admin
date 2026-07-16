import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_setting_banner_edit_widget.dart' show HomeSettingBannerEditWidget;
import 'package:flutter/material.dart';

class HomeSettingBannerEditModel
    extends FlutterFlowModel<HomeSettingBannerEditWidget> {
  ///  Local state fields for this component.

  List<InfoStruct> bannerList = [];
  void addToBannerList(InfoStruct item) => bannerList.add(item);
  void removeFromBannerList(InfoStruct item) => bannerList.remove(item);
  void removeAtIndexFromBannerList(int index) => bannerList.removeAt(index);
  void insertAtIndexInBannerList(int index, InfoStruct item) =>
      bannerList.insert(index, item);
  void updateBannerListAtIndex(int index, Function(InfoStruct) updateFn) =>
      bannerList[index] = updateFn(bannerList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6b8wbesp' /* Title is required */,
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
        'j2rwozfk' /* Subtitle is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
