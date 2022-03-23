import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body5 extends StatelessWidget {
  const Body5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            currentLocale.trusted,
            style: const TextStyle(
              fontFamily: "Montserrat",
              color: secondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First comment
              SizedBox(
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.it_s_now,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.stars,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.our_whole,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeVertical * 3,
              ),
              // Second comment
              SizedBox(
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.awesome,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.stars,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.my_kids,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 26,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeVertical * 3,
              ),
              // Third comment
              SizedBox(
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.great,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.stars,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.as_a,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 7,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeVertical * 3,
              ),
              // Fourth comment
              SizedBox(
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.adore,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.stars,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.delighted,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 10,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
        ],
      ),
    );
  }
}
