import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body1 extends StatelessWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardVideoRatio = 35 / 12;
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _controller =
        LocalContentProvider.instance.homeScreenBackground!;

    return SizedBox(
      height: uiManager.blockSizeHorizontal * 100 / standardVideoRatio,
      width: uiManager.blockSizeHorizontal * 100,
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
                    NavigationManager.instance
                        .pushNamed(RegisterScreen.path, null);
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
