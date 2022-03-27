import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:video_player/video_player.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoBodyMobile extends StatelessWidget {
  const VideoBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController1 =
        VideoPlayerController.asset("videos/screen_1_background.mp4");

    ChewieController _chewieController1 = ChewieController(
      videoPlayerController: _videoController1,
      aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        print(errorMessage);

        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          RoundedButton(
            text: Text(
              currentLocale.back,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: uiManager.mobileSizeUnit * 2.5,
                fontWeight: FontWeight.w900,
                color: secondaryColor,
              ),
            ),
            uiManager: uiManager,
            fillColor: primaryColor,
            strokeColor: primaryColor,
            onPressed: () {},
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            height: uiManager.blockSizeVertical * 40,
            child: AspectRatio(
              aspectRatio: 10,
              child: Chewie(
                controller: _chewieController1,
              ),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 10,
          )
        ],
      ),
    );
  }
}
