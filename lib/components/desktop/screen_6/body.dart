import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fading_images_slider/fading_images_slider.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibraryBodyDesktop extends StatelessWidget {
  const LibraryBodyDesktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;
    final CarouselController _controller = CarouselController();
    UiManager uiManager = UiManager(context);
    int _current = 0;

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final CarouselController controller = CarouselController();
    final List<Widget> imageSliders = imgList
        .map(
          (item) => ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: Image.network(
              item,
            ),
          ),
        )
        .toList();

    final Widget carousele = SizedBox(
      height: uiManager.blockSizeVertical * 80,
      width: uiManager.blockSizeHorizontal * 80,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CarouselSlider(
              items: imageSliders,
              carouselController: controller,
              options: CarouselOptions(
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  print("Current: $index");
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                controller.previousPage();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                controller.nextPage();
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // carousele,
        SizedBox(
          width: uiManager.blockSizeHorizontal * 20,
          height: uiManager.blockSizeVertical * 20,
          child: FadingImagesSlider(
            textAlignment: Alignment.center,
            images: imageSliders,
            texts: imageSliders,
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 1.5,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 80,
          height: uiManager.blockSizeVertical * 110,
          color: Colors.green[800],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentLocale.age,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
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
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
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
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                  Image.asset(
                    "images/skids_15.jpg",
                    width: uiManager.blockSizeHorizontal * 20,
                    height: uiManager.blockSizeVertical * 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
