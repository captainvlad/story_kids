import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/models/media_content.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoBodyMobile extends StatelessWidget {
  final String contentPath;

  const VideoBodyMobile({
    Key? key,
    required this.contentPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController =
        VideoPlayerController.network(contentPath);

    ChewieController _chewieController1 = ChewieController(
      aspectRatio: 16 / 9,
      videoPlayerController: _videoController,
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
              style: uiManager.mobile900Style4,
            ),
            uiManager: uiManager,
            fillColor: secondaryColor,
            strokeColor: secondaryColor,
            onPressed: () {
              NavigationManager.popScreen();
            },
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
