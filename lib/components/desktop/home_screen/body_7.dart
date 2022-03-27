import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body7 extends StatelessWidget {
  const Body7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            child: Text(
              currentLocale.we_created,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Montserrat",
                color: secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                child: Column(
                  children: [
                    Image.asset(
                      "images/skids_10.jpg",
                      height: uiManager.blockSizeVertical * 30,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.acquisition,
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
                      currentLocale.children,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 4,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                child: Column(
                  children: [
                    Image.asset(
                      "images/skids_11.jpeg",
                      height: uiManager.blockSizeVertical * 30,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.acquisition,
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
                      currentLocale.children,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
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
