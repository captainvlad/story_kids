import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/models/client/enums.dart';

class ForgotPasswordEvent {}

class BackToInputEvent extends ForgotPasswordEvent {}

class ProcessInputEvent extends ForgotPasswordEvent {
  final String input;
  final AppLocalizations currentLocale;

  ProcessInputEvent({required this.input, required this.currentLocale});
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

    if (inputValue.isEmpty) {
      status = InputStatus.failure;
      errorMessage = currentLocale.empty_input;
    } else if (!validEmail(inputValue)) {
      status = InputStatus.failure;
      errorMessage = currentLocale.invalid_mail;
    } else if (!await userExists(inputValue)) {
      status = InputStatus.failure;
      errorMessage = currentLocale.user_not_exists;
    } else {
      status = InputStatus.success;
    }
  }

  void backToInput() {
    version++;

    errorMessage = "";
    status = InputStatus.inputWait;
  }

  bool validEmail(String inputValue) {
    final RegExp validEmailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return validEmailRegExp.hasMatch(inputValue);
  }

  Future<bool> userExists(String mailValue) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      List<String> userList = await auth.fetchSignInMethodsForEmail(mailValue);

      return userList.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState());

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ProcessInputEvent) {
      yield ForgotPasswordState(
        errorMessage: state.errorMessage,
        status: InputStatus.progress,
      );

      await Future.delayed(const Duration(seconds: 2)); // AAADIP remove later
      await state.processInput(event.input, event.currentLocale);

      yield ForgotPasswordState(
        errorMessage: state.errorMessage,
        status: InputStatus.failure,
      );
    } else if (event is BackToInputEvent) {
      state.backToInput();
    }

    ForgotPasswordState st = ForgotPasswordState(
      errorMessage: state.errorMessage,
      status: state.status,
    );

    yield st;
  }
}
