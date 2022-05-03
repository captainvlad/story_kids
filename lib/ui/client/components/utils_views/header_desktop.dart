import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/header_bloc.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);
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
                NavigationManager.backToMain();
              },
              child: Image.network(
                LocalResourcesManager.headerLogoImage!,
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
              style: uiManager.desktop900Style3,
            ),
            onPressed: () {
              NavigationManager.pushNamed(LogInScreen.path, null);
            },
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
              style: uiManager.desktop900Style3,
            ),
            onPressed: () {
              NavigationManager.pushNamed(RegisterScreen.path, null);
            },
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
