import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/forgot_password_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/client/components/util_views/failure_input_widget.dart';
import 'package:story_kids/ui/client/components/util_views/forgot_input_widget.dart';
import 'package:story_kids/ui/client/components/util_views/progress_input_widget.dart';
import 'package:story_kids/ui/client/components/util_views/success_input_widget.dart';
import 'package:story_kids/ui/client/screens/universal/home_screen.dart';

class ForgetBodyMobile extends StatelessWidget {
  const ForgetBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context, mode: "avg");
    AppLocalizations currentLocale = AppLocalizations.of(context)!;
    TextEditingController mailController = TextEditingController();

    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          var fbloc = BlocProvider.of<ForgotPasswordBloc>(context);

          return mapStatusToBody(
            state.status,
            uiManager,
            fbloc,
            () => fbloc.add(BackToInputEvent()),
            () => NavigationManager.instance.pushNamed(HomeScreen.path, null),
            currentLocale,
            mailController,
          );
        },
      ),
    );
  }

  Widget mapStatusToBody(
    InputStatus status,
    UiManager uiManager,
    ForgotPasswordBloc fbloc,
    Function() onFailurePressed,
    Function() onSuccessPressed,
    AppLocalizations currentLocale,
    TextEditingController mailController,
  ) {
    switch (status) {
      case InputStatus.progress:
        return ProgressInputWidget(
          uiManager: uiManager,
          title: currentLocale.restoring_progress,
          mobileVersion: true,
        );
      case InputStatus.inputWait:
        return ForgotInputWidget(
          uiManager: uiManager,
          mobileVersion: true,
          fbloc: fbloc,
          currentLocale: currentLocale,
          mailController: mailController,
        );
      case InputStatus.failure:
        return FailureInputWidget(
          title: currentLocale.failure,
          subtitle: fbloc.state.errorMessage,
          buttonLabel: currentLocale.back,
          uiManager: uiManager,
          mobileVersion: true,
          onButtonPressed: onFailurePressed,
        );
      case InputStatus.success:
        return SuccessInputWidget(
          title: currentLocale.success,
          subtitle: currentLocale.restoring_success,
          buttonLabel: currentLocale.back_to_main,
          uiManager: uiManager,
          mobileVersion: true,
          onButtonPressed: onSuccessPressed,
        );
    }
  }
}
