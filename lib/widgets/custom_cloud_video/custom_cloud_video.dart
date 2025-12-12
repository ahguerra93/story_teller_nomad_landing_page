import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:story_teller_nomad_landing_page/config/models/repo_config/repo_config.dart';
import 'package:video_player/video_player.dart';

class CustomCloudVideo extends StatefulWidget {
  const CustomCloudVideo({required this.id, super.key});
  final String id;

  @override
  State<CustomCloudVideo> createState() => _CustomCloudVideoState();
}

class _CustomCloudVideoState extends State<CustomCloudVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.I;
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://res.cloudinary.com/${getIt.get<RepoConfig>().cloudName}/video/upload/${widget.id}',
      ),
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
