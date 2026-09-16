import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared list-page toolbar layout:
/// [left dropdown] [expanded search] | [showing] [export] [sort] [filter] …
class AzyaaListToolbar extends StatelessWidget {
  const AzyaaListToolbar({
    super.key,
    required this.leftControl,
    required this.searchField,
    required this.showingText,
    required this.trailingActions,
    this.extraTrailing = const [],
  });

  final Widget leftControl;
  final Widget searchField;
  final String showingText;
  final List<Widget> trailingActions;
  final List<Widget> extraTrailing;

  @override
  Widget build(BuildContext context) {
    final trailing = [...trailingActions, ...extraTrailing];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                leftControl,
                const SizedBox(width: 12.0),
                Expanded(child: searchField),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Text(
            showingText,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  font: GoogleFonts.inter(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                ),
          ),
          if (trailing.isNotEmpty) const SizedBox(width: 16.0),
          for (var i = 0; i < trailing.length; i++) ...[
            if (i > 0) const SizedBox(width: 12.0),
            trailing[i],
          ],
        ],
      ),
    );
  }
}

class AzyaaToolbarBox extends StatelessWidget {
  const AzyaaToolbarBox({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
        ),
      ),
      child: child,
    );
  }
}

class AzyaaToolbarButtons {
  static Widget export({
    required BuildContext context,
    required VoidCallback? onPressed,
    required bool isExporting,
    String label = 'Export',
  }) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: isExporting ? 'Exporting...' : label,
      icon: const Icon(Icons.download_rounded, size: 18.0),
      options: FFButtonOptions(
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.zero,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).border,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  static Widget filter({
    required BuildContext context,
    required VoidCallback? onPressed,
    required String label,
    bool active = false,
  }) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: label,
      icon: const Icon(Icons.filter_list_rounded, size: 18.0),
      options: FFButtonOptions(
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.zero,
        color: active
            ? FlutterFlowTheme.of(context).alternate
            : FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).border,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  static Widget refreshWarehouse({
    required BuildContext context,
    required VoidCallback? onPressed,
    required bool isRefreshing,
    String label = 'Refresh warehouse stock',
  }) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: isRefreshing ? 'Refreshing...' : label,
      icon: const Icon(Icons.warehouse_outlined, size: 18.0),
      options: FFButtonOptions(
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.zero,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).border,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  static Widget reset({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: 'Reset',
      icon: const Icon(Icons.refresh_rounded, size: 18.0),
      options: FFButtonOptions(
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.zero,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500),
              color: FlutterFlowTheme.of(context).error,
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).error,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
