import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/player_bloc.dart';
import 'package:story_kids/ui/resources/colors.dart';
import 'package:video_player/video_player.dart';

class CustomChewie extends StatelessWidget {
  final VideoPlayerController controller;
  final double aspectRatio;
  final bool autoInitialize;

  const CustomChewie({
    Key? key,
    required this.controller,
    required this.aspectRatio,
    this.autoInitialize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        PlayerBloc _pBloc = BlocProvider.of<PlayerBloc>(context);
        VideoPlayerController? videoControllerCopy = controller;

        if (_pBloc.state.key == key) {
          videoControllerCopy.initialize().then(
            (value) async {
              await videoControllerCopy?.seekTo(_pBloc.state.duration);
            },
          );
        }
        //  else {
        //   videoControllerCopy.initialize();
        // }

        ChewieController? chewieController = ChewieController(
          videoPlayerController: videoControllerCopy,
          aspectRatio: aspectRatio,
          autoInitialize: autoInitialize,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(
                errorMessage,
                style: const TextStyle(
                  color: secondaryColor,
                ),
              ),
            );
          },
        );

        chewieController.addListener(
          () async {
            bool? isFullScreen = chewieController?.isFullScreen;

            if (isFullScreen != null && !isFullScreen) {
              Duration position =
                  await videoControllerCopy?.position ?? const Duration();

              await videoControllerCopy?.pause();
              await chewieController?.pause();

              videoControllerCopy = null;
              chewieController = null;
              _pBloc.state.key = key;

              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  _pBloc.add(
                    PlayerEvent(duration: position),
                  );
                },
              );
            }
          },
        );

        if (chewieController == null) {
          return const SizedBox.shrink();
        } else {
          return Chewie(controller: chewieController!);
        }
      },
    );
  }
}
