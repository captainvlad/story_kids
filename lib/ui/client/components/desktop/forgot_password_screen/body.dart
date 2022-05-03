import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/forgot_password_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/client/components/utils_views/failure_input_widget.dart';
import 'package:story_kids/ui/client/components/utils_views/forgot_password_body.dart';
import 'package:story_kids/ui/client/components/utils_views/progress_input_widget.dart';
import 'package:story_kids/ui/client/components/utils_views/success_input_widget.dart';

class ForgetBodyDesktop extends StatelessWidget {
  const ForgetBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
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
            () => fbloc.add(BackToInputEvent()),
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
          title: "AAADIP progress title",
          mobileVersion: false,
        );
      case InputStatus.inputWait:
        return ForgotPasswordBody(
          uiManager: uiManager,
          mobileVersion: false,
          fbloc: fbloc,
          currentLocale: currentLocale,
          mailController: mailController,
        );
      case InputStatus.failure:
        return FailureInputWidget(
          title: "AAADIP title",
          subtitle: "AAADIP subtitle",
          buttonLabel: "button label",
          uiManager: uiManager,
          mobileVersion: false,
          onButtonPressed: onFailurePressed,
        );
      case InputStatus.success:
        return SuccessInputWidget(
          title: "AAADIP title",
          subtitle: "AAADIP subtitle",
          buttonLabel: "AAADIP button label",
          uiManager: uiManager,
          mobileVersion: false,
          onButtonPressed: onSuccessPressed,
        );
    }
  }
}
