import 'package:flutter/material.dart';
import 'package:story_kids/models/plan.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;
  final UiManager uiManager;
  final void Function()? onPressed;

  const PlanCard({
    Key? key,
    required this.plan,
    required this.uiManager,
    required this.onPressed,
  }) : super(key: key);

  Widget generateContent() {
    if (plan.active) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.check_circle_outline_outlined,
            color: primaryColor,
            size: uiManager.blockSizeHorizontal * 2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${plan.index}. ${plan.name}",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Text(
                plan.price,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${plan.index}. ${plan.name}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: uiManager.blockSizeVertical * 2,
          ),
          Text(
            plan.price,
            style: const TextStyle(
              fontFamily: "Montserrat",
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 40,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: uiManager.blockSizeHorizontal * 25,
        decoration: BoxDecoration(
          border: Border.all(
            color: textSecondaryColor,
            width: 3.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: uiManager.blockSizeVertical * 2,
            bottom: uiManager.blockSizeVertical * 2,
            right: uiManager.blockSizeHorizontal * 2,
            left: uiManager.blockSizeHorizontal * 2,
          ),
          child: generateContent(),
        ),
      ),
    );
  }
}
