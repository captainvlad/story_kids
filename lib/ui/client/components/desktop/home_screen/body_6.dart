import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/chewie_controller.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body6 extends StatelessWidget {
  const Body6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController _videoController1 =
        LocalResourcesManager.homeScreenSample1!;

    VideoPlayerController _videoController2 =
        LocalResourcesManager.homeScreenSample2!;

    return Container(
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
            height: uiManager.blockSizeVertical * 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 30,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: CustomChewie(
                    controller: _videoController1,
                  ),
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 5,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeVertical * 30,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: CustomChewie(
                    controller: _videoController2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
          ),
          RoundedButton(
            text: Text(
              currentLocale.browse,
              style: uiManager.desktop900Style3,
            ),
            uiManager: uiManager,
            fillColor: secondaryColor,
            strokeColor: secondaryColor,
            onPressed: () {
              NavigationManager.pushNamed(LibraryScreen.path, null);
            },
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 6,
          ),
        ],
      ),
    );
  }
}
