import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/tablet/home_screen/benefit_tablet.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body7Tablet extends StatelessWidget {
  const Body7Tablet({Key? key}) : super(key: key);

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
              style: uiManager.mobile700Style2,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 45,
                child: BenefitTablet(
                  uiManager: uiManager,
                  imagePath: LocalContentProvider.instance.homeScreen6!,
                  subtitle: currentLocale.children,
                  title: currentLocale.acquisition,
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 45,
                child: BenefitTablet(
                  uiManager: uiManager,
                  imagePath: LocalContentProvider.instance.homeScreen7!,
                  subtitle: currentLocale.children,
                  title: currentLocale.acquisition,
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
