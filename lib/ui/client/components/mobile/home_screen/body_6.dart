import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body6Mobile extends StatelessWidget {
  const Body6Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController1 =
        LocalResourcesManager.homeScreenSample1!;

    VideoPlayerController _videoController2 =
        LocalResourcesManager.homeScreenSample2!;

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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(
            LocalResourcesManager.homeScreen8!,
          ).image,
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
          RoundedButton(
            text: Text(
              currentLocale.browse,
              style: uiManager.mobile900Style5,
            ),
            uiManager: uiManager,
            fillColor: primaryColor,
            strokeColor: primaryColor,
            onPressed: () {
              NavigationManager.pushNamed(LibraryScreen.path, null);
            },
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 3,
          ),
        ],
      ),
    );
  }
}
