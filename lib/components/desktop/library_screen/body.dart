import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/library_bloc.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_kids/components/utils_views/carousele.dart';
import 'package:story_kids/components/utils_views/preview_card.dart';

class LibraryBodyDesktop extends StatelessWidget {
  const LibraryBodyDesktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppLocalizations currentLocale = AppLocalizations.of(context)!;
    UiManager uiManager = UiManager(context);

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
              Carousele(
                height: uiManager.blockSizeVertical * 60,
                width: double.infinity,
                uiManager: uiManager,
                media: _lBloc.state.contentList,
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.age_flat,
                      style: uiManager.desktop700Style5,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.animals,
                      style: uiManager.desktop700Style5,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 2,
                    ),
                    Text(
                      currentLocale.brave,
                      style: uiManager.desktop700Style5,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal,
                        ),
                        PreviewCard(
                          width: uiManager.blockSizeHorizontal * 14,
                          height: uiManager.blockSizeVertical * 17,
                          onTap: () {
                            print("CardView tapped");
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical * 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
