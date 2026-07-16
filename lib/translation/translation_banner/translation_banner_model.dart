import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import 'translation_banner_widget.dart' show TranslationBannerWidget;
import 'package:flutter/material.dart';

class TranslationBannerModel extends FlutterFlowModel<TranslationBannerWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'category';

  String permissionKeyEdit = 'category_edit';

  String permissionKeyAdd = 'category_add';

  List<InfoStruct> homeBannerList = [];
  void addToHomeBannerList(InfoStruct item) => homeBannerList.add(item);
  void removeFromHomeBannerList(InfoStruct item) => homeBannerList.remove(item);
  void removeAtIndexFromHomeBannerList(int index) =>
      homeBannerList.removeAt(index);
  void insertAtIndexInHomeBannerList(int index, InfoStruct item) =>
      homeBannerList.insert(index, item);
  void updateHomeBannerListAtIndex(int index, Function(InfoStruct) updateFn) =>
      homeBannerList[index] = updateFn(homeBannerList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for guideHeading widget.
  FocusNode? guideHeadingFocusNode;
  TextEditingController? guideHeadingTextController;
  String? Function(BuildContext, String?)? guideHeadingTextControllerValidator;
  // State field(s) for Manual-title-AR widget.
  FocusNode? manualTitleARFocusNode;
  TextEditingController? manualTitleARTextController;
  String? Function(BuildContext, String?)? manualTitleARTextControllerValidator;
  // State field(s) for guideDescprtion widget.
  FocusNode? guideDescprtionFocusNode;
  TextEditingController? guideDescprtionTextController;
  String? Function(BuildContext, String?)?
      guideDescprtionTextControllerValidator;
  // State field(s) for Manual-subtitle-AR widget.
  FocusNode? manualSubtitleARFocusNode;
  TextEditingController? manualSubtitleARTextController;
  String? Function(BuildContext, String?)?
      manualSubtitleARTextControllerValidator;
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    guideHeadingFocusNode?.dispose();
    guideHeadingTextController?.dispose();

    manualTitleARFocusNode?.dispose();
    manualTitleARTextController?.dispose();

    guideDescprtionFocusNode?.dispose();
    guideDescprtionTextController?.dispose();

    manualSubtitleARFocusNode?.dispose();
    manualSubtitleARTextController?.dispose();

    azyaaResponsiveModel.dispose();
  }
}
