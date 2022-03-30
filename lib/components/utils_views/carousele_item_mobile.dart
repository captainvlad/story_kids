import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/video_player.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
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
          style: uiManager.mobile900Style5,
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
                  style: uiManager.mobile700Style3,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Text(
                  "Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby",
                  style: uiManager.mobile300Style2,
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
                  NavigationManager.pushNamed(VideoPlayerScreen.path, null);
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
