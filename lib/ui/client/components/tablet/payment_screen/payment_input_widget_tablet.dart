import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:story_kids/blocs/client/payment_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/ui/client/components/util_views/rounded_button.dart';
import 'package:story_kids/ui/resources/colors.dart';

class PaymentInputWidgetTablet extends StatelessWidget {
  final AppLocalizations currentLocale;
  final GlobalKey<FormState> formKey;
  final UiManager uiManager;
  final PaymentBloc pBloc;

  const PaymentInputWidgetTablet({
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
          width: uiManager.blockSizeHorizontal * 90,
          decoration: uiManager.bodyDecoration,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: uiManager.blockSizeVertical * 3,
                  ),
                  Text(
                    currentLocale.payment_service_choice,
                    style: uiManager.mobile700Style1,
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 1.5,
                  ),
                  ToggleButtons(
                    children: pBloc.state.paymentToolsStrings
                        .map(
                          (string) => Padding(
                            padding: EdgeInsets.only(
                              left: uiManager.blockSizeVertical,
                              right: uiManager.blockSizeVertical,
                            ),
                            child: Text(
                              string,
                              style: uiManager.mobile900Style6,
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
              SizedBox(
                height: uiManager.blockSizeVertical * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreditCardWidget(
                    showBackView: false,
                    isHolderNameVisible: true,
                    cvvCode: pBloc.state.cvvCode,
                    expiryDate: pBloc.state.expiryDate,
                    cardNumber: pBloc.state.cardNumber,
                    cardHolderName: pBloc.state.cardHolderName,
                    cardBgColor: cardPurple,
                    height: uiManager.mobileSizeUnit * 40,
                    width: uiManager.blockSizeHorizontal * 40,
                    onCreditCardWidgetChange: (CreditCardBrand cardBrand) {},
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 40,
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
                      cardHolderName: pBloc.state.cardHolderName,
                      cardNumber: pBloc.state.cardNumber,
                      expiryDate: pBloc.state.expiryDate,
                      cvvCode: pBloc.state.cvvCode,
                    ),
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
                  style: uiManager.mobile700Style2,
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
                height: uiManager.blockSizeVertical * 3,
              ),
            ],
          ),
        ),
        SizedBox(
          height: uiManager.blockSizeVertical * 3,
          width: double.infinity,
        ),
      ],
    );
  }
}
