import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/chewie_controller.dart';

class Body6 extends StatelessWidget {
  const Body6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController1 =
        VideoPlayerController.asset("videos/screen_1_background.mp4");

    VideoPlayerController _videoController2 =
        VideoPlayerController.asset("videos/screen_1_background.mp4");

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/skids_12.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 30,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: CustomChewie(
                    controller: _videoController1,
                  ),
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 5,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 30,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: CustomChewie(
                    controller: _videoController2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
          ),
          RoundedButton(
            text: Text(
              currentLocale.browse,
              style: uiManager.desktop900Style3,
            ),
            uiManager: uiManager,
            fillColor: secondaryColor,
            strokeColor: secondaryColor,
            onPressed: () {
              NavigationManager.pushNamed(ProgressScreen.path, null);
            },
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
          ),
        ],
      ),
    );
  }
}
