import 'package:flutter/material.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              CommentTemplate(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.it_s_now,
                subtitle: currentLocale.our_whole,
              ),
              CommentTemplate(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.awesome,
                subtitle: currentLocale.my_kids,
              ),
              CommentTemplate(
                uiManager: uiManager,
                stars: currentLocale.stars,
                title: currentLocale.great,
                subtitle: currentLocale.as_a,
              ),
              CommentTemplate(
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

class CommentTemplate extends StatelessWidget {
  final String title;
  final String stars;
  final String subtitle;
  final UiManager uiManager;

  const CommentTemplate({
    Key? key,
    required this.title,
    required this.stars,
    required this.subtitle,
    required this.uiManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: uiManager.blockSizeHorizontal * 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: uiManager.desktop700Style3,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            stars,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 4,
          ),
          Text(
            subtitle,
            style: uiManager.desktop300Style2,
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 12,
          ),
        ],
      ),
    );
  }
}
