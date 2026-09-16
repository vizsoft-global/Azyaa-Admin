import '/backend/backend.dart';
import '/backend/store_valley/store_valley_intake_tracking.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timeline_for_inventory_model.dart';
export 'timeline_for_inventory_model.dart';

class TimelineForInventoryWidget extends StatefulWidget {
  const TimelineForInventoryWidget({
    super.key,
    this.logisticsDoc,
    this.useIntakeSteps = false,
    this.liveStatus = '',
    this.requestId = '',
    this.externalRequestId = '',
    this.deliveryOrderId = '',
    this.pickupOtp = '',
    this.otpVerificationStatus = '',
    this.fulfillStatus = '',
    this.onResendOtp,
  });

  final LogisticsResponseRecord? logisticsDoc;
  final bool useIntakeSteps;
  final String liveStatus;
  final String requestId;
  final String externalRequestId;
  final String deliveryOrderId;
  final String pickupOtp;
  final String otpVerificationStatus;
  final String fulfillStatus;
  final Future<void> Function()? onResendOtp;

  @override
  State<TimelineForInventoryWidget> createState() =>
      _TimelineForInventoryWidgetState();
}

class _TimelineForInventoryWidgetState
    extends State<TimelineForInventoryWidget> {
  late TimelineForInventoryModel _model;
  bool _resending = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimelineForInventoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  String get _status {
    if (widget.liveStatus.trim().isNotEmpty) {
      return widget.liveStatus.trim();
    }
    return widget.logisticsDoc?.status ?? widget.logisticsDoc?.state ?? '';
  }

  String get _requestId {
    if (widget.requestId.trim().isNotEmpty) {
      return widget.requestId.trim();
    }
    final doc = widget.logisticsDoc;
    if (doc == null) {
      return '';
    }
    if (doc.requestId.isNotEmpty) {
      return doc.requestId;
    }
    if (doc.swftTrackID.isNotEmpty) {
      return doc.swftTrackID;
    }
    return doc.id;
  }

  String get _externalRequestId {
    if (widget.externalRequestId.trim().isNotEmpty) {
      return widget.externalRequestId.trim();
    }
    return widget.logisticsDoc?.externalRequestId ?? '';
  }

  String get _pickupOtp {
    if (widget.pickupOtp.trim().isNotEmpty) {
      return widget.pickupOtp.trim();
    }
    return widget.logisticsDoc?.pickupOtp ?? '';
  }

  String get _otpVerificationStatus {
    if (widget.otpVerificationStatus.trim().isNotEmpty) {
      return widget.otpVerificationStatus.trim();
    }
    return widget.logisticsDoc?.otpVerificationStatus ?? '';
  }

  bool get _intakeMode {
    if (widget.useIntakeSteps) {
      return true;
    }
    final lines = widget.logisticsDoc?.timeLines ?? const [];
    if (lines.isNotEmpty) {
      return false;
    }
    final status = _status.trim().toLowerCase();
    return status.startsWith('intake_') ||
        status.startsWith('pickup_') ||
        status.startsWith('verification_') ||
        status == 'stored';
  }

  Future<void> _copy(String value, String message) async {
    if (value.isEmpty) {
      return;
    }
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }

  TextStyle _idStyle() {
    return FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
          color: FFAppState().theme.themeMain.primary,
          fontSize: 13.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.w600,
          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
        );
  }

  Widget _copyIcon(String value, String message) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await _copy(value, message);
          },
          child: Icon(
            Icons.content_copy_rounded,
            color: FFAppState().theme.themeMain.primary,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final otpLabel = StoreValleyIntakeTracking.otpRowLabel(
      pickupOtp: _pickupOtp,
      fulfillStatus: widget.fulfillStatus.isNotEmpty
          ? widget.fulfillStatus
          : 'DeliveryPartnerAssigned',
      otpVerificationStatus: _otpVerificationStatus,
      intakeStatus: _status,
    );
    final showOtpCopy = otpLabel != null &&
        otpLabel.startsWith('OTP ') &&
        otpLabel != 'OTP verified';
    final canResend = widget.onResendOtp != null &&
        StoreValleyIntakeTracking.canResendPickupOtp(
          pickupOtp: _pickupOtp,
          otpVerificationStatus: _otpVerificationStatus,
          intakeStatus: _status,
        );

    return Container(
      width: 360.0,
      height: _intakeMode ? 460.0 : 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 12.0),
                  child: Text(
                    _intakeMode
                        ? 'Restock intake'
                        : FFLocalizations.of(context).getText(
                            '0y6axoyq' /* Shipping Timeline */,
                          ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FFAppState().theme.themeMain.primary,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              _requestId.isNotEmpty
                                  ? _requestId
                                  : (widget.logisticsDoc?.id ?? ''),
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: _idStyle(),
                            ),
                          ),
                          _copyIcon(
                            _requestId.isNotEmpty
                                ? _requestId
                                : (widget.logisticsDoc?.swftTrackID ?? ''),
                            'Tracking ID Copied',
                          ),
                        ],
                      ),
                      if (_externalRequestId.isNotEmpty)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                _externalRequestId,
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: _idStyle(),
                              ),
                            ),
                            _copyIcon(_externalRequestId, 'Request ID Copied'),
                          ],
                        ),
                      if (widget.deliveryOrderId.trim().isNotEmpty)
                        Text(
                          widget.deliveryOrderId.trim(),
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: _idStyle(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (otpLabel != null)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
                child: Row(
                  children: [
                    Text(
                      otpLabel,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    if (showOtpCopy)
                      _copyIcon(_pickupOtp, 'OTP Copied'),
                    if (canResend)
                      TextButton(
                        onPressed: _resending
                            ? null
                            : () async {
                                setState(() {
                                  _resending = true;
                                });
                                try {
                                  await widget.onResendOtp!.call();
                                  if (!mounted) {
                                    return;
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('OTP resent'),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } catch (error) {
                                  if (!mounted) {
                                    return;
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(error.toString()),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                } finally {
                                  if (mounted) {
                                    setState(() {
                                      _resending = false;
                                    });
                                  }
                                }
                              },
                        child: Text(_resending ? 'Sending...' : 'Resend OTP'),
                      ),
                  ],
                ),
              ),
            Expanded(
              child: _intakeMode ? _intakeSteps() : _shippingTimelines(),
            ),
          ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }

  Widget _intakeSteps() {
    final status = _status;
    final steps = StoreValleyIntakeTracking.stepsFor(status);
    final current = StoreValleyIntakeTracking.currentIndex(status);
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: steps.length,
      itemBuilder: (context, index) {
        final step = steps[index];
        final isCurrent = index == current;
        final isDone = index < current;
        return Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 4.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                      color: isDone || isCurrent
                          ? FFAppState().theme.themeMain.primary
                          : FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: valueOrDefault<Color>(
                          FFAppState().theme.themeMain.primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        width: isCurrent || isDone ? 2.0 : 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: isDone || isCurrent
                              ? FFAppState().theme.themeMain.primary
                              : FlutterFlowTheme.of(context).alternate,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 4.0,
                    height: 22.0,
                    decoration: BoxDecoration(
                      color: isDone
                          ? FFAppState().theme.themeMain.primary
                          : FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  step.label,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: isCurrent
                            ? FFAppState().theme.themeMain.primary
                            : FFAppState().theme.themeMain.primaryText,
                        letterSpacing: 0.0,
                        fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _shippingTimelines() {
    final timelines = widget.logisticsDoc?.timeLines.toList() ?? [];

    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: timelines.length,
      itemBuilder: (context, timelinesIndex) {
        final timelinesItem = timelines[timelinesIndex];
        return Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 4.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: valueOrDefault<Color>(
                          FFAppState().theme.themeMain.primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: FFAppState().theme.themeMain.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 4.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        '${dateTimeFormat(
                          "d/M/y",
                          timelinesItem.dateTime,
                          locale: FFLocalizations.of(context).languageCode,
                        )}, ${dateTimeFormat(
                          "jm",
                          timelinesItem.dateTime,
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          timelinesItem.status,
                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                                color: FFAppState().theme.themeMain.primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
