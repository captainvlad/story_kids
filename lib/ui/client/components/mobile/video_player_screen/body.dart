import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/chewie_controller.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoBodyMobile extends StatelessWidget {
  final String contentPath;

  const VideoBodyMobile({
    Key? key,
    required this.contentPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardVideoRatio = 16 / 9;
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController =
        VideoPlayerController.network(contentPath);

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
              NavigationManager.instance.popScreen();
            },
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 80,
            height: uiManager.blockSizeHorizontal * 80 / standardVideoRatio,
            child: AspectRatio(
              aspectRatio: 10,
              child: CustomChewie(
                controller: _videoController,
                aspectRatio: standardVideoRatio,
                autoInitialize: false,
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
