import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:story_kids/ui/client/screens/desktop/payment_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/payment_screen.dart';

class PaymentScreen extends StatelessWidget {
  static String path = "payment_screen";

  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const PaymentScreenDesktop(),
      tablet: const PaymentScreenMobile(),
      mobile: const PaymentScreenMobile(),
    );
  }
}
