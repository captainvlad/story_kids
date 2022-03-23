import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body6Mobile extends StatelessWidget {
  const Body6Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController1 =
        VideoPlayerController.asset("videos/screen_1_background.mp4");

    VideoPlayerController _videoController2 =
        VideoPlayerController.asset("videos/screen_1_background.mp4");

    ChewieController _chewieController1 = ChewieController(
      videoPlayerController: _videoController1,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
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

    ChewieController _chewieController2 = ChewieController(
      videoPlayerController: _videoController2,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
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

    return Container(
      width: double.infinity,
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
            height: uiManager.blockSizeVertical * 3,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 90,
                height: uiManager.blockSizeVertical * 28,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: Chewie(
                    controller: _chewieController1,
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeHorizontal * 5,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 90,
                height: uiManager.blockSizeVertical * 28,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: Chewie(
                    controller: _chewieController2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
          MaterialButton(
            onPressed: () {
              print("Button 3 pressed");
            },
            child: Text(
              currentLocale.browse,
              style: TextStyle(
                color: secondaryColor,
                fontFamily: "Montserrat",
                fontSize: min(
                  uiManager.blockSizeHorizontal * 2.5,
                  uiManager.blockSizeVertical * 2.5,
                ),
                fontWeight: FontWeight.w900,
              ),
            ),
            minWidth: uiManager.blockSizeHorizontal * 14,
            height: uiManager.blockSizeVertical * 6,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
        ],
      ),
    );
  }
}
