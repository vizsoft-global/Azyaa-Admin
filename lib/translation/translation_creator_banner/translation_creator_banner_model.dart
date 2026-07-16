import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import 'translation_creator_banner_widget.dart'
    show TranslationCreatorBannerWidget;
import 'package:flutter/material.dart';

class TranslationCreatorBannerModel
    extends FlutterFlowModel<TranslationCreatorBannerWidget> {
  ///  Local state fields for this page.

  String permissionKey = 'category';

  String permissionKeyEdit = 'category_edit';

  String permissionKeyAdd = 'category_add';

  List<InfoStruct> creatorBannerList = [];
  void addToCreatorBannerList(InfoStruct item) => creatorBannerList.add(item);
  void removeFromCreatorBannerList(InfoStruct item) =>
      creatorBannerList.remove(item);
  void removeAtIndexFromCreatorBannerList(int index) =>
      creatorBannerList.removeAt(index);
  void insertAtIndexInCreatorBannerList(int index, InfoStruct item) =>
      creatorBannerList.insert(index, item);
  void updateCreatorBannerListAtIndex(
          int index, Function(InfoStruct) updateFn) =>
      creatorBannerList[index] = updateFn(creatorBannerList[index]);

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
