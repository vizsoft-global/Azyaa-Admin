import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'role_permision_checher_model.dart';
export 'role_permision_checher_model.dart';

class RolePermisionChecherWidget extends StatefulWidget {
  const RolePermisionChecherWidget({super.key});

  @override
  State<RolePermisionChecherWidget> createState() =>
      _RolePermisionChecherWidgetState();
}

class _RolePermisionChecherWidgetState
    extends State<RolePermisionChecherWidget> {
  late RolePermisionChecherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RolePermisionChecherModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.presentUserroleResult = await queryRolesRecordOnce(
        queryBuilder: (rolesRecord) => rolesRecord.where(
          'role_unique_key',
          isEqualTo: valueOrDefault(currentUserDocument?.roleUniqueKey, ''),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((valueOrDefault(currentUserDocument?.status, '') == 'Published') &&
          ((_model.presentUserroleResult != null) == true)) {
        FFAppState().currentUserPermission = _model
            .presentUserroleResult!.permissionsList
            .toList()
            .cast<String>();
      } else {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.goNamedAuth(LoginWidget.routeName, context.mounted);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
