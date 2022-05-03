import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/utils_views/divider.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/video_player_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class DetailedInfoBodyDesktop extends StatelessWidget {
  final MediaContent content;

  const DetailedInfoBodyDesktop({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(content.lightBackground).image,
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: uiManager.blockSizeHorizontal * 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content.title,
                      style: uiManager.desktop900Style1,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.watch,
                        style: uiManager.desktop900Style3,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: primaryColor,
                      onPressed: () {
                        NavigationManager.pushNamed(
                          VideoPlayerScreen.path,
                          {"contentPath": content.contentPath},
                        );
                      },
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      content.brief,
                      style: uiManager.desktop700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 4,
                    ),
                    Text(
                      content.meta,
                      style: uiManager.desktop300Style1,
                    ),
                  ],
                ),
              ),
              Image.network(
                content.bookImage,
                width: uiManager.blockSizeHorizontal * 25,
                height: uiManager.blockSizeHorizontal * 25,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 5,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentLocale.detail,
                style: uiManager.desktop900Style2,
              ),
              standardDivider,
              SizedBox(
                height: uiManager.blockSizeVertical,
              ),
              Text(
                content.title,
                style: uiManager.desktop700Style7,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 30,
                    child: Text(
                      content.description,
                      style: uiManager.desktop300Style1,
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 2,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content.author,
                          style: uiManager.desktop300Style1,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical,
                        ),
                        Text(
                          content.date,
                          style: uiManager.desktop300Style1,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical,
                        ),
                        Text(
                          content.age,
                          style: uiManager.desktop300Style1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 2,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content.illustration,
                          style: uiManager.desktop300Style1,
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical,
                        ),
                        Text(
                          content.duration,
                          style: uiManager.desktop300Style1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
        ),
      ],
    );
  }
}
