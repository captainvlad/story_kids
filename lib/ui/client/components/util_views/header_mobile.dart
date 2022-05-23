import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/header_bloc.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/resources/colors.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (context, state) {
        AppLocalizations currentLocale = AppLocalizations.of(context)!;
        HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);
        UiManager uiManager = UiManager(context);

        double logoHeight =
            max(uiManager.mobileSizeUnit * 5, uiManager.blockSizeVertical * 5);

        List<PopupMenuEntry<String>> flagItems =
            _hBloc.state.generateFlags(uiManager);

        List<PopupMenuEntry<String>> buttonItems =
            _hBloc.state.generateButtons(uiManager, currentLocale);

        return Container(
          color: secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    NavigationManager.instance.backToMainScreen();
                  },
                  child: Image.network(
                    LocalContentProvider.instance.headerLogoImage!,
                    height: logoHeight,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              PopupMenuButton<String>(
                tooltip: "",
                iconSize: logoHeight,
                icon: const Icon(Icons.menu),
                itemBuilder: (BuildContext context) => buttonItems,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 2,
                height: uiManager.blockSizeVertical * 5,
              ),
              PopupMenuButton<String>(
                tooltip: "",
                iconSize: logoHeight,
                icon: const Icon(Icons.translate),
                initialValue: _hBloc.state.currentLanguage,
                itemBuilder: (BuildContext context) => flagItems,
                onSelected: (String result) {
                  _hBloc.add(
                    ChangeLanguageEvent(chosenFlag: result),
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
