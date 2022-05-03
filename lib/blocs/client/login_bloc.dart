import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/models/client/enums.dart';

class LoginEvent {}

class BackToLoginInput extends LoginEvent {}

class ToggleRememberMeLogin extends LoginEvent {}

class ValidateInput extends LoginEvent {
  final String password;
  final String username;

  ValidateInput({
    required this.username,
    required this.password,
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
    String loginValue,
    String passwordValue,
  ) async {
    version++;

    String loginRes = await AuthManager.logInUser(
      loginValue,
      passwordValue,
      rememberMe,
    );

    if (loginRes == "Success") {
      status = InputStatus.success;
    } else {
      errorMessage = loginRes;
      status = InputStatus.failure;
    }
  }

  Future userExists(
    String loginValue,
    String passwordValue,
  ) async {}

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
    if (event is BackToLoginInput) {
      state.backToMain();
    } else if (event is ValidateInput) {
      yield LogInState(
        version: -2,
        status: InputStatus.progress,
      ); // AAADIP remove later

      await Future.delayed(const Duration(seconds: 2)); // AAADIP remove later

      await state.processInput(
        state.rememberMe,
        event.username,
        event.password,
      );
    } else if (event is ToggleRememberMeLogin) {
      state.toggleRememberMe();
    }

    LogInState st = LogInState();
    st.status = state.status;
    st.errorMessage = state.errorMessage;
    st.rememberMe = state.rememberMe;

    yield st;
  }
}
