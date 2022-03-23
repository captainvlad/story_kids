import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/header_bloc.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/res/local_images_strings/locations.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);
    String? currentRoute = ModalRoute.of(context)!.settings.name;
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

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
                print("Refreshing screen");
                NavigationManager.refreshScreen(currentRoute!);
              },
              child: Image.asset(
                logo,
                height: uiManager.blockSizeVertical * 5,
              ),
            ),
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 35,
          ),
          RoundedButton(
            text: Text(
              currentLocale.log_in,
              style: TextStyle(
                fontSize: uiManager.blockSizeHorizontal * 1.25,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            onPressed: () => print("Header log in pressed"),
            fillColor: secondaryColor,
            strokeColor: primaryColor,
            uiManager: uiManager,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 3,
          ),
          RoundedButton(
            text: Text(
              currentLocale.free_days,
              style: TextStyle(
                fontSize: uiManager.blockSizeHorizontal * 1.25,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            onPressed: () => print("Header free days pressed"),
            fillColor: secondaryColor,
            strokeColor: secondaryColor,
            uiManager: uiManager,
          ),
          SizedBox(
            width: uiManager.blockSizeHorizontal * 3,
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.translate,
              color: primaryColor,
              size: uiManager.blockSizeVertical * 4,
            ),
            initialValue: _hBloc.state.currentLanguage,
            itemBuilder: (BuildContext context) =>
                _hBloc.state.generateFlags(uiManager),
            onSelected: (String result) {
              _hBloc.add(
                ChangeLanguageEvent(chosenItem: result),
              );
            },
          ),
        ],
      ),
    );
  }
}
