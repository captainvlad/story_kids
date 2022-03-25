import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/carousele_item.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/carousele.dart';
import 'package:story_kids/components/utils_views/preview_card.dart';

class LibraryBodyDesktop extends StatelessWidget {
  const LibraryBodyDesktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;
    UiManager uiManager = UiManager(context);

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final List<Widget> imageSliders = imgList
        .map(
          (item) => CarouseleItem(
            uiManager: uiManager,
            imagePath: "assets/images/not_afraid_background.jpg",
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Carousele(
          height: uiManager.blockSizeVertical * 60,
          width: double.infinity,
          children: imageSliders,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
        SizedBox(
          width: uiManager.blockSizeHorizontal * 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentLocale.age_flat,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                currentLocale.animals,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                currentLocale.brave,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal,
                  ),
                  PreviewCard(
                    width: uiManager.blockSizeHorizontal * 14,
                    height: uiManager.blockSizeVertical * 17,
                    onTap: () {
                      print("CardView tapped");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
