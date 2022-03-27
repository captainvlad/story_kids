import 'package:flutter/material.dart';
import 'package:story_kids/models/enums.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordIndicator extends StatelessWidget {
  final UiManager uiManager;
  final PasswordComplexity status;
  final AppLocalizations currentLocale;

  final Map<PasswordComplexity, Color> complexityColorMap = {
    PasswordComplexity.Weak: Colors.red[900]!,
    PasswordComplexity.Medium: Colors.amber[800]!,
    PasswordComplexity.High: Colors.green[800]!,
  };

  final Map<PasswordComplexity, double> complexityValueMap = {
    PasswordComplexity.Weak: 0.25,
    PasswordComplexity.Medium: 0.50,
    PasswordComplexity.High: 0.75,
  };

  PasswordIndicator({
    Key? key,
    required this.currentLocale,
    required this.uiManager,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<PasswordComplexity, String> complexityMessage = {
      PasswordComplexity.Weak: currentLocale.weak,
      PasswordComplexity.Medium: currentLocale.medium,
      PasswordComplexity.High: currentLocale.high,
    };

    return Column(
      children: [
        SizedBox(
          height: uiManager.blockSizeVertical,
        ),
        LinearProgressIndicator(
          minHeight: 3.0,
          value: complexityValueMap[status],
          color: complexityColorMap[status],
          backgroundColor: textSecondaryColor,
        ),
        SizedBox(
          height: uiManager.blockSizeVertical,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${currentLocale.strength}: ",
              style: const TextStyle(
                fontFamily: "Montserrat",
                color: textSecondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Text(
              "${complexityMessage[status]}",
              style: const TextStyle(
                fontFamily: "Montserrat",
                color: blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: uiManager.blockSizeVertical,
        ),
      ],
    );
  }
}