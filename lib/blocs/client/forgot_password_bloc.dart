import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/input_validation_manager.dart';
import 'package:story_kids/models/client/enums.dart';

class ForgotPasswordEvent {}

class BackToInputEvent extends ForgotPasswordEvent {}

class ProcessInputEvent extends ForgotPasswordEvent {
  final String input;
  final AppLocalizations currentLocale;

  ProcessInputEvent({
    required this.input,
    required this.currentLocale,
  });
}

class ForgotPasswordState extends Equatable {
  late int version;
  InputStatus status;
  String errorMessage;

  ForgotPasswordState({
    this.version = 0,
    this.errorMessage = "",
    this.status = InputStatus.inputWait,
  });

  @override
  List<Object?> get props => [
        version,
      ];

  Future processInput(
    String inputValue,
    AppLocalizations currentLocale,
  ) async {
    version++;
    var check = await InputValidationManager.validateForgotPassword(
      inputValue,
      currentLocale,
    );

    if (check["valid"]) {
      await AuthManager.instance.restoreUserPassword(inputValue);
      status = InputStatus.success;
    } else if (!check["valid"] && check["description"] == "Invalid input") {
      status = InputStatus.failure;
      errorMessage = currentLocale.invalid_mail;
    } else if (!check["valid"] && check["description"] == "No user") {
      status = InputStatus.failure;
      errorMessage = currentLocale.user_not_exists;
    }
  }

  void backToInput() {
    version++;
    errorMessage = "";
    status = InputStatus.inputWait;
  }
}

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState());

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    switch (event.runtimeType) {
      case ProcessInputEvent:
        yield ForgotPasswordState(
            version: state.version--, status: InputStatus.progress);

        event as ProcessInputEvent;
        await state.processInput(event.input, event.currentLocale);
        break;

      case BackToInputEvent:
        state.backToInput();
        break;
    }

    ForgotPasswordState newState = ForgotPasswordState(
        errorMessage: state.errorMessage, status: state.status);

    yield newState;
  }
}
