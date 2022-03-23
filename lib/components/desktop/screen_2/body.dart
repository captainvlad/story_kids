import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInBodyDesktop extends StatelessWidget {
  const LogInBodyDesktop({Key? key}) : super(key: key);

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
              RoundedButton(
                text: Text(
                  currentLocale.log_in,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                uiManager: uiManager,
                fillColor: secondaryColor,
                strokeColor: secondaryColor,
                onPressed: () {
                  print("Button log in pressed");
                },
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
              ),
              Text(
                currentLocale.plan,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: textSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 6,
              ),
              // Remove to special widget AAADIP
              Container(
                color: Colors.amber[900],
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 20,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 6,
              ),
              const Divider(
                color: blackColor,
                thickness: 1.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 6,
              ),
              Container(
                color: Colors.amber[900],
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 80,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 6,
              ),
              const Divider(
                color: blackColor,
                thickness: 1.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 3,
              ),
              Text(
                currentLocale.payment,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: textSecondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.selected_plan,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  Text(
                    currentLocale.free,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.amount,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  const Text(
                    "0.00 USD",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentLocale.pay_am,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: textSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  const Text(
                    "0.00 USD",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 6,
              ),
              RoundedButton(
                text: Text(
                  currentLocale.submit,
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
                  print("Pressed text A");
                },
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
