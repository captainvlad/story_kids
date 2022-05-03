import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/login_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/client/components/utils_views/failure_input_widget.dart';
import 'package:story_kids/ui/client/components/utils_views/login_body.dart';
import 'package:story_kids/ui/client/components/utils_views/progress_input_widget.dart';
import 'package:story_kids/ui/client/components/utils_views/success_input_widget.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';

class LogInBodyMobile extends StatelessWidget {
  const LogInBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LogInState>(
        builder: (context, state) {
          LoginBloc lbloc = BlocProvider.of<LoginBloc>(context);

          return mapStatusToBody(
            state,
            uiManager,
            lbloc,
            () => lbloc.add(BackToLoginInput()),
            () {
              NavigationManager.backToMain();
              NavigationManager.pushNamed(LibraryScreen.path, null);
            },
            currentLocale,
            usernameController,
            passwordController,
          );
        },
      ),
    );
  }

  Widget mapStatusToBody(
    LogInState state,
    UiManager uiManager,
    LoginBloc lbloc,
    Function() onFailurePressed,
    Function() onSuccessPressed,
    AppLocalizations currentLocale,
    TextEditingController usernameController,
    TextEditingController passwordController,
  ) {
    switch (state.status) {
      case InputStatus.progress:
        return ProgressInputWidget(
          uiManager: uiManager,
          title: currentLocale.log_in_progress,
          mobileVersion: true,
        );
      case InputStatus.inputWait:
        return LoginInputWidget(
          lbloc: lbloc,
          uiManager: uiManager,
          currentLocale: currentLocale,
          usernameController: usernameController,
          passwordController: passwordController,
          mobileVersion: true,
        );
      case InputStatus.failure:
        return FailureInputWidget(
          title: currentLocale.failure,
          subtitle: state.errorMessage,
          buttonLabel: currentLocale.back,
          uiManager: uiManager,
          mobileVersion: true,
          onButtonPressed: onFailurePressed,
        );
      case InputStatus.success:
        return SuccessInputWidget(
          title: currentLocale.success,
          subtitle: currentLocale.log_in_successful,
          buttonLabel: currentLocale.browse,
          uiManager: uiManager,
          mobileVersion: true,
          onButtonPressed: onSuccessPressed,
        );
    }
  }
}
