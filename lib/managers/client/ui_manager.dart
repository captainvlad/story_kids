import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/ui/resources/colors.dart';

class UiManager {
  late double screenWidth;
  late double screenHeight;
  late double mobileSizeUnit;
  late double blockSizeVertical;
  late double blockSizeHorizontal;

  late final TextStyle desktop300Style1;
  late final TextStyle desktop300Style2;
  late final TextStyle desktop300Style3;
  late final TextStyle desktop300Style4;

  late final TextStyle desktop700Style1;
  late final TextStyle desktop700Style2;
  late final TextStyle desktop700Style3;
  late final TextStyle desktop700Style4;
  late final TextStyle desktop700Style5;
  late final TextStyle desktop700Style6;
  late final TextStyle desktop700Style7;
  late final TextStyle desktop700Style8;
  late final TextStyle desktop700Style9;
  late final TextStyle desktop700Style10;
  late final TextStyle desktop700Style11;

  late final TextStyle desktop900Style1;
  late final TextStyle desktop900Style2;
  late final TextStyle desktop900Style3;
  late final TextStyle desktop900Style4;

  late final TextStyle mobile300Style1;
  late final TextStyle mobile300Style2;
  late final TextStyle mobile300Style3;

  late final TextStyle mobile700Style1;
  late final TextStyle mobile700Style2;
  late final TextStyle mobile700Style3;
  late final TextStyle mobile700Style4;
  late final TextStyle mobile700Style5;
  late final TextStyle mobile700Style6;
  late final TextStyle mobile700Style7;
  late final TextStyle mobile700Style8;
  late final TextStyle mobile700Style9;
  late final TextStyle mobile700Style10;
  late final TextStyle mobile700Style11;

  late final TextStyle mobile900Style1;
  late final TextStyle mobile900Style2;
  late final TextStyle mobile900Style3;
  late final TextStyle mobile900Style4;
  late final TextStyle mobile900Style5;
  late final TextStyle mobile900Style6;

  final bodyDecoration = const BoxDecoration(
    color: secondaryColor,
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  static final defaultAppTheme = ThemeData(
    primaryColor: secondaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
        ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
  );

  UiManager(BuildContext context, {String mode = "min"}) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    mobileSizeUnit = mode == "min"
        ? min(blockSizeVertical, blockSizeHorizontal)
        : (blockSizeVertical + blockSizeHorizontal) / 2;

    initDesktopStyles();
    initMobileStyles();
  }

  InputDecoration getCreditCardDecoration(
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

  void initDesktopStyles() {
    desktop300Style1 = const TextStyle(
      fontFamily: "Montserrat",
      color: textPrimaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    );

    desktop300Style2 = const TextStyle(
      fontFamily: "Montserrat",
      color: secondaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    );

    desktop300Style3 = const TextStyle(
      fontFamily: "Montserrat",
      color: primaryColor,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    );

    desktop700Style1 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: primaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style2 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: secondaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style3 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 25.0,
      color: secondaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style4 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20.0,
      color: secondaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style5 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20.0,
      color: textPrimaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style6 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20.0,
      color: textSecondaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style7 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: textPrimaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style8 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: textSecondaryColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style9 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20.0,
      color: textErrorColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style10 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: textErrorColor,
      fontWeight: FontWeight.w700,
    );

    desktop700Style11 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      fontWeight: FontWeight.w700,
    );

    desktop900Style1 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: textPrimaryColor,
      fontWeight: FontWeight.w900,
    );

    desktop900Style2 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 40.0,
      color: primaryColor,
      fontWeight: FontWeight.w900,
    );

    desktop900Style3 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20.0,
      color: primaryColor,
      fontWeight: FontWeight.w900,
    );

    desktop900Style4 = const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 20.0,
      color: secondaryColor,
      fontWeight: FontWeight.w900,
    );
  }

  void initMobileStyles() {
    mobile300Style1 = TextStyle(
      fontFamily: "Montserrat",
      color: textPrimaryColor,
      fontWeight: FontWeight.w300,
      fontSize: mobileSizeUnit * 2.5,
    );

    mobile300Style2 = TextStyle(
      fontFamily: "Montserrat",
      color: secondaryColor,
      fontWeight: FontWeight.w300,
      fontSize: mobileSizeUnit * 2.5,
    );

    mobile300Style3 = TextStyle(
      fontFamily: "Montserrat",
      color: primaryColor,
      fontWeight: FontWeight.w300,
      fontSize: mobileSizeUnit * 2.5,
    );

    mobile700Style1 = TextStyle(
      fontSize: 4 * mobileSizeUnit,
      color: primaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style2 = TextStyle(
      fontSize: 2.5 * mobileSizeUnit,
      color: secondaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style3 = TextStyle(
      fontSize: 4 * mobileSizeUnit,
      color: secondaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style4 = TextStyle(
      fontSize: 2.5 * mobileSizeUnit,
      color: textPrimaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style5 = TextStyle(
      fontSize: 1.25 * mobileSizeUnit,
      color: primaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style6 = TextStyle(
      fontSize: 2.5 * mobileSizeUnit,
      color: primaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style7 = TextStyle(
      fontSize: 4 * mobileSizeUnit,
      color: textPrimaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style8 = TextStyle(
      fontSize: 4 * mobileSizeUnit,
      color: textSecondaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style9 = TextStyle(
      fontSize: 2.5 * mobileSizeUnit,
      color: textSecondaryColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style10 = TextStyle(
      fontSize: 2.5 * mobileSizeUnit,
      color: textErrorColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile700Style11 = TextStyle(
      fontSize: 4 * mobileSizeUnit,
      color: textErrorColor,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
    );

    mobile900Style1 = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 4 * mobileSizeUnit,
      color: textPrimaryColor,
      fontWeight: FontWeight.w900,
    );

    mobile900Style2 = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 4 * mobileSizeUnit,
      color: primaryColor,
      fontWeight: FontWeight.w900,
    );

    mobile900Style6 = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 2.5 * mobileSizeUnit,
      fontWeight: FontWeight.w900,
    );

    mobile900Style3 = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 2.5 * mobileSizeUnit,
      color: textSecondaryColor,
      fontWeight: FontWeight.w900,
    );

    mobile900Style4 = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 2.5 * mobileSizeUnit,
      color: primaryColor,
      fontWeight: FontWeight.w900,
    );

    mobile900Style5 = TextStyle(
      fontFamily: "Montserrat",
      fontSize: 2.5 * mobileSizeUnit,
      color: secondaryColor,
      fontWeight: FontWeight.w900,
    );
  }
}
