import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/blocs/client/library_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/ui/client/components/utils_views/carousele_widget.dart';
import 'package:story_kids/ui/client/components/utils_views/preview_card.dart';

class LibraryBodyMobile extends StatelessWidget {
  const LibraryBodyMobile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return BlocProvider<LibraryBloc>(
      create: (context) => LibraryBloc(),
      child: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          LibraryBloc _lBloc = BlocProvider.of<LibraryBloc>(context);

          if (!_lBloc.state.initialized) {
            _lBloc.add(InitLibraryEvent());
            return const SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
                width: double.infinity,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Carousele(
                      height: uiManager.mobileSizeUnit * 30,
                      width: double.infinity,
                      uiManager: uiManager,
                      media: _lBloc.state.contentList,
                      mobile: true,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.age_flat,
                      style: uiManager.mobile700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.animals,
                      style: uiManager.mobile700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.brave,
                      style: uiManager.mobile700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    PreviewCard(
                      width: uiManager.blockSizeHorizontal * 70,
                      height: uiManager.blockSizeVertical * 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
