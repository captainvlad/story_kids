import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/desktop/home_screen/comment_desktop.dart';
import 'package:story_kids/ui/resources/colors.dart';

class Body5 extends StatelessWidget {
  const Body5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Container(
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            currentLocale.trusted,
            style: uiManager.desktop700Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommentDesktop(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.it_s_now,
                subtitle: currentLocale.our_whole,
              ),
              CommentDesktop(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.awesome,
                subtitle: currentLocale.my_kids,
              ),
              CommentDesktop(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.great,
                subtitle: currentLocale.as_a,
              ),
              CommentDesktop(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.adore,
                subtitle: currentLocale.delighted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
