import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body1Mobile extends StatelessWidget {
  const Body1Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _controller =
        LocalResourcesManager.homeScreenBackground!;

    _controller.initialize().then(
      (_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
      },
    );

    return SizedBox(
      height: uiManager.mobileSizeUnit * 35,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            child: VideoPlayer(_controller),
            width: double.infinity,
            height: uiManager.mobileSizeUnit * 35,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: uiManager.blockSizeHorizontal * 35,
                        child: Text(
                          currentLocale.title,
                          style: uiManager.mobile700Style3,
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 5,
                      ),
                      RoundedButton(
                        text: Text(
                          currentLocale.free_days_upper,
                          style: uiManager.mobile900Style4,
                        ),
                        uiManager: uiManager,
                        fillColor: secondaryColor,
                        strokeColor: secondaryColor,
                        onPressed: () {
                          NavigationManager.pushNamed(
                              RegisterScreen.path, null);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
