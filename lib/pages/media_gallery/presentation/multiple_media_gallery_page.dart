import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_circular_progress_indicator.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/config/router/routes.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/presentation/cubit/media_gallery_cubit.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MediaGalleryPage extends StatelessWidget {
  const MediaGalleryPage({required this.id, required this.type, super.key});
  final String id;
  final MediaType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaGalleryCubit(id: id, type: type)..loadMediaGroup(),
      child: _Widget(),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaGalleryCubit, MediaGalleryState>(
      builder: (context, state) {
        return Scaffold(
          body: state.when(
            loading: () => Center(key: Key('Loading_media_gallery_page'), child: CustomCircularProgressIndicator()),
            error: (message) => Center(key: Key('Error_media_gallery_page'), child: Text('Error: $message')),
            success: (mediaItem) => switch (context.read<MediaGalleryCubit>().type) {
              MediaType.photo => _PhotosContent(mediaItem: mediaItem),
              MediaType.video => Center(child: Text('Videos viewer not implemented yet')),
            },
          ),
        );
      },
    );
  }
}

class _PhotosContent extends StatefulWidget {
  const _PhotosContent({required this.mediaItem});
  final MediaItem mediaItem;

  @override
  State<_PhotosContent> createState() => _PhotosContentState();
}

class _PhotosContentState extends State<_PhotosContent> {
  final PageController _pageController = PageController();
  int index = 0;
  final double appbarOffset = 80.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.mediaItem.children.length,
              onPageChanged: (value) => setState(() => index = value),
              itemBuilder: (context, index) {
                final id = widget.mediaItem.children[index];
                return widget.mediaItem.type == MediaType.photo
                    ? Padding(
                        padding: EdgeInsets.only(top: appbarOffset),
                        child: InteractiveViewer(
                          minScale: 0.5,
                          maxScale: 5.0,
                          child: CustomCloudImage(
                            id: id,
                            placeHolder: Center(child: CustomCircularProgressIndicator()),
                            fit: BoxFit.fitHeight,
                            fullQuality: true,
                          ),
                        ),
                      )
                    : Text('In progress');
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,

            child: Container(
              padding: const EdgeInsets.all(30),
              height: 80,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                spacing: 10.0,
                children: [
                  InkWell(
                    onTap: () => context.go(AppRoutes.photos.path),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Text(widget.mediaItem.title.toUpperCase(), style: TextStyle(color: Colors.white, letterSpacing: 5.0)),
                ],
              ),
            ),
          ),
          Positioned(top: 30, right: 30, child: HamburgerMenu(darkMode: true, homeOptionEnabled: true)),
          if (index > 0)
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () =>
                    _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
                child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_back_ios)),
              ),
            ),
          if (index < widget.mediaItem.children.length - 1)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
                child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_forward_ios)),
              ),
            ),
        ],
      ),
    );
  }
}

class _VideoContent extends StatefulWidget {
  const _VideoContent({required this.mediaItem, super.key});
  final MediaItem mediaItem;

  @override
  State<_VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<_VideoContent> {
  final _controller = YoutubePlayerController(
    params: YoutubePlayerParams(mute: false, showControls: true, showFullscreenButton: true),
  );

  int index = 0;

  String get currentUrl => widget.mediaItem.children[index];

  void _loadVideo() {
    _controller.loadVideoById(videoId: currentUrl);
  }

  @override
  void initState() {
    _loadVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    // Stack(
    //   children: [
    Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          height: 80,
          width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.black),
          child: Text(widget.mediaItem.title.toUpperCase(), style: TextStyle(color: Colors.white, letterSpacing: 5.0)),
        ),
        Expanded(
          child: YoutubePlayer(controller: _controller, aspectRatio: 16 / 9),
        ),
      ],
    )
    // ,
    // Positioned(top: 30, right: 30, child: HamburgerMenu(darkMode: true, homeOptionEnabled: true)),
    // if (index > 0)
    //   Align(
    //     alignment: Alignment.centerLeft,
    //     child: InkWell(
    //       onTap: () => setState(() {
    //         index--;
    //         _loadVideo();
    //       }),
    //       child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_back_ios)),
    //     ),
    //   ),
    // if (index < widget.mediaItem.children.length - 1)
    //   Align(
    //     alignment: Alignment.centerRight,
    //     child: InkWell(
    //       onTap: () => setState(() {
    //         index++;
    //         _loadVideo();
    //       }),
    //       child: Padding(padding: const EdgeInsets.all(16.0), child: Icon(Icons.arrow_forward_ios)),
    //     ),
    //   ),
    //   ],
    // );
    ;
  }
}
