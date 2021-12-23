import 'package:flutter/material.dart';

class AiDisplayAreaModel {
  MediaQueryData? _mediaData;
  static double displayWidth = 0;
  static double displayHeight = 0;
  static bool initialized = false;
  static Size? displaySize;
  static AiDisplayAreaModel instance = AiDisplayAreaModel();

  void init(BuildContext aContext) {
    _mediaData = MediaQuery.of(aContext);
    displayWidth = _mediaData!.size.width;
    displayHeight = _mediaData!.size.height;
    displaySize = _mediaData!.size;
    initialized = true;
  }

  Size get screenSize => _mediaData!.size;
}

double displayWidth() => AiDisplayAreaModel.displayWidth;
double displayHeight() => AiDisplayAreaModel.displayHeight;
Size displaySize() => AiDisplayAreaModel().screenSize;
