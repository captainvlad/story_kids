import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/backend_services/AuthManager.dart';
import 'package:story_kids/backend_services/ContentProvider.dart';
import 'package:story_kids/blocs/header_bloc.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/screens/mobile/already_logged.dart';
import 'package:story_kids/screens/universal/home_screen.dart';
import 'package:story_kids/screens/universal/already_logged.dart';
import 'package:story_kids/screens/universal/detailed_info_screen.dart';
import 'package:story_kids/screens/universal/library_screen.dart';
import 'package:story_kids/screens/universal/login_screen.dart';
import 'package:story_kids/screens/universal/progress_screen.dart';
import 'package:story_kids/screens/universal/register_screen.dart';
import 'package:story_kids/screens/universal/video_player.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'screens/universal/forgot_password_screen.dart';

void main() async {
  await AuthManager.initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData defaultTheme = ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primaryColor,
          ),
    );

    const String appName = "Story Kids";

    return BlocProvider<HeaderBloc>(
      create: (context) => HeaderBloc(),
      child: BlocBuilder<HeaderBloc, HeaderState>(
        builder: (context, state) {
          HeaderBloc _hBloc = BlocProvider.of<HeaderBloc>(context);

          return MaterialApp(
            title: appName,
            theme: defaultTheme,
            initialRoute: HomeScreen.path,
            locale: _hBloc.state.currentLocale,
            home: const AlreadyLoggedScreenMobile(),
            navigatorKey: NavigationManager.navigatorKey,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routes: {
              HomeScreen.path: (context) => const HomeScreen(),
              LogInScreen.path: (context) => const LogInScreen(),
              LibraryScreen.path: (context) => const LibraryScreen(),
              ProgressScreen.path: (context) => const ProgressScreen(),
              RegisterScreen.path: (context) => const RegisterScreen(),
              VideoPlayerScreen.path: (context) => const VideoPlayerScreen(),
              DetailedInfoScreen.path: (context) => const DetailedInfoScreen(),
              AlreadyLoggedScreen.path: (context) =>
                  const AlreadyLoggedScreen(),
              ForgotPasswordScreen.path: (context) =>
                  const ForgotPasswordScreen(),
            },
          );
        },
      ),
    );
  }
}
