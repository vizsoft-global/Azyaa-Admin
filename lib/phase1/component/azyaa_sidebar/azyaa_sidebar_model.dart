import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/role_feature/role_permision_checher/role_permision_checher_widget.dart';
import 'azyaa_sidebar_widget.dart' show AzyaaSidebarWidget;
import 'package:flutter/material.dart';

class AzyaaSidebarModel extends FlutterFlowModel<AzyaaSidebarWidget> {
  ///  Local state fields for this component.

  String? menuName = 'Customers';

  String? submenuName;

  String permissionKeyCreator = 'creator';

  String permissionKeyDesigner = 'designer';

  String permissionKeyCustomer = 'customer';

  String permissionKeyMedia = 'media';

  String permissionKeyOrder = 'order';

  String permissionKeyProduct = 'product';

  String permissionKeyRole = 'role';

  String permissionKeySettings = 'settings';

  String permissionKeyDashboard = 'dashboard';

  ///  State fields for stateful widgets in this component.

  // Model for Role_Permision-Checher component.
  late RolePermisionChecherModel rolePermisionChecherModel;

  @override
  void initState(BuildContext context) {
    rolePermisionChecherModel =
        createModel(context, () => RolePermisionChecherModel());
  }

  @override
  void dispose() {
    rolePermisionChecherModel.dispose();
  }
}
