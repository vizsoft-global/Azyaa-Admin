import '/flutter_flow/flutter_flow_util.dart';
import '/phase1/role_feature/role_permision_checher/role_permision_checher_widget.dart';
import 'azyaa_sidebar_backup1_widget.dart' show AzyaaSidebarBackup1Widget;
import 'package:flutter/material.dart';

class AzyaaSidebarBackup1Model
    extends FlutterFlowModel<AzyaaSidebarBackup1Widget> {
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
