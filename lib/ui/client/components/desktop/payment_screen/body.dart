import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/payment_bloc.dart';
import 'package:story_kids/managers/client/navigation_manager.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/client/components/util_views/failure_input_widget.dart';
import 'package:story_kids/ui/client/components/desktop/payment_screen/payment_input_widget_desktop.dart';
import 'package:story_kids/ui/client/components/util_views/progress_input_widget.dart';
import 'package:story_kids/ui/client/components/util_views/success_input_widget.dart';
import 'package:story_kids/ui/client/screens/universal/library_screen.dart';

class PaymentBodyDesktop extends StatelessWidget {
  const PaymentBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    var paymentWidgetKey = GlobalKey<FormState>();
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return BlocProvider<PaymentBloc>(
      create: (context) => PaymentBloc(),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          PaymentBloc _pBloc = BlocProvider.of<PaymentBloc>(context);

          return mapStatusToBody(
            state,
            uiManager,
            _pBloc,
            () => _pBloc.add(BackToInputPaymentEvent()),
            () =>
                NavigationManager.instance.pushNamed(LibraryScreen.path, null),
            paymentWidgetKey,
            currentLocale,
          );
        },
      ),
    );
  }

  Widget mapStatusToBody(
    PaymentState state,
    UiManager uiManager,
    PaymentBloc paymentBloc,
    Function() onFailurePressed,
    Function() onSuccessPressed,
    GlobalKey<FormState> formKey,
    AppLocalizations currentLocale,
  ) {
    switch (state.status) {
      case InputStatus.progress:
        return ProgressInputWidget(
          uiManager: uiManager,
          title: currentLocale.log_in_progress,
          mobileVersion: false,
        );
      case InputStatus.inputWait:
        return PaymentInputWidgetDesktop(
          currentLocale: currentLocale,
          formKey: formKey,
          uiManager: uiManager,
          pBloc: paymentBloc,
        );
      case InputStatus.failure:
        return FailureInputWidget(
          title: currentLocale.failure,
          subtitle: state.errorMessage,
          buttonLabel: currentLocale.back,
          uiManager: uiManager,
          mobileVersion: false,
          onButtonPressed: onFailurePressed,
        );
      case InputStatus.success:
        return SuccessInputWidget(
          title: currentLocale.success,
          subtitle: currentLocale.log_in_successful,
          buttonLabel: currentLocale.browse,
          uiManager: uiManager,
          mobileVersion: false,
          onButtonPressed: onSuccessPressed,
        );
    }
  }
}
