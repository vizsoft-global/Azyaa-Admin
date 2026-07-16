import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'theme_status_checker_model.dart';
export 'theme_status_checker_model.dart';

class ThemeStatusCheckerWidget extends StatefulWidget {
  const ThemeStatusCheckerWidget({super.key});

  @override
  State<ThemeStatusCheckerWidget> createState() =>
      _ThemeStatusCheckerWidgetState();
}

class _ThemeStatusCheckerWidgetState extends State<ThemeStatusCheckerWidget> {
  late ThemeStatusCheckerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThemeStatusCheckerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.settingTheme = await querySettingsRecordOnce(
        queryBuilder: (settingsRecord) => settingsRecord.where(
          'type',
          isEqualTo: 'Company',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.settingTheme?.mainThemeId !=
          valueOrDefault<int>(
            FFAppState().theme.themeId,
            1003,
          )) {
        _model.themeResult1 = await queryThemeRecordOnce(
          queryBuilder: (themeRecord) => themeRecord.where(
            'theme_id',
            isEqualTo: _model.settingTheme?.mainThemeId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().updateThemeStruct(
          (e) => e
            ..themeId = _model.settingTheme?.mainThemeId
            ..themeMain = _model.themeResult1?.themeInfo,
        );
        safeSetState(() {});
      } else {
        _model.themeResult2 = await queryThemeRecordOnce(
          queryBuilder: (themeRecord) => themeRecord.where(
            'theme_id',
            isEqualTo: _model.settingTheme?.mainThemeId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().updateThemeStruct(
          (e) => e
            ..themeId = _model.settingTheme?.mainThemeId
            ..themeMain = _model.themeResult2?.themeInfo,
        );
        safeSetState(() {});
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
