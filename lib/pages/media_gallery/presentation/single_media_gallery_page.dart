import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_circular_progress_indicator.dart';
// import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/config/router/routes.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/presentation/cubit/cubit/single_media_gallery_cubit.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SingleMediaGalleryPage extends StatelessWidget {
  const SingleMediaGalleryPage({required this.type, super.key, this.index = 0});
  final MediaType type;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleMediaGalleryCubit(type)..loadMedia(),
      child: _Widget(index: index),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleMediaGalleryCubit, SingleMediaGalleryState>(
      builder: (context, state) {
        return Scaffold(
          body: state.when(
            loading: () =>
                Center(key: Key('Loading_single_media_gallery_page'), child: CustomCircularProgressIndicator()),
            error: (message) => Center(key: Key('Error_single_media_gallery_page'), child: Text('Error: $message')),
            success: (mediaItems) => switch (context.read<SingleMediaGalleryCubit>().type) {
              MediaType.photo => Center(child: Text('Photos Single Media viewer not implemented yet')),
              MediaType.video => Center(
                child: _VideoContent(mediaItems: mediaItems, initialIndex: index),
              ),
            },
          ),
        );
      },
    );
  }
}

class _VideoContent extends StatefulWidget {
  const _VideoContent({required this.mediaItems, this.initialIndex = 0, super.key});
  final List<MediaItem> mediaItems;
  final int initialIndex;

  @override
  State<_VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<_VideoContent> {
  final _controller = YoutubePlayerController(
    params: YoutubePlayerParams(mute: false, showControls: true, showFullscreenButton: true),
  );

  late int index;

  String get currentUrl => widget.mediaItems[index].children.firstOrNull ?? '';

  void _loadVideo() {
    // _controller.loadVideoById(videoId: currentUrl);
    _controller.loadVideo(currentUrl);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.playVideo();
    });
  }

  @override
  void initState() {
    index = widget.initialIndex;
    _loadVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              height: 80,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                spacing: 10,
                children: [
                  InkWell(
                    onTap: () => context.go(AppRoutes.videos.path),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Text(
                    widget.mediaItems[index].title.toUpperCase(),
                    style: TextStyle(color: Colors.white, letterSpacing: 5.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: YoutubePlayer(controller: _controller, aspectRatio: 16 / 9),
            ),
          ],
        ),
        // Positioned(top: 30, right: 30, child: AltHamburgerMenu(darkMode: true, homeOptionEnabled: true)),
        if (index > 0)
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => setState(() {
                index--;
                _loadVideo();
              }),
              child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_back_ios)),
            ),
          ),
        if (index < widget.mediaItems.length - 1)
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => setState(() {
                index++;
                _loadVideo();
              }),
              child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_forward_ios)),
            ),
          ),
      ],
    );
    ;
  }
}
