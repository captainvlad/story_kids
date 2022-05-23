import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

class CreditCardInputDecoration {
  static InputDecoration getDecoration(
    UiManager uiManager,
    Color color,
    String labelText,
    String hintText,
  ) =>
      InputDecoration(
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: uiManager.blockSizeVertical * 1.75,
          color: color,
        ),
        labelText: labelText,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: color,
            width: 2.0,
          ),
        ),
      );
}
