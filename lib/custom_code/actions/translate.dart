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

import 'package:translator/translator.dart';

Future<String?> translate(String mainText, String translateTo) async {
  // Add your function code here!
  String translated = await translateText(mainText, to: translateTo);
  return translated;
}

Future<String> translateText(String input,
    {String from = 'auto', required String to}) async {
  final translator = GoogleTranslator();

  try {
    final translation = await translator.translate(input, from: from, to: to);
    return translation.text; // Returns the translated text
  } catch (e) {
    return 'Error: ${e.toString()}'; // Returns an error message if translation fails
  }
}
