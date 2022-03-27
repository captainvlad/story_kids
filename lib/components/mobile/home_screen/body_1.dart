import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body1Mobile extends StatelessWidget {
  const Body1Mobile({Key? key}) : super(key: key);

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
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: secondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: uiManager.mobileSizeUnit * 5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 5,
                      ),
                      RoundedButton(
                        text: Text(
                          currentLocale.free_days_upper,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: uiManager.mobileSizeUnit * 2.5,
                            fontWeight: FontWeight.w900,
                            color: primaryColor,
                          ),
                        ),
                        uiManager: uiManager,
                        fillColor: secondaryColor,
                        strokeColor: secondaryColor,
                        onPressed: () {},
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