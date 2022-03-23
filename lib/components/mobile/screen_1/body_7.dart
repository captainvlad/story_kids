import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body7Mobile extends StatelessWidget {
  const Body7Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            child: Text(
              currentLocale.we_created,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                color: secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: min(
                  uiManager.blockSizeHorizontal * 2.5,
                  uiManager.blockSizeVertical * 2.5,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  children: [
                    Image.asset(
                      "images/skids_10.jpg",
                      height: uiManager.blockSizeVertical * 20,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.acquisition,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.children,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 4,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  children: [
                    Image.asset(
                      "images/skids_11.jpeg",
                      height: uiManager.blockSizeVertical * 20,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.acquisition,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.children,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
        ],
      ),
    );
  }
}
