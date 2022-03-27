import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/header_bloc.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/desktop/already_logged.dart';
import 'package:story_kids/screens/desktop/detailed_info_screen.dart';
import 'package:story_kids/screens/desktop/forgot_password_screen.dart';
import 'package:story_kids/screens/desktop/home_screen.dart';
import 'package:story_kids/screens/desktop/library_screen.dart';
import 'package:story_kids/screens/desktop/login_screen.dart';
import 'package:story_kids/screens/desktop/register_screen.dart';
import 'package:story_kids/screens/desktop/video_player.dart';
import 'package:story_kids/screens/mobile/already_logged.dart';
import 'package:story_kids/screens/mobile/detailed_info_screen.dart';
import 'package:story_kids/screens/mobile/forgot_password_screen.dart';
import 'package:story_kids/screens/mobile/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/screens/mobile/library_screen.dart';
import 'package:story_kids/screens/mobile/login_screen.dart';
import 'package:story_kids/screens/mobile/register_screen.dart';
import 'package:story_kids/screens/mobile/progress_screen.dart';
import 'package:story_kids/screens/mobile/video_player.dart';
import 'package:story_kids/screens/tablet/library_screen.dart';
import 'package:story_kids/screens/universal/already_logged.dart';
import 'package:story_kids/screens/universal/library_screen.dart';
import 'package:story_kids/screens/universal/login_screen.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/utilities/navigation_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HeaderBloc>(
      create: (context) => HeaderBloc(),
      child: BlocBuilder<HeaderBloc, HeaderState>(
        builder: (context, state) {
          HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);

          return MaterialApp(
            title: 'Story Kids',
            locale: _hBloc.state.currentLocale,
            home: const AlreadyLoggedScreenMobile(),
            // home: const LogLogInScreenDesktop(),
            navigatorKey: NavigationManager.navigatorKey,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: primaryColor,
                  ),
            ),
          );
        },
      ),
    );
  }
}
