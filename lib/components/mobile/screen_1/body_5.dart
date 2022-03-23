import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body5Mobile extends StatelessWidget {
  const Body5Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            currentLocale.trusted,
            style: TextStyle(
              fontFamily: "Montserrat",
              color: secondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: min(
                uiManager.blockSizeHorizontal * 4,
                uiManager.blockSizeVertical * 4,
              ),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First comment
              SizedBox(
                height: uiManager.blockSizeVertical * 30,
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.it_s_now,
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
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.stars,
                      style: TextStyle(
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.our_whole,
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
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeVertical * 3,
              ),
              // Second comment
              SizedBox(
                height: uiManager.blockSizeVertical * 30,
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.awesome,
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
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.stars,
                      style: TextStyle(
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.my_kids,
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
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Third comment
              SizedBox(
                height: uiManager.blockSizeVertical * 35,
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.great,
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
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.stars,
                      style: TextStyle(
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.as_a,
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
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeVertical * 3,
              ),
              // Fourth comment
              SizedBox(
                height: uiManager.blockSizeVertical * 35,
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.adore,
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
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.stars,
                      style: TextStyle(
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      currentLocale.delighted,
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
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
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
