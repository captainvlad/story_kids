import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/benefit_desktop.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body7 extends StatelessWidget {
  const Body7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            child: Text(
              currentLocale.we_created,
              textAlign: TextAlign.center,
              style: uiManager.desktop700Style2,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BenefitDesktop(
                uiManager: uiManager,
                title: currentLocale.acquisition,
                subtitle: currentLocale.children,
                imageUrl: LocalContentProvider.instance.homeScreen6!,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 4,
              ),
              BenefitDesktop(
                uiManager: uiManager,
                title: currentLocale.acquisition,
                subtitle: currentLocale.children,
                imageUrl: LocalContentProvider.instance.homeScreen7!,
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
