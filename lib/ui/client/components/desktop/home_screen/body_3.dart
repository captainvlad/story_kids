import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/ui_manager.dart';

import '../../../../../managers/client/local_content_provider.dart';

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
                      style: uiManager.desktop700Style2,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 3,
                    ),
                    Text(
                      currentLocale.children_spend,
                      style: uiManager.desktop700Style4,
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
                child: Image.network(
                  LocalResourcesManager.homeScreen2!,
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
