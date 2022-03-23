import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body4 extends StatelessWidget {
  const Body4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: secondaryColor,
      child: Column(
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            currentLocale.what_receive,
            style: const TextStyle(
              fontFamily: "Montserrat",
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 40,
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
                height: uiManager.blockSizeVertical * 50,
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 8,
                    ),
                    Image.asset(
                      "images/skids_7.png",
                      width: uiManager.blockSizeVertical * 10,
                      height: uiManager.blockSizeVertical * 10,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.constant,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.filling,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 5,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 50,
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 8,
                    ),
                    Image.asset(
                      "images/skids_8.png",
                      width: uiManager.blockSizeVertical * 10,
                      height: uiManager.blockSizeVertical * 10,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.at_the,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.we_not,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 5,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 50,
                width: uiManager.blockSizeHorizontal * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 8,
                    ),
                    Image.asset(
                      "images/skids_9.png",
                      width: uiManager.blockSizeVertical * 10,
                      height: uiManager.blockSizeVertical * 10,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.constant,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.filling,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
