import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body1 extends StatelessWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _controller =
        VideoPlayerController.asset("videos/screen_2_background.mp4");

    _controller.initialize().then(
      (_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
      },
    );

    return SizedBox(
      height: uiManager.blockSizeVertical * 72,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            child: VideoPlayer(_controller),
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: uiManager.blockSizeHorizontal * 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: uiManager.blockSizeHorizontal * 45,
                  child: Text(
                    currentLocale.title,
                    style: uiManager.desktop700Style2,
                  ),
                ),
                SizedBox(
                  height: uiManager.blockSizeVertical * 2.5,
                ),
                RoundedButton(
                  text: Text(
                    currentLocale.free_days_upper,
                    style: uiManager.desktop900Style3,
                  ),
                  uiManager: uiManager,
                  fillColor: secondaryColor,
                  strokeColor: secondaryColor,
                  onPressed: () {
                    NavigationManager.pushNamed(RegisterScreen.path, null);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
