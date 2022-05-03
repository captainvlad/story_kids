import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/detailed_info_screen.dart';
import 'package:story_kids/ui/client/screens/universal/video_player_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class CarouseleItem extends StatelessWidget {
  final UiManager uiManager;
  final MediaContent mediaModel;

  const CarouseleItem({
    Key? key,
    required this.uiManager,
    required this.mediaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    Row buttonLabel = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.play_circle_outline,
          color: secondaryColor,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal / 2,
        ),
        Text(
          currentLocale.watch,
          style: uiManager.desktop900Style4,
        ),
      ],
    );

    return Container(
      width: double.infinity,
      height: uiManager.blockSizeVertical * 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(mediaModel.darkBackground).image,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (() {
                      NavigationManager.pushNamed(
                        DetailedInfoScreen.path,
                        {"content": mediaModel},
                      );
                    }),
                    child: Text(
                      mediaModel.title,
                      style: uiManager.desktop700Style2,
                    ),
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                Text(
                  mediaModel.brief,
                  style: uiManager.desktop300Style2,
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2,
                ),
                SizedBox(
                  width: uiManager.blockSizeHorizontal * 15,
                  child: RoundedButton(
                    text: buttonLabel,
                    uiManager: uiManager,
                    fillColor: primaryColor,
                    strokeColor: primaryColor,
                    onPressed: () {
                      NavigationManager.pushNamed(
                        VideoPlayerScreen.path,
                        {"contentPath": mediaModel.contentPath},
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 30,
          ),
        ],
      ),
    );
  }
}
