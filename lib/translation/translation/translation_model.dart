import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/index.dart';
import 'translation_widget.dart' show TranslationWidget;
import 'package:flutter/material.dart';

class TranslationModel extends FlutterFlowModel<TranslationWidget> {
  ///  Local state fields for this page.

  String categoryFilters = 'all';

  String searchStatus = 'Hide';

  String styleName = 'List';

  String permissionKey = 'category';

  String permissionKeyEdit = 'category_edit';

  String permissionKeyAdd = 'category_add';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Original-Name widget.
  FocusNode? originalNameFocusNode1;
  TextEditingController? originalNameTextController1;
  String? Function(BuildContext, String?)? originalNameTextController1Validator;
  // State field(s) for Original-Name widget.
  FocusNode? originalNameFocusNode2;
  TextEditingController? originalNameTextController2;
  String? Function(BuildContext, String?)? originalNameTextController2Validator;
  // State field(s) for Original-Name widget.
  FocusNode? originalNameFocusNode3;
  TextEditingController? originalNameTextController3;
  String? Function(BuildContext, String?)? originalNameTextController3Validator;
  // State field(s) for Original-ShortDescription widget.
  FocusNode? originalShortDescriptionFocusNode;
  TextEditingController? originalShortDescriptionTextController;
  String? Function(BuildContext, String?)?
      originalShortDescriptionTextControllerValidator;
  // State field(s) for Original-Name widget.
  FocusNode? originalNameFocusNode4;
  TextEditingController? originalNameTextController4;
  String? Function(BuildContext, String?)? originalNameTextController4Validator;
  // State field(s) for Original-Description widget.
  FocusNode? originalDescriptionFocusNode;
  TextEditingController? originalDescriptionTextController;
  String? Function(BuildContext, String?)?
      originalDescriptionTextControllerValidator;
  // State field(s) for Auto-Name-EN widget.
  FocusNode? autoNameENFocusNode;
  TextEditingController? autoNameENTextController;
  String? Function(BuildContext, String?)? autoNameENTextControllerValidator;
  // State field(s) for Auto-Name-AR widget.
  FocusNode? autoNameARFocusNode;
  TextEditingController? autoNameARTextController;
  String? Function(BuildContext, String?)? autoNameARTextControllerValidator;
  // State field(s) for Auto-ShortDescription_EN widget.
  FocusNode? autoShortDescriptionENFocusNode;
  TextEditingController? autoShortDescriptionENTextController;
  String? Function(BuildContext, String?)?
      autoShortDescriptionENTextControllerValidator;
  // State field(s) for Auto-ShortDescription_AR widget.
  FocusNode? autoShortDescriptionARFocusNode;
  TextEditingController? autoShortDescriptionARTextController;
  String? Function(BuildContext, String?)?
      autoShortDescriptionARTextControllerValidator;
  // State field(s) for Auto_Description_en widget.
  FocusNode? autoDescriptionEnFocusNode;
  TextEditingController? autoDescriptionEnTextController;
  String? Function(BuildContext, String?)?
      autoDescriptionEnTextControllerValidator;
  // State field(s) for Auto_Description_ar widget.
  FocusNode? autoDescriptionArFocusNode;
  TextEditingController? autoDescriptionArTextController;
  String? Function(BuildContext, String?)?
      autoDescriptionArTextControllerValidator;
  // State field(s) for Custom-Name-EN widget.
  FocusNode? customNameENFocusNode;
  TextEditingController? customNameENTextController;
  String? Function(BuildContext, String?)? customNameENTextControllerValidator;
  // State field(s) for Custom-Name-AR widget.
  FocusNode? customNameARFocusNode;
  TextEditingController? customNameARTextController;
  String? Function(BuildContext, String?)? customNameARTextControllerValidator;
  // State field(s) for Custom-ShortDescription_EN widget.
  FocusNode? customShortDescriptionENFocusNode;
  TextEditingController? customShortDescriptionENTextController;
  String? Function(BuildContext, String?)?
      customShortDescriptionENTextControllerValidator;
  // State field(s) for Custom-ShortDescription_AR widget.
  FocusNode? customShortDescriptionARFocusNode;
  TextEditingController? customShortDescriptionARTextController;
  String? Function(BuildContext, String?)?
      customShortDescriptionARTextControllerValidator;
  // State field(s) for Custom_Description_en widget.
  FocusNode? customDescriptionEnFocusNode;
  TextEditingController? customDescriptionEnTextController;
  String? Function(BuildContext, String?)?
      customDescriptionEnTextControllerValidator;
  // State field(s) for Custom_Description_ar widget.
  FocusNode? customDescriptionArFocusNode;
  TextEditingController? customDescriptionArTextController;
  String? Function(BuildContext, String?)?
      customDescriptionArTextControllerValidator;
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
    originalNameFocusNode1?.dispose();
    originalNameTextController1?.dispose();

    originalNameFocusNode2?.dispose();
    originalNameTextController2?.dispose();

    originalNameFocusNode3?.dispose();
    originalNameTextController3?.dispose();

    originalShortDescriptionFocusNode?.dispose();
    originalShortDescriptionTextController?.dispose();

    originalNameFocusNode4?.dispose();
    originalNameTextController4?.dispose();

    originalDescriptionFocusNode?.dispose();
    originalDescriptionTextController?.dispose();

    autoNameENFocusNode?.dispose();
    autoNameENTextController?.dispose();

    autoNameARFocusNode?.dispose();
    autoNameARTextController?.dispose();

    autoShortDescriptionENFocusNode?.dispose();
    autoShortDescriptionENTextController?.dispose();

    autoShortDescriptionARFocusNode?.dispose();
    autoShortDescriptionARTextController?.dispose();

    autoDescriptionEnFocusNode?.dispose();
    autoDescriptionEnTextController?.dispose();

    autoDescriptionArFocusNode?.dispose();
    autoDescriptionArTextController?.dispose();

    customNameENFocusNode?.dispose();
    customNameENTextController?.dispose();

    customNameARFocusNode?.dispose();
    customNameARTextController?.dispose();

    customShortDescriptionENFocusNode?.dispose();
    customShortDescriptionENTextController?.dispose();

    customShortDescriptionARFocusNode?.dispose();
    customShortDescriptionARTextController?.dispose();

    customDescriptionEnFocusNode?.dispose();
    customDescriptionEnTextController?.dispose();

    customDescriptionArFocusNode?.dispose();
    customDescriptionArTextController?.dispose();

    azyaaResponsiveModel.dispose();
  }
}
