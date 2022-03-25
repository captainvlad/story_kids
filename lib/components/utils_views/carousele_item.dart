import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';

class CarouseleItem extends StatelessWidget {
  final UiManager uiManager;
  final String imagePath;

  const CarouseleItem({
    Key? key,
    required this.uiManager,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    Row buttonLabel = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.play_circle_outline,
          color: secondaryColor,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal / 2,
        ),
        Text(
          currentLocale.watch,
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            color: secondaryColor,
          ),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      height: uiManager.blockSizeVertical * 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: uiManager.blockSizeHorizontal * 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Nasla Klasa Jest Rodzina",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                const Text(
                  "Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby, Rodzina to nie tylko osoby",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                SizedBox(
                  width: uiManager.blockSizeHorizontal * 15,
                  child: RoundedButton(
                    text: buttonLabel,
                    uiManager: uiManager,
                    fillColor: primaryColor,
                    strokeColor: primaryColor,
                    onPressed: () {
                      print("Button pressed");
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 30,
          ),
        ],
      ),
    );
  }
}
