import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/input_validation_manager.dart';
import 'package:story_kids/models/client/enums.dart';

class LoginEvent {}

class BackToLoginInput extends LoginEvent {}

class ToggleRememberMe extends LoginEvent {}

class ValidateInput extends LoginEvent {
  final String email;
  final String password;
  final bool rememberMe;
  final AppLocalizations currentLocale;

  ValidateInput({
    required this.email,
    required this.password,
    required this.rememberMe,
    required this.currentLocale,
  });
}

class LogInState extends Equatable {
  int version;
  bool rememberMe;
  InputStatus status;
  String errorMessage;

  LogInState({
    this.version = 0,
    this.errorMessage = "",
    this.rememberMe = false,
    this.status = InputStatus.inputWait,
  });

  @override
  List<Object?> get props => [
        version,
        rememberMe,
        errorMessage,
      ];

  Future processInput(
    bool rememberMe,
    String emailValue,
    String passwordValue,
    AppLocalizations currentLocale,
  ) async {
    version++;

    var check = await InputValidationManager.validateLogin(
      emailValue,
      passwordValue,
      currentLocale,
    );

    if (!check["valid"]) {
      status = InputStatus.failure;
      errorMessage = check["description"];
    } else {
      String response = await AuthManager.instance.logInUser(
        emailValue,
        passwordValue,
        rememberMe,
      );

      status =
          response == "Success" ? InputStatus.success : InputStatus.failure;

      errorMessage = response == "Success" ? "" : response;
    }
  }

  void backToMain() {
    version++;
    status = InputStatus.inputWait;
  }

  void toggleRememberMe() {
    version++;
    rememberMe = !rememberMe;
  }
}

class LoginBloc extends Bloc<LoginEvent, LogInState> {
  LoginBloc() : super(LogInState());

  @override
  Stream<LogInState> mapEventToState(LoginEvent event) async* {
    switch (event.runtimeType) {
      case BackToLoginInput:
        state.backToMain();
        break;

      case ValidateInput:
        yield LogInState(
            version: state.version--, status: InputStatus.progress);

        event as ValidateInput;
        await state.processInput(
          state.rememberMe,
          event.email,
          event.password,
          event.currentLocale,
        );

        break;

      case ToggleRememberMe:
        state.toggleRememberMe();
        break;
    }

    LogInState newState = LogInState(
      errorMessage: state.errorMessage,
      rememberMe: state.rememberMe,
      status: state.status,
    );

    yield newState;
  }
}
