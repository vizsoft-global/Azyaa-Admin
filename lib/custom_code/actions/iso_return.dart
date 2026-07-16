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

Future<String?> isoReturn(
  List<String>? mainList,
  List<String>? isoList,
  String? name,
) async {
  // Add your function code here!
  for (int i = 0; i < mainList!.length; i++) {
    if (mainList[i].toLowerCase() == name?.toLowerCase()) {
      return isoList?[i]; // Return the matching ISO code
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
