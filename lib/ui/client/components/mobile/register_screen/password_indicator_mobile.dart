import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/enums.dart';
import 'package:story_kids/ui/resources/colors.dart';

class PasswordIndicatorMobile extends StatelessWidget {
  final UiManager uiManager;
  final PasswordComplexity status;
  final AppLocalizations currentLocale;

  final Map<PasswordComplexity, Color> complexityColorMap = {
    PasswordComplexity.weak: Colors.red[900]!,
    PasswordComplexity.medium: Colors.amber[800]!,
    PasswordComplexity.high: Colors.green[800]!,
  };

  final Map<PasswordComplexity, double> complexityValueMap = {
    PasswordComplexity.weak: 0.25,
    PasswordComplexity.medium: 0.50,
    PasswordComplexity.high: 0.75,
  };

  PasswordIndicatorMobile({
    Key? key,
    required this.currentLocale,
    required this.uiManager,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<PasswordComplexity, String> complexityMessage = {
      PasswordComplexity.weak: currentLocale.weak,
      PasswordComplexity.medium: currentLocale.medium,
      PasswordComplexity.high: currentLocale.high,
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
              style: uiManager.mobile700Style9,
            ),
            Text(
              "${complexityMessage[status]}",
              style: uiManager.mobile700Style4,
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
