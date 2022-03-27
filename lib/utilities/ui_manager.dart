import 'dart:math';

import 'package:flutter/material.dart';

class UiManager {
  late double screenWidth;
  late double screenHeight;
  late double mobileSizeUnit;
  late double blockSizeVertical;
  late double blockSizeHorizontal;

  UiManager(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    mobileSizeUnit = min(blockSizeVertical, blockSizeHorizontal);
  }
}
