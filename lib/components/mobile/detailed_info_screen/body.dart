import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/detailed_info_bloc.dart';
import 'package:story_kids/components/utils_views/divider.dart';
import 'package:story_kids/components/utils_views/rounded_button.dart';
import 'package:story_kids/res/styles/colors.dart';
import 'package:story_kids/screens/universal/video_player.dart';
import 'package:story_kids/utilities/navigation_manager.dart';
import 'package:story_kids/utilities/ui_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailedInfoBodyMobile extends StatelessWidget {
  const DetailedInfoBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiManager uiManager = UiManager(context);
    AppLocalizations currentLocale = AppLocalizations.of(context)!;

    return BlocProvider<InfoBloc>(
      create: (context) => InfoBloc(),
      child: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          InfoBloc _iBloc = BlocProvider.of<InfoBloc>(context);

          if (_iBloc.state.content == null) {
            _iBloc.add(LoadingEvent(mediaFileId: '', locale: currentLocale));
            return const SizedBox.shrink();
          }

          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_iBloc.state.content!.backgroundPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: uiManager.blockSizeVertical * 2,
                    ),
                    SizedBox(
                      width: uiManager.blockSizeHorizontal * 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: uiManager.blockSizeVertical * 5,
                          ),
                          Text(
                            _iBloc.state.content!.title,
                            style: uiManager.mobile900Style1,
                          ),
                          SizedBox(
                            height: uiManager.blockSizeVertical * 2,
                          ),
                          RoundedButton(
                            text: Text(
                              currentLocale.watch,
                              style: uiManager.mobile700Style6,
                            ),
                            uiManager: uiManager,
                            fillColor: secondaryColor,
                            strokeColor: primaryColor,
                            onPressed: () {
                              NavigationManager.pushNamed(
                                  VideoPlayerScreen.path, null);
                            },
                          ),
                          SizedBox(
                            height: uiManager.blockSizeVertical * 2,
                          ),
                          Text(
                            _iBloc.state.content!.subtitle,
                            style: uiManager.mobile700Style7,
                          ),
                          SizedBox(
                            height: uiManager.blockSizeVertical,
                          ),
                          Text(
                            _iBloc.state.content!.meta,
                            style: uiManager.mobile300Style1,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      _iBloc.state.content!.iconPath,
                      width: uiManager.blockSizeHorizontal * 35,
                      height: uiManager.blockSizeHorizontal * 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Text(
                    currentLocale.detail,
                    style: uiManager.mobile900Style2,
                  ),
                  standardDivider,
                  SizedBox(
                    height: uiManager.blockSizeVertical,
                  ),
                  Text(
                    _iBloc.state.content!.title,
                    style: uiManager.mobile700Style7,
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 80,
                    child: Text(
                      _iBloc.state.content!.description,
                      style: uiManager.mobile300Style1,
                    ),
                  ),
                  SizedBox(
                    height: uiManager.blockSizeVertical * 2,
                  ),
                  SizedBox(
                    width: uiManager.blockSizeHorizontal * 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _iBloc.state.content!.author,
                              style: uiManager.mobile300Style1,
                            ),
                            SizedBox(
                              width: uiManager.blockSizeVertical * 2,
                            ),
                            Text(
                              _iBloc.state.content!.releaseDate,
                              style: uiManager.mobile300Style1,
                            ),
                            SizedBox(
                              width: uiManager.blockSizeVertical * 2,
                            ),
                            Text(
                              _iBloc.state.content!.age,
                              style: uiManager.mobile300Style1,
                            ),
                            SizedBox(
                              width: uiManager.blockSizeVertical * 2,
                            ),
                            Text(
                              _iBloc.state.content!.illustration,
                              style: uiManager.mobile300Style1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: uiManager.blockSizeVertical * 2,
                        ),
                        Text(
                          _iBloc.state.content!.length,
                          style: uiManager.mobile300Style1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 5,
              ),
            ],
          );
        },
      ),
    );
  }
}
