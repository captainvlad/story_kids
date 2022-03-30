import 'package:flutter/material.dart';
import 'package:story_kids/blocs/input_bloc.dart';
import 'package:story_kids/components/utils_views/plan_card.dart';
import 'package:story_kids/components/utils_views/plan_card_mobile.dart';
import 'package:story_kids/utilities/ui_manager.dart';

class CardsListView extends StatelessWidget {
  final bool mobile;
  final InputBloc inbloc;
  final UiManager uiManager;

  const CardsListView({
    Key? key,
    required this.inbloc,
    required this.uiManager,
    this.mobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mobile) {
      return ListView(
        children: inbloc.state.availablePlans
            .map(
              (it) => Column(
                children: [
                  PlanCardMobile(
                    plan: it,
                    uiManager: uiManager,
                    onPressed: () {
                      inbloc.add(
                        ChangeActivePlan(index: it.index),
                      );
                    },
                  ),
                  SizedBox(height: uiManager.blockSizeVertical),
                ],
              ),
            )
            .toList(),
      );
    }

    return ListView(
      children: inbloc.state.availablePlans
          .map(
            (it) => Column(
              children: [
                PlanCard(
                  plan: it,
                  uiManager: uiManager,
                  onPressed: () {
                    inbloc.add(
                      ChangeActivePlan(index: it.index),
                    );
                  },
                ),
                SizedBox(height: uiManager.blockSizeVertical),
              ],
            ),
          )
          .toList(),
    );
  }
}
