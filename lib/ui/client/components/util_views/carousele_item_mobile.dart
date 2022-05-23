import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/detailed_info_screen.dart';
import 'package:story_kids/ui/client/screens/universal/video_player_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class CarouseleItemMobile extends StatelessWidget {
  final UiManager uiManager;
  final MediaContent mediaModel;

  const CarouseleItemMobile({
    Key? key,
    required this.uiManager,
    required this.mediaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    final Row buttonLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.play_circle_outline,
          color: secondaryColor,
          size: uiManager.mobileSizeUnit * 5,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal,
        ),
        Text(
          currentLocale.watch,
          style: uiManager.mobile900Style5,
        ),
      ],
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(mediaModel.darkBackground).image,
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: uiManager.blockSizeHorizontal * 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (() {
                      NavigationManager.instance.pushNamed(
                          DetailedInfoScreen.path, {"content": mediaModel});
                    }),
                    child: Text(
                      mediaModel.title,
                      style: uiManager.mobile700Style3,
                    ),
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Text(
                  mediaModel.brief,
                  style: uiManager.mobile300Style2,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedButton(
                text: buttonLabel,
                uiManager: uiManager,
                fillColor: primaryColor,
                strokeColor: primaryColor,
                onPressed: () {
                  NavigationManager.instance.pushNamed(
                    VideoPlayerScreen.path,
                    {"content": mediaModel},
                  );
                },
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
