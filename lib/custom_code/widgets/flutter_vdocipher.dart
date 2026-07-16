// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// DO NOT REMOVE OR MODIFY THE CODE ABOVE

import 'package:vdocipher_flutter/vdocipher_flutter.dart';

class FlutterVdocipher extends StatefulWidget {
  const FlutterVdocipher({
    super.key,
    this.width,
    this.height,
    this.appotp,
    this.appplaybackInfoapp,
  });

  final double? width;
  final double? height;
  final String? appotp;
  final String? appplaybackInfoapp;

  @override
  State<FlutterVdocipher> createState() => _FlutterVdocipherState();
}

class _FlutterVdocipherState extends State<FlutterVdocipher> {
  late String otp2;
  late String playbackInfo2;
  @override
  void initState() {
    super.initState();
    otp2 = widget.appotp!;
    playbackInfo2 = widget.appplaybackInfoapp!;
  }

  final double aspectRatio = 4 / 3;
  late final embedInfo = EmbedInfo.streaming(
    otp: otp2,
    playbackInfo: playbackInfo2,
    embedInfoOptions: EmbedInfoOptions(
      autoplay: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VdoPlayer(
        aspectRatio: aspectRatio,
        embedInfo: embedInfo,
        onError: _onVdoError,
        onPlayerCreated: _onPlayerCreated,
      ),
    );
  }

  void _onPlayerCreated(VdoPlayerController controller) {
    // Handle player creation
  }

  void _onVdoError(VdoError vdoError) {
    print("Oops, the system encountered a problem: " + vdoError.message);
  }
}
