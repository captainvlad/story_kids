import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/payment_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/client/components/utils_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class PaymentBodyDesktop extends StatelessWidget {
  const PaymentBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    var paymentWidgetKey = GlobalKey<FormState>();
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    final String actionString = arguments?["action"] ??
        "non-existing-action"; // AAADIP create a standard string for this

    final String planName = arguments?["planName"] ?? "-";

    return BlocProvider<PaymentBloc>(
      create: (context) => PaymentBloc(),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          PaymentBloc _pBloc = BlocProvider.of<PaymentBloc>(context);
          Widget paymentBody;

          if (_pBloc.state.status == InputStatus.progress) {
            paymentBody = createPaymentProgressBody(uiManager);
          } else if (_pBloc.state.status == InputStatus.inputWait) {
            paymentBody = createPaymentInputBody(currentLocale,
                paymentWidgetKey, uiManager, _pBloc, actionString, planName);
          } else if (_pBloc.state.status == InputStatus.success) {
            paymentBody = createSuccessBody(uiManager, currentLocale);
          } else {
            paymentBody = createFailureBody(
                currentLocale, _pBloc.state.errorMessage, uiManager, _pBloc);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 15,
                width: double.infinity,
              ),
              Container(
                width: uiManager.blockSizeHorizontal * 70,
                color: secondaryColor,
                child: paymentBody,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget createPaymentProgressBody(UiManager uiManager) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 20,
          width: double.infinity,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
          width: uiManager.blockSizeVertical * 10,
          child: const CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 20,
        ),
      ],
    );
  }

  Widget createPaymentInputBody(
    AppLocalizations currentLocale,
    GlobalKey<FormState> formKey,
    UiManager uiManager,
    PaymentBloc _pBloc,
    String actionString,
    String planName,
  ) {
    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentLocale.payment_service_choice,
                style: uiManager.desktop700Style1,
              ),
              ToggleButtons(
                children: _pBloc.state.paymentToolsStrings
                    .map(
                      (string) => Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Text(
                          string,
                          style: uiManager.desktop700Style11,
                        ),
                      ),
                    )
                    .toList(),
                fillColor: primaryColor,
                color: primaryColor,
                selectedColor: secondaryColor,
                isSelected: _pBloc.state.isSelected,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                onPressed: (int index) {
                  _pBloc.add(
                    ChangePaymentMethodEvent(index: index),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CreditCardWidget(
                showBackView: false,
                isHolderNameVisible: true,
                cvvCode: _pBloc.state.cvvCode,
                expiryDate: _pBloc.state.expiryDate,
                cardNumber: _pBloc.state.cardNumber,
                cardHolderName: _pBloc.state.cardHolderName,
                cardBgColor: _pBloc.state.creditCardColor,
                width: uiManager.blockSizeHorizontal * 25,
                onCreditCardWidgetChange: (CreditCardBrand cardBrand) {},
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 25,
                child: CreditCardForm(
                  formKey: formKey,
                  onCreditCardModelChange: (CreditCardModel data) {
                    _pBloc.add(
                      ChangeInputEvent(
                        newCvvCode: data.cvvCode,
                        newCardNumber: data.cardNumber,
                        newExpiryDate: data.expiryDate,
                        newCardHolderName: data.cardHolderName,
                      ),
                    );
                  },
                  themeColor: primaryColor,
                  obscureCvv: true,
                  obscureNumber: false,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardNumberDecoration: uiManager.getCreditCardDecoration(
                    uiManager,
                    primaryColor,
                    'Card Number',
                    'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: uiManager.getCreditCardDecoration(
                    uiManager,
                    primaryColor,
                    'Expired Date',
                    'MM/YY',
                  ),
                  cvvCodeDecoration: uiManager.getCreditCardDecoration(
                    uiManager,
                    primaryColor,
                    'CVV',
                    'XXX',
                  ),
                  cardHolderDecoration: uiManager.getCreditCardDecoration(
                    uiManager,
                    primaryColor,
                    'Card Holder',
                    'e.g. Adam Smith',
                  ),
                  cardHolderName: _pBloc.state.cardHolderName,
                  cardNumber: _pBloc.state.cardNumber,
                  expiryDate: _pBloc.state.expiryDate,
                  cvvCode: _pBloc.state.cvvCode,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 3,
        ),
        RoundedButton(
          text: Text(
            currentLocale.submit,
            textAlign: TextAlign.center,
            style: uiManager.desktop700Style4,
          ),
          uiManager: uiManager,
          fillColor: primaryColor,
          strokeColor: primaryColor,
          onPressed: () {
            _pBloc.add(
              ConfirmPaymentEvent(
                action: actionString,
                planName: planName,
              ),
            );
          },
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }

  Widget createSuccessBody(
    UiManager uiManager,
    AppLocalizations currentLocale,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 14,
          width: double.infinity,
        ),
        Text(
          currentLocale.payment_success,
          textAlign: TextAlign.center,
          style: uiManager.desktop700Style1,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 15,
        ),
        RoundedButton(
          text: Text(
            currentLocale.back_to_main,
            style: uiManager.desktop700Style3,
          ),
          uiManager: uiManager,
          fillColor: primaryColor,
          strokeColor: primaryColor,
          onPressed: () {},
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 14,
        ),
      ],
    );
  }

  Widget createFailureBody(
    AppLocalizations currentLocale,
    String failureMessage,
    UiManager uiManager,
    PaymentBloc _pBloc,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
          width: double.infinity,
        ),
        Text(
          currentLocale.failure,
          textAlign: TextAlign.center,
          style: uiManager.desktop700Style10,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 3,
        ),
        Text(
          failureMessage,
          style: uiManager.desktop700Style9,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 14,
        ),
        RoundedButton(
          text: Text(
            currentLocale.back_to_main,
            style: uiManager.desktop700Style3,
          ),
          uiManager: uiManager,
          fillColor: primaryColor,
          strokeColor: primaryColor,
          onPressed: () {},
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 2,
        ),
        RoundedButton(
          text: Text(
            currentLocale.try_again,
            style: uiManager.desktop700Style3,
          ),
          uiManager: uiManager,
          fillColor: primaryColor,
          strokeColor: primaryColor,
          onPressed: () {
            _pBloc.add(
              BackToInputPaymentEvent(),
            );
          },
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
