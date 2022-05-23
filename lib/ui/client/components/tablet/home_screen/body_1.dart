import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body1Tablet extends StatelessWidget {
  const Body1Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardVideoRatio = 35 / 12;
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _controller =
        LocalContentProvider.instance.homeScreenBackground!;

    return SizedBox(
      height: uiManager.blockSizeHorizontal * 90 / standardVideoRatio,
      width: uiManager.blockSizeHorizontal * 90,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            child: VideoPlayer(_controller),
            width: uiManager.blockSizeHorizontal * 90,
            height: uiManager.blockSizeHorizontal * 90 / standardVideoRatio,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  NavigationManager.instance
                      .pushNamed(RegisterScreen.path, null);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
