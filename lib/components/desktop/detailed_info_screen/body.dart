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

class DetailedInfoBodyDesktop extends StatelessWidget {
  const DetailedInfoBodyDesktop({Key? key}) : super(key: key);

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
                      width: uiManager.blockSizeHorizontal * 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _iBloc.state.content!.title,
                            style: uiManager.desktop900Style1,
                          ),
                          SizedBox(
                            height: uiManager.blockSizeVertical * 2,
                          ),
                          RoundedButton(
                            text: Text(
                              currentLocale.watch,
                              style: uiManager.desktop900Style3,
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
                            height: uiManager.blockSizeVertical * 4,
                          ),
                          Text(
                            _iBloc.state.content!.subtitle,
                            style: uiManager.desktop700Style7,
                          ),
                          SizedBox(
                            height: uiManager.blockSizeVertical * 4,
                          ),
                          Text(
                            _iBloc.state.content!.meta,
                            style: uiManager.desktop300Style1,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      _iBloc.state.content!.iconPath,
                      width: uiManager.blockSizeHorizontal * 25,
                      height: uiManager.blockSizeHorizontal * 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 5,
              ),
              SizedBox(
                width: uiManager.blockSizeHorizontal * 55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentLocale.detail,
                      style: uiManager.desktop900Style2,
                    ),
                    standardDivider,
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Text(
                      _iBloc.state.content!.title,
                      style: uiManager.desktop700Style7,
                    ),
                    SizedBox(
                      height: uiManager.blockSizeVertical,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: uiManager.blockSizeHorizontal * 30,
                          child: Text(
                            _iBloc.state.content!.description,
                            style: uiManager.desktop300Style1,
                          ),
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal * 2,
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal * 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _iBloc.state.content!.author,
                                style: uiManager.desktop300Style1,
                              ),
                              SizedBox(
                                height: uiManager.blockSizeVertical,
                              ),
                              Text(
                                _iBloc.state.content!.releaseDate,
                                style: uiManager.desktop300Style1,
                              ),
                              SizedBox(
                                height: uiManager.blockSizeVertical,
                              ),
                              Text(
                                _iBloc.state.content!.age,
                                style: uiManager.desktop300Style1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal * 2,
                        ),
                        SizedBox(
                          width: uiManager.blockSizeHorizontal * 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _iBloc.state.content!.illustration,
                                style: uiManager.desktop300Style1,
                              ),
                              SizedBox(
                                height: uiManager.blockSizeVertical,
                              ),
                              Text(
                                _iBloc.state.content!.length,
                                style: uiManager.desktop300Style1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: uiManager.blockSizeVertical * 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
