import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInBodyMobile extends StatelessWidget {
  const LogInBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
          width: uiManager.blockSizeHorizontal * 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {
                  print("Button log in pressed");
                },
                child: Text(
                  currentLocale.log_in,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: min(
                      uiManager.blockSizeHorizontal * 2.5,
                      uiManager.blockSizeVertical * 2.5,
                    ),
                  ),
                ),
                minWidth: uiManager.blockSizeHorizontal * 16,
                height: uiManager.blockSizeVertical * 6,
                color: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: secondaryColor,
          width: uiManager.blockSizeHorizontal * 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
                width: double.infinity,
              ),
              Text(
                currentLocale.plan,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: min(
                    uiManager.blockSizeHorizontal * 4,
                    uiManager.blockSizeVertical * 4,
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Container(
                color: Colors.amber[900],
                width: uiManager.blockSizeHorizontal * 60,
                height: uiManager.blockSizeVertical * 20,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              const Divider(
                color: textSecondaryColor,
                thickness: 2.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Container(
                color: Colors.amber[900],
                width: uiManager.blockSizeHorizontal * 60,
                height: uiManager.blockSizeVertical * 80,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              const Divider(
                color: textSecondaryColor,
                thickness: 2.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 3,
              ),
              Text(
                currentLocale.payment,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: textSecondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: min(
                    uiManager.blockSizeHorizontal * 2.5,
                    uiManager.blockSizeVertical * 2.5,
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.selected_plan,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeHorizontal,
                  ),
                  Text(
                    currentLocale.free,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.amount,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeHorizontal,
                  ),
                  Text(
                    "0.00 USD",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.pay_am,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeHorizontal,
                  ),
                  Text(
                    "0.00 USD",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: min(
                        uiManager.blockSizeHorizontal * 2.5,
                        uiManager.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(
                    width: 4,
                    color: primaryColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    uiManager.blockSizeHorizontal * 2,
                    uiManager.blockSizeVertical * 1,
                    uiManager.blockSizeHorizontal * 2,
                    uiManager.blockSizeVertical * 1,
                  ),
                  child: MaterialButton(
                    minWidth: uiManager.blockSizeHorizontal * 15,
                    child: Text(
                      currentLocale.submit,
                      style: TextStyle(
                        fontSize: min(
                          uiManager.blockSizeHorizontal * 2.5,
                          uiManager.blockSizeVertical * 2.5,
                        ),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    onPressed: () {
                      print("Pressed text A");
                    },
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}