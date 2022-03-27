import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_kids/components/utils_views/preview_card.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/carousele.dart';

class LibraryBodyTablet extends StatelessWidget {
  const LibraryBodyTablet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
          width: double.infinity,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        Container(
          width: double.infinity,
          color: Colors.green[800],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Carousele(
                height: uiManager.mobileSizeUnit * 30,
                width: double.infinity,
                uiManager: uiManager,
                filePaths: imgList,
                mobile: true,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              Text(
                currentLocale.age_flat,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: uiManager.mobileSizeUnit * 4,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              Text(
                currentLocale.animals,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: uiManager.mobileSizeUnit * 4,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              Text(
                currentLocale.brave,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: uiManager.mobileSizeUnit * 4,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                      PreviewCard(
                        width: uiManager.blockSizeHorizontal * 35,
                        height: uiManager.blockSizeVertical * 20,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
