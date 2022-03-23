import 'package:flutter/material.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class RoundedButton extends StatelessWidget {
  final Widget text;
  final Color fillColor;
  final Color strokeColor;
  final UiManager uiManager;
  final void Function() onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.uiManager,
    required this.fillColor,
    required this.strokeColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: strokeColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
        child: MaterialButton(
          onPressed: onPressed,
          color: fillColor,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              uiManager.blockSizeHorizontal * 2,
              uiManager.blockSizeVertical * 1,
              uiManager.blockSizeHorizontal * 2,
              uiManager.blockSizeVertical * 1,
            ),
            child: text,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}
