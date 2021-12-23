import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void hideCurrentKeyboard() {
  if (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0) {
    /* hide keyboard */
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
