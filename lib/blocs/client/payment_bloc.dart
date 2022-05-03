import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/resources/colors.dart';

class PaymentEvent {}

class ChangePaymentMethodEvent extends PaymentEvent {
  int index = 0;

  ChangePaymentMethodEvent({required this.index});
}

class BackToInputPaymentEvent extends PaymentEvent {}

class ConfirmPaymentEvent extends PaymentEvent {
  final String action;
  final String planName;

  ConfirmPaymentEvent({
    required this.action,
    required this.planName,
  });
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

  late List<bool> isSelected;
  PaymentTools paymentTool;
  Color creditCardColor = cardPurple;

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

  void updateVersion() {
    version++;
  }
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    InputStatus nextStatus = InputStatus.inputWait;

    if (event is ChangePaymentMethodEvent) {
      state.updatePaymentMethod(event.index);
    } else if (event is ChangeInputEvent) {
      state.updateInput(
        event.newCardNumber,
        event.newExpiryDate,
        event.newCardHolderName,
        event.newCvvCode,
      );
    } else if (event is ConfirmPaymentEvent) {
      yield PaymentState(
        version: -2,
        status: InputStatus.progress,
      );

      if (event.action == "create") {
      } else if (event.action == "update") {}

      // nextStatus = InputStatus.progress;
      // state.errorMessage = "Error message from bloc";
      await Future.delayed(const Duration(seconds: 2)); // AAADIP remove later
    } else if (event is BackToInputPaymentEvent) {
      state.updateVersion();
      nextStatus = InputStatus.inputWait;
    }

    yield PaymentState(
      cvvCode: state.cvvCode,
      cardNumber: state.cardNumber,
      expiryDate: state.expiryDate,
      paymentTool: state.paymentTool,
      cardHolderName: state.cardHolderName,
      errorMessage: state.errorMessage,
      status: nextStatus,
    );
  }
}
