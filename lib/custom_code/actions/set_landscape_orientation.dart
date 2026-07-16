// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future<void> setLandscapeOrientation() async {
  /// Sets the preferred screen orientation to landscape mode (both left and right).
  ///
  /// This custom action forces the application to display in landscape mode
  /// regardless of device rotation, ensuring it does not revert to portrait.
  try {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // Optionally, you can also set the system UI mode to immersive if desired,
    // though it's not strictly necessary for orientation locking.
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    //print('Screen orientation set to landscape.');
  } on MissingPluginException catch (e) {
    // This catch block handles cases where the platform channel might not be available,
    // which can happen during testing on non-native environments or specific FlutterFlow setups.
    print('Error setting orientation: MissingPluginException - $e');
  } catch (e) {
    // Catch any other potential errors during the operation.
    print('An unexpected error occurred while setting orientation: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
