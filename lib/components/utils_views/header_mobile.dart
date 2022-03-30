import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/header_bloc.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/local_images_strings/locations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/login_screen.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({Key? key}) : super(key: key);

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
            value: "log_in",
            child: RoundedButton(
              text: Text(
                currentLocale.log_in,
                style: uiManager.mobile700Style6,
              ),
              uiManager: uiManager,
              fillColor: secondaryColor,
              strokeColor: primaryColor,
              onPressed: () {
                NavigationManager.pushNamed(LogInScreen.path, null);
              },
            ),
          ),
          PopupMenuItem<String>(
            value: "free_days",
            child: RoundedButton(
              text: Text(
                currentLocale.free_days,
                style: uiManager.mobile700Style6,
              ),
              uiManager: uiManager,
              fillColor: secondaryColor,
              strokeColor: primaryColor,
              onPressed: () {
                NavigationManager.pushNamed(RegisterScreen.path, null);
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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    NavigationManager.backToMain();
                  },
                  child: Image.asset(
                    logo,
                    height: uiManager.blockSizeVertical * 5,
                  ),
                ),
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 40,
              ),
              PopupMenuButton<String>(
                onSelected: null,
                icon: const Icon(Icons.menu),
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
