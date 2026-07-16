import '/backend/backend.dart';
import '/components/theme_status_checker_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/phase1/component/azyaa_responsive/azyaa_responsive_widget.dart';
import '/phase1/component/azyaa_sidebar/azyaa_sidebar_widget.dart';
import '/phase1/notification_in_app/notificatio_alert/notificatio_alert_widget.dart';
import '/index.dart';
import 'inventory_p_m_widget.dart' show InventoryPMWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class InventoryPMModel extends FlutterFlowModel<InventoryPMWidget> {
  ///  Local state fields for this page.

  List<String> adminChoicechips = [
    'All',
    'Active',
    'Inactive',
    'Low Stock Alert'
  ];
  void addToAdminChoicechips(String item) => adminChoicechips.add(item);
  void removeFromAdminChoicechips(String item) => adminChoicechips.remove(item);
  void removeAtIndexFromAdminChoicechips(int index) =>
      adminChoicechips.removeAt(index);
  void insertAtIndexInAdminChoicechips(int index, String item) =>
      adminChoicechips.insert(index, item);
  void updateAdminChoicechipsAtIndex(int index, Function(String) updateFn) =>
      adminChoicechips[index] = updateFn(adminChoicechips[index]);

  List<String> designerChoicehips = [
    'All',
    'Active',
    'Inactive',
    'Low Stock Alert',
    ''
  ];
  void addToDesignerChoicehips(String item) => designerChoicehips.add(item);
  void removeFromDesignerChoicehips(String item) =>
      designerChoicehips.remove(item);
  void removeAtIndexFromDesignerChoicehips(int index) =>
      designerChoicehips.removeAt(index);
  void insertAtIndexInDesignerChoicehips(int index, String item) =>
      designerChoicehips.insert(index, item);
  void updateDesignerChoicehipsAtIndex(int index, Function(String) updateFn) =>
      designerChoicehips[index] = updateFn(designerChoicehips[index]);

  String styleName = 'List';

  String permissionKey = 'inventory';

  List<String> adminChoicechipsAR = [
    'الجميع',
    'نشيط',
    'غير نشط',
    'تنبيه انخفاض المخزون'
  ];
  void addToAdminChoicechipsAR(String item) => adminChoicechipsAR.add(item);
  void removeFromAdminChoicechipsAR(String item) =>
      adminChoicechipsAR.remove(item);
  void removeAtIndexFromAdminChoicechipsAR(int index) =>
      adminChoicechipsAR.removeAt(index);
  void insertAtIndexInAdminChoicechipsAR(int index, String item) =>
      adminChoicechipsAR.insert(index, item);
  void updateAdminChoicechipsARAtIndex(int index, Function(String) updateFn) =>
      adminChoicechipsAR[index] = updateFn(adminChoicechipsAR[index]);

  List<String> designerChoicehipsAR = [
    'الجميع',
    'نشيط',
    'غير نشط',
    'تنبيه انخفاض المخزون'
  ];
  void addToDesignerChoicehipsAR(String item) => designerChoicehipsAR.add(item);
  void removeFromDesignerChoicehipsAR(String item) =>
      designerChoicehipsAR.remove(item);
  void removeAtIndexFromDesignerChoicehipsAR(int index) =>
      designerChoicehipsAR.removeAt(index);
  void insertAtIndexInDesignerChoicehipsAR(int index, String item) =>
      designerChoicehipsAR.insert(index, item);
  void updateDesignerChoicehipsARAtIndex(
          int index, Function(String) updateFn) =>
      designerChoicehipsAR[index] = updateFn(designerChoicehipsAR[index]);

  String searchStatus = 'Hide';

  ///  State fields for stateful widgets in this page.

  // Model for azyaa_sidebar component.
  late AzyaaSidebarModel azyaaSidebarModel;
  // Model for notificatio_alert component.
  late NotificatioAlertModel notificatioAlertModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Algolia Search Results from action on search
  List<InventoryRecord>? algoliaSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<InventoryRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<InventoryRecord>();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<InventoryRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<InventoryRecord>();
  // Model for azyaa_responsive component.
  late AzyaaResponsiveModel azyaaResponsiveModel;
  // Model for theme_status_checker component.
  late ThemeStatusCheckerModel themeStatusCheckerModel;

  @override
  void initState(BuildContext context) {
    azyaaSidebarModel = createModel(context, () => AzyaaSidebarModel());
    notificatioAlertModel = createModel(context, () => NotificatioAlertModel());
    azyaaResponsiveModel = createModel(context, () => AzyaaResponsiveModel());
    themeStatusCheckerModel =
        createModel(context, () => ThemeStatusCheckerModel());
  }

  @override
  void dispose() {
    azyaaSidebarModel.dispose();
    notificatioAlertModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    paginatedDataTableController3.dispose();
    paginatedDataTableController4.dispose();
    azyaaResponsiveModel.dispose();
    themeStatusCheckerModel.dispose();
  }
}
