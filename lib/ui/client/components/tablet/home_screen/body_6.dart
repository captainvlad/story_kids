import 'package:flutter/material.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/chewie_controller.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body6Tablet extends StatelessWidget {
  const Body6Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double standardVideoRatio = 16 / 9;
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    VideoPlayerController? _videoController1 =
        LocalContentProvider.instance.homeScreenSample1;

    VideoPlayerController? _videoController2 =
        LocalContentProvider.instance.homeScreenSample2;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(
            LocalContentProvider.instance.homeScreen8!,
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
                width: uiManager.mobileSizeUnit * 60 * standardVideoRatio,
                height: uiManager.mobileSizeUnit * 60,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: CustomChewie(
                    key: const Key("1-tablet"),
                    controller: _videoController1!,
                    aspectRatio: standardVideoRatio,
                  ),
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeHorizontal * 5,
              ),
              SizedBox(
                width: uiManager.mobileSizeUnit * 60 * standardVideoRatio,
                height: uiManager.mobileSizeUnit * 60,
                child: AspectRatio(
                  aspectRatio: 10,
                  child: CustomChewie(
                    key: const Key("2-tablet"),
                    controller: _videoController2!,
                    aspectRatio: standardVideoRatio,
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
              NavigationManager.instance.pushNamed(LibraryScreen.path, null);
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
