import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/divider.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/video_player_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class DetailedInfoBodyMobile extends StatelessWidget {
  final MediaContent content;

  const DetailedInfoBodyMobile({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context, mode: "avg");
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
                width: uiManager.blockSizeVertical * 2,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Text(
                      content.title,
                      style: uiManager.mobile900Style1,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    RoundedButton(
                      text: Text(
                        currentLocale.watch,
                        style: uiManager.mobile700Style6,
                      ),
                      uiManager: uiManager,
                      fillColor: secondaryColor,
                      strokeColor: primaryColor,
                      onPressed: () {
                        NavigationManager.instance.pushNamed(
                          VideoPlayerScreen.path,
                          {"content": content},
                        );
                      },
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      content.brief,
                      style: uiManager.mobile700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      content.meta,
                      style: uiManager.mobile300Style1,
                    ),
                  ],
                ),
              ),
              Image.network(
                content.bookImage,
                width: uiManager.blockSizeHorizontal * 35,
                height: uiManager.blockSizeHorizontal * 40,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              currentLocale.detail,
              style: uiManager.mobile900Style2,
            ),
            standardDivider,
            SizedBox(
              height: uiManager.blockSizeVertical,
            ),
            Text(
              content.title,
              style: uiManager.mobile700Style7,
            ),
            SizedBox(
              height: uiManager.blockSizeVertical,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 80,
              child: Text(
                content.description,
                style: uiManager.mobile300Style1,
              ),
            ),
            SizedBox(
              height: uiManager.blockSizeVertical * 2,
            ),
            SizedBox(
              width: uiManager.blockSizeHorizontal * 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: uiManager.blockSizeHorizontal * 20,
                        child: Text(
                          content.author,
                          style: uiManager.mobile300Style1,
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 2,
                      ),
                      SizedBox(
                        width: uiManager.blockSizeHorizontal * 20,
                        child: Text(
                          content.date,
                          style: uiManager.mobile300Style1,
                        ),
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 2,
                      ),
                      Text(
                        content.age,
                        style: uiManager.mobile300Style1,
                      ),
                      SizedBox(
                        width: uiManager.blockSizeVertical * 2,
                      ),
                      SizedBox(
                        width: uiManager.blockSizeHorizontal * 20,
                        child: Text(
                          content.illustration,
                          style: uiManager.mobile300Style1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Text(
                    content.duration,
                    style: uiManager.mobile300Style1,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 5,
        ),
      ],
    );
  }
}
