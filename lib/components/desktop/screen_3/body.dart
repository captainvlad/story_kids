import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogLogInBodyDesktop extends StatelessWidget {
  const LogLogInBodyDesktop({Key? key}) : super(key: key);

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
          height: uiManager.blockSizeVertical * 6,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 7,
              ),
              Text(
                currentLocale.please,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: textSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              // Remove to another widget AAADIP
              Container(
                color: Colors.yellow,
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 20,
              ),
              // Remove to another widget AAADIP
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: currentLocale.lost,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('click'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 16,
                child: CheckboxListTile(
                  title: Transform.translate(
                    offset: Offset(
                      -uiManager.blockSizeHorizontal / 2,
                      0,
                    ),
                    child: Text(
                      currentLocale.remember,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
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
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              RoundedButton(
                text: Text(
                  currentLocale.log_in,
                  style: TextStyle(
                    fontSize: uiManager.blockSizeHorizontal * 1.25,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                uiManager: uiManager,
                fillColor: secondaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  print("Pressed text AAADIP");
                },
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.have_account,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentLocale.sign,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
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
                height: uiManager.blockSizeVertical * 7,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical,
          width: double.infinity,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 8,
          width: uiManager.blockSizeHorizontal * 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                text: Text(
                  currentLocale.browse,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  print("Button log in pressed");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
