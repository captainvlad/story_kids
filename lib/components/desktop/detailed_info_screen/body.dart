import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailedInfoBodyDesktop extends StatelessWidget {
  const DetailedInfoBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/skids_16.jpg"),
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
                  children: [
                    Text(
                      currentLocale.afraid_upper,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.watch,
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
                        print("Pressed text 1");
                      },
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.spiders,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      currentLocale.meta,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "images/skids_17.png",
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeHorizontal * 25,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 5,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentLocale.detail,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                ),
              ),
              standardDivider,
              SizedBox(
                height: uiManager.blockSizeVertical,
              ),
              Text(
                currentLocale.afraid,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 30,
                    child: Text(
                      currentLocale.two,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 2,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentLocale.author,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical,
                        ),
                        Text(
                          currentLocale.date,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical,
                        ),
                        Text(
                          currentLocale.age,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 2,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentLocale.pictures,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical,
                        ),
                        Text(
                          currentLocale.time,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            color: blackColor,
                            fontWeight: FontWeight.w400,
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
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
        ),
      ],
    );
  }
}
