import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/managers/client/auth_manager.dart';
import 'package:story_kids/managers/client/input_validation_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentEvent {}

class ChangePaymentMethodEvent extends PaymentEvent {
  final int index;
  ChangePaymentMethodEvent({required this.index});
}

class BackToInputPaymentEvent extends PaymentEvent {}

class ConfirmPaymentEvent extends PaymentEvent {
  final AppLocalizations currentLocale;
  ConfirmPaymentEvent({required this.currentLocale});
}

class ChangeInputEvent extends PaymentEvent {
  final String newCvvCode;
  final String newCardNumber;
  final String newExpiryDate;
  final String newCardHolderName;

  ChangeInputEvent({
    required this.newCvvCode,
    required this.newCardNumber,
    required this.newExpiryDate,
    required this.newCardHolderName,
  });
}

class PaymentState extends Equatable {
  int version;

  PaymentTools paymentTool;
  late List<bool> isSelected;

  final List<PaymentTools> paymentTools = [
    PaymentTools.stripe,
    PaymentTools.liqPay,
  ];

  final List<String> paymentToolsStrings = [
    "Stripe",
    "LiqPay",
  ];

  String cvvCode;
  String cardNumber;
  String expiryDate;
  String errorMessage;
  String cardHolderName;
  InputStatus status;

  PaymentState({
    this.version = 0,
    this.cvvCode = '',
    this.expiryDate = '',
    this.cardNumber = '',
    this.errorMessage = '',
    this.cardHolderName = '',
    this.status = InputStatus.inputWait,
    this.paymentTool = PaymentTools.stripe,
  }) {
    isSelected = [
      paymentTool == PaymentTools.stripe,
      paymentTool == PaymentTools.liqPay,
    ];
  }

  @override
  List<Object?> get props => [
        version,
      ];

  void updateInput(
    String newCardNumber,
    String newExpiryDate,
    String newCardHolderName,
    String newCvvCode,
  ) {
    version++;

    cvvCode = newCvvCode;
    cardNumber = newCardNumber;
    expiryDate = newExpiryDate;
    cardHolderName = newCardHolderName;
  }

  void updatePaymentMethod(int index) {
    version++;
    paymentTool = paymentTools[index];
  }

  void backToInput() {
    version++;
    status = InputStatus.inputWait;
  }

  Future<void> processPayment(
    String cardNumber,
    String expiryDate,
    String cvvCode,
    String chosenPaymentTool,
    AppLocalizations currentLocale,
  ) async {
    version++;
    var check = await InputValidationManager.validatePayment(
      cardNumber,
      expiryDate,
      cvvCode,
      currentLocale,
    );

    if (!check["valid"]) {
      status = InputStatus.failure;
      errorMessage = check["description"];
    } else {
      var response = await AuthManager.instance.user!.performUpdateOrPayment(
        cardNumber,
        expiryDate,
        cvvCode,
        chosenPaymentTool,
      );

      status = response["result"] == "error"
          ? InputStatus.failure
          : InputStatus.success;

      errorMessage = response["result"] == "error"
          ? errorMessage = response["description"]
          : "";
    }
  }
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    switch (event.runtimeType) {
      case ChangePaymentMethodEvent:
        event as ChangePaymentMethodEvent;
        state.updatePaymentMethod(event.index);
        break;

      case ChangeInputEvent:
        event as ChangeInputEvent;
        state.updateInput(
          event.newCardNumber,
          event.newExpiryDate,
          event.newCardHolderName,
          event.newCvvCode,
        );
        break;

      case ConfirmPaymentEvent:
        event as ConfirmPaymentEvent;
        String cvvCode = state.cvvCode;
        String cardNumber = state.cardNumber;
        String expiryDate = state.expiryDate;

        AppLocalizations currentLocale = event.currentLocale;
        String chosenPaymentTool =
            state.paymentTool == PaymentTools.liqPay ? "LiqPay" : "Stripe";

        yield PaymentState(
          version: state.version--,
          status: InputStatus.progress,
        );

        await state.processPayment(
          cardNumber,
          expiryDate,
          cvvCode,
          chosenPaymentTool,
          currentLocale,
        );
        break;

      case BackToInputPaymentEvent:
        event as BackToInputPaymentEvent;
        state.backToInput();
        break;
    }

    yield PaymentState(
      cvvCode: state.cvvCode,
      cardNumber: state.cardNumber,
      expiryDate: state.expiryDate,
      paymentTool: state.paymentTool,
      cardHolderName: state.cardHolderName,
      errorMessage: state.errorMessage,
      status: state.status,
    );
  }
}
