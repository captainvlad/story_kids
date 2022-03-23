import 'dart:math';

import 'package:flutter/material.dart';
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
      height: min(
        uiManager.blockSizeVertical * 35,
        uiManager.blockSizeHorizontal * 35,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            child: VideoPlayer(_controller),
            width: double.infinity,
            height: min(
              uiManager.blockSizeVertical * 35,
              uiManager.blockSizeHorizontal * 35,
            ),
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
                            fontSize: min(
                              uiManager.blockSizeHorizontal * 5,
                              uiManager.blockSizeVertical * 5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 5,
                      ),
                      MaterialButton(
                        onPressed: () {
                          print("Button pressed");
                        },
                        child: Text(
                          currentLocale.free_days_upper,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: min(
                              uiManager.blockSizeHorizontal * 2.5,
                              uiManager.blockSizeVertical * 2.5,
                            ),
                            fontWeight: FontWeight.w900,
                            color: primaryColor,
                          ),
                        ),
                        minWidth: uiManager.blockSizeHorizontal * 14,
                        height: uiManager.blockSizeVertical * 8,
                        color: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
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
