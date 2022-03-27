import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body3 extends StatelessWidget {
  const Body3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: Colors.green,
      child: Column(
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentLocale.your_time,
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
                    Text(
                      currentLocale.children_spend,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
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
                width: uiManager.blockSizeHorizontal * 30,
                height: uiManager.blockSizeVertical * 30,
                child: Image.asset('images/skids_2.jpg'),
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
