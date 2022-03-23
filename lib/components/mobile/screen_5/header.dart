import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/header_bloc.dart';
import 'package:story_kids/res/local_images_strings/locations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class HeaderRegisterMobile extends StatelessWidget {
  const HeaderRegisterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (context, state) {
        AppLocalizations currentLocale = AppLocalizations.of(context)!;
        HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);
        UiManager uiManager = UiManager(context);

        List<PopupMenuEntry<String>> flagItems =
            _hBloc.state.generateFlags(uiManager);

        List<PopupMenuEntry<String>> buttonItems = [
          PopupMenuItem<String>(
            value: 'log_in',
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                uiManager.blockSizeHorizontal * 2,
                uiManager.blockSizeVertical * 1,
                uiManager.blockSizeHorizontal * 2,
                uiManager.blockSizeVertical * 1,
              ),
              child: MaterialButton(
                child: Text(
                  currentLocale.log_in,
                  style: TextStyle(
                    fontSize: uiManager.blockSizeHorizontal * 1.25,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  print("Pressed text 1");
                },
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: 'free_days',
            child: MaterialButton(
              child: Text(
                currentLocale.free_days,
                style: TextStyle(
                  fontSize: uiManager.blockSizeHorizontal * 1.25,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                print("Pressed text 2");
              },
            ),
          ),
        ];

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
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                onSelected: (String result) {
                  print("Selected value: $result");
                },
                itemBuilder: (BuildContext context) => buttonItems,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 2,
                height: uiManager.blockSizeVertical * 5,
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.translate),
                initialValue: _hBloc.state.currentLanguage,
                itemBuilder: (BuildContext context) => flagItems,
                onSelected: (String result) {
                  _hBloc.add(
                    ChangeLanguageEvent(chosenItem: result),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
