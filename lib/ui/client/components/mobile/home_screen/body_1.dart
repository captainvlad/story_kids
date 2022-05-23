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

class Body1Mobile extends StatelessWidget {
  const Body1Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardVideoRatio = 35 / 12;
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _controller =
        LocalContentProvider.instance.homeScreenBackground!;

    return SizedBox(
      height: uiManager.blockSizeHorizontal * 100 / standardVideoRatio,
      width: uiManager.blockSizeHorizontal * 100,
      child: Stack(
        alignment: AlignmentDirectional.center,
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
              Text(
                currentLocale.title,
                textAlign: TextAlign.center,
                style: uiManager.mobile700Style3,
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
