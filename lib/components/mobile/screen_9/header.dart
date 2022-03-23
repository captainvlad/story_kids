import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/header_bloc.dart';
import 'package:story_kids/res/local_images_strings/locations.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class ProgressScreenHeaderMobile extends StatelessWidget {
  const ProgressScreenHeaderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (context, state) {
        UiManager uiManager = UiManager(context);

        return Container(
          height: uiManager.blockSizeVertical * 10,
          color: secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: uiManager.blockSizeVertical * 5,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
              ),
            ],
          ),
        );
      },
    );
  }
}
