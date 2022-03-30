import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/chewie_controller.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoBodyDesktop extends StatelessWidget {
  const VideoBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController1 =
        VideoPlayerController.asset("videos/screen_1_background.mp4");

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: uiManager.blockSizeHorizontal * 14,
              height: uiManager.blockSizeVertical * 10,
            ),
            RoundedButton(
              text: Text(
                currentLocale.back,
                style: uiManager.desktop900Style3,
              ),
              uiManager: uiManager,
              fillColor: secondaryColor,
              strokeColor: secondaryColor,
              onPressed: () {
                NavigationManager.popScreen();
              },
            ),
          ],
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 80,
          height: uiManager.blockSizeVertical * 80,
          child: CustomChewie(
            controller: _videoController1,
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
        )
      ],
    );
  }
}
