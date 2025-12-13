import 'dart:developer';

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
    )..initialize().then((_) async {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        log('Video initialized');
        // setState(() {});
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          log('Playing video');
          await _controller.setLooping(true);
          await _controller.setVolume(0);
          await _controller.play();
          setState(() {});
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
        : Container(
            child: _controller.value.hasError
                ? Center(
                    child: Icon(Icons.broken_image, size: 48, color: Colors.grey[400]),
                  )
                : Center(child: CircularProgressIndicator()),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
