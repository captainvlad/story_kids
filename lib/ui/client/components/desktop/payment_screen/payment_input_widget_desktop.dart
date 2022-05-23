import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/payment_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class PaymentInputWidgetDesktop extends StatelessWidget {
  final AppLocalizations currentLocale;
  final GlobalKey<FormState> formKey;
  final UiManager uiManager;
  final PaymentBloc pBloc;

  const PaymentInputWidgetDesktop({
    Key? key,
    required this.currentLocale,
    required this.formKey,
    required this.uiManager,
    required this.pBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical * 10,
          width: double.infinity,
        ),
        Container(
          width: uiManager.blockSizeHorizontal * 80,
          decoration: uiManager.bodyDecoration,
          child: Column(
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
                      children: pBloc.state.paymentToolsStrings
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
                      isSelected: pBloc.state.isSelected,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      onPressed: (int index) {
                        pBloc.add(ChangePaymentMethodEvent(index: index));
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CreditCardWidget(
                    showBackView: false,
                    isHolderNameVisible: true,
                    cvvCode: pBloc.state.cvvCode,
                    expiryDate: pBloc.state.expiryDate,
                    cardNumber: pBloc.state.cardNumber,
                    cardHolderName: pBloc.state.cardHolderName,
                    cardBgColor: cardPurple,
                    height: uiManager.blockSizeVertical * 30,
                    width: uiManager.blockSizeHorizontal * 25,
                    onCreditCardWidgetChange: (CreditCardBrand cardBrand) {},
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: uiManager.blockSizeHorizontal * 25,
                        child: CreditCardForm(
                          formKey: formKey,
                          onCreditCardModelChange: (CreditCardModel data) {
                            pBloc.add(
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
                          cardNumberDecoration:
                              uiManager.getCreditCardDecoration(
                            uiManager,
                            primaryColor,
                            'Card Number',
                            'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration:
                              uiManager.getCreditCardDecoration(
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
                          cardHolderDecoration:
                              uiManager.getCreditCardDecoration(
                            uiManager,
                            primaryColor,
                            'Card Holder',
                            'e.g. Adam Smith',
                          ),
                          cardHolderName: pBloc.state.cardHolderName,
                          cardNumber: pBloc.state.cardNumber,
                          expiryDate: pBloc.state.expiryDate,
                          cvvCode: pBloc.state.cvvCode,
                        ),
                      ),
                    ],
                  ),
                ],
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
                  pBloc.add(
                    ConfirmPaymentEvent(currentLocale: currentLocale),
                  );
                },
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
