import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/remote_content_provider.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/client/screens/universal/login_screen.dart';
import 'package:story_kids/ui/client/screens/universal/progress_screen.dart';
import 'package:story_kids/ui/client/screens/universal/register_screen.dart';
import 'package:story_kids/ui/resources/colors.dart';

class HeaderEvent {}

class ChangeLanguageEvent extends HeaderEvent {
  final String chosenFlag;
  ChangeLanguageEvent({required this.chosenFlag});
}

class HeaderState extends Equatable {
  late int version;

  String currentLanguage = 'Ukrainian';
  Locale currentLocale = const Locale('uk', '');

  Map<String, String> languageFlagMap = {
    'Spanish': LocalContentProvider.instance.localizationFlags?[0] ?? "",
    'Polish': LocalContentProvider.instance.localizationFlags?[1] ?? "",
    'Russian': LocalContentProvider.instance.localizationFlags?[2] ?? "",
    'Ukrainian': LocalContentProvider.instance.localizationFlags?[3] ?? "",
    'English': LocalContentProvider.instance.localizationFlags?[4] ?? "",
  };

  final Map<String, String> languageCodeMap = {
    'Ukrainian': 'uk',
    'English': 'en',
    'Spanish': 'es',
    'Russian': 'ru',
    'Polish': 'pl',
  };

  HeaderState({
    this.version = 0,
    this.currentLocale = const Locale('uk', ''),
  });

  @override
  List<Object?> get props => [
        version,
        currentLocale,
      ];

  void setLanguage(String item) {
    version++;

    currentLocale = Locale(languageCodeMap[item] ?? 'uk', '');
    currentLanguage = item;

    RemoteContentProvider.instance.releaseResources();
    RemoteContentProvider.instance.localeCode = languageCodeMap[item] ?? 'uk';
    NavigationManager.instance.backToMainScreen();
  }

  void _initFlags() {
    languageFlagMap = {
      'Spanish': LocalContentProvider.instance.localizationFlags?[0] ?? "",
      'Polish': LocalContentProvider.instance.localizationFlags?[1] ?? "",
      'Russian': LocalContentProvider.instance.localizationFlags?[2] ?? "",
      'Ukrainian': LocalContentProvider.instance.localizationFlags?[3] ?? "",
      'English': LocalContentProvider.instance.localizationFlags?[4] ?? "",
    };
  }

  List<PopupMenuEntry<String>> generateFlags(UiManager uiManager) {
    version++;
    _initFlags();

    return languageFlagMap.keys
        .map(
          (String language) => PopupMenuItem<String>(
            value: language,
            child: SizedBox(
              width: uiManager.blockSizeHorizontal * 5,
              height: uiManager.blockSizeVertical * 5,
              child: Image.network(languageFlagMap[language] ?? ''),
            ),
          ),
        )
        .toList();
  }

  List<PopupMenuEntry<String>> generateButtons(
    UiManager uiManager,
    AppLocalizations currentLocale,
  ) {
    version++;

    return [
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
            NavigationManager.instance.pushNamed(LogInScreen.path, null);
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
            NavigationManager.instance.pushNamed(RegisterScreen.path, null);
          },
        ),
      ),
    ];
  }

  Future<void> initResources() async {
    NavigationManager.instance.pushNamed(ProgressScreen.path, null);
    await LocalContentProvider.instance.initResources();
    NavigationManager.instance.popScreen();
  }
}

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(HeaderState());

  @override
  Stream<HeaderState> mapEventToState(HeaderEvent event) async* {
    HeaderState newState = HeaderState();

    switch (event.runtimeType) {
      case ChangeLanguageEvent:
        event as ChangeLanguageEvent;
        newState.setLanguage(event.chosenFlag);
        break;
    }

    yield newState;
  }
}
