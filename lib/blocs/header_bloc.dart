import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class HeaderEvent {}

class ChangeLanguageEvent extends HeaderEvent {
  late String chosenItem;

  ChangeLanguageEvent({
    required this.chosenItem,
  });
}

class HeaderState extends Equatable {
  late int version;

  String currentLanguage = 'Ukrainian';
  String flagIconPath = 'images/ua_flag.png';
  Locale currentLocale = const Locale('uk', '');

  final Map<String, String> languageFlagMap = {
    'Ukrainian': 'images/ua_flag.png',
    'English': 'images/uk_flag.png',
    'Spanish': 'images/es_flag.png',
    'Russian': 'images/ru_flag.png',
    'Polish': 'images/pl_flag.png',
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
        flagIconPath,
        currentLocale,
      ];

  void setItem(String item) {
    version++;

    currentLocale = Locale(languageCodeMap[item]!, '');
    flagIconPath = languageFlagMap[item]!;
    currentLanguage = item;
  }

  List<DropdownMenuItem<String>> generateItems(UiManager uiManager) {
    version++;

    return languageFlagMap.keys.map(
      (String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(
            width: uiManager.blockSizeHorizontal * 5,
            height: uiManager.blockSizeVertical * 3,
            child: Center(
              child: Image.asset(
                languageFlagMap[value]!,
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  List<PopupMenuEntry<String>> generateFlags(UiManager uiManager) {
    version++;

    return languageFlagMap.keys.map(
      (String value) {
        return PopupMenuItem<String>(
          value: value,
          child: SizedBox(
            width: uiManager.blockSizeHorizontal * 5,
            height: uiManager.blockSizeVertical * 5,
            child: Image.asset(
              languageFlagMap[value]!,
            ),
          ),
        );
      },
    ).toList();
  }

  Widget generateChosenItem(UiManager uiManager) {
    return DropdownMenuItem<String>(
      value: currentLanguage,
      child: SizedBox(
        width: uiManager.blockSizeHorizontal * 5,
        height: uiManager.blockSizeVertical * 3,
        child: Center(
          child: Image.asset(
            languageFlagMap[currentLanguage]!,
          ),
        ),
      ),
    );
  }

  void updateBloc() {
    version++;
  }
}

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(HeaderState());

  @override
  Stream<HeaderState> mapEventToState(HeaderEvent event) async* {
    HeaderState st = HeaderState();
    state.updateBloc();

    if (event is ChangeLanguageEvent) {
      st.setItem(event.chosenItem);
    }

    yield st;
  }
}
