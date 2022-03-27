import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';

class CarouseleItemMobile extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;

  const CarouseleItemMobile({
    Key? key,
    required this.uiManager,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    Row buttonLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.play_circle_outline,
          color: secondaryColor,
        ),
        Text(
          currentLocale.watch,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: uiManager.mobileSizeUnit * 2.5,
            fontWeight: FontWeight.w900,
            color: secondaryColor,
          ),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: uiManager.blockSizeHorizontal * 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nasla Klasa Jest Rodzina",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: uiManager.mobileSizeUnit * 4,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Text(
                  "Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: uiManager.mobileSizeUnit * 2.5,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedButton(
                text: buttonLabel,
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  print("Button pressed");
                },
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
