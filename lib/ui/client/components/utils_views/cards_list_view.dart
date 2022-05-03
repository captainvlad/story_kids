import 'package:flutter/material.dart';
import 'package:story_kids/blocs/client/register_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/plan_card.dart';
import 'package:story_kids/ui/client/components/utils_views/plan_card_mobile.dart';

class CardsListView extends StatelessWidget {
  final bool mobile;
  final RegisterBloc rbloc;
  final UiManager uiManager;

  const CardsListView({
    Key? key,
    required this.rbloc,
    required this.uiManager,
    this.mobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mobile) {
      return ListView(
        children: rbloc.state.availablePlans
            .map(
              (it) => Column(
                children: [
                  PlanCardMobile(
                    plan: it,
                    uiManager: uiManager,
                    onPressed: () {
                      rbloc.add(
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
      children: rbloc.state.availablePlans
          .map(
            (it) => Column(
              children: [
                PlanCard(
                  plan: it,
                  uiManager: uiManager,
                  onPressed: () {
                    rbloc.add(
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
