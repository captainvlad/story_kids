import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/input_field.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
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
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 5,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 70,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 7,
              ),
              Text(
                currentLocale.please,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: textSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: uiManager.mobileSizeUnit * 4,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    InputCustomField(
                      text: currentLocale.username,
                      color: primaryColor,
                      uiManager: uiManager,
                      controller: null,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    InputCustomField(
                      text: currentLocale.password,
                      color: primaryColor,
                      uiManager: uiManager,
                      controller: null,
                      visibilityToggle: true,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.lost,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('click'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
                height: uiManager.blockSizeVertical * 5,
                child: Center(
                  child: CheckboxListTile(
                    title: Transform.translate(
                      offset: Offset(
                        -uiManager.blockSizeHorizontal / 2,
                        0,
                      ),
                      child: Text(
                        currentLocale.remember,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: uiManager.mobileSizeUnit * 2.5,
                        ),
                      ),
                    ),
                    value: false,
                    onChanged: (newValue) {
                      print("Checked value pressed");
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              RoundedButton(
                text: Text(
                  currentLocale.log_in,
                  style: TextStyle(
                    fontSize: uiManager.mobileSizeUnit * 2.5,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                uiManager: uiManager,
                fillColor: secondaryColor,
                strokeColor: primaryColor,
                onPressed: () {},
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.have_account,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: uiManager.mobileSizeUnit * 2.5,
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.sign,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('click'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 5,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedButton(
              text: Text(
                currentLocale.browse,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: secondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: uiManager.mobileSizeUnit * 2.5,
                ),
              ),
              uiManager: uiManager,
              fillColor: primaryColor,
              strokeColor: primaryColor,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: uiManager.blockSizeVertical * 10,
        ),
      ],
    );
  }
}
