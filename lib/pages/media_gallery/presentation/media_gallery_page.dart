import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/presentation/cubit/media_gallery_cubit.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';

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
            loading: () => Center(key: Key('Loading_media_gallery_page'), child: CircularProgressIndicator()),
            error: (message) => Center(key: Key('Error_media_gallery_page'), child: Text('Error: $message')),
            success: (mediaItem) => _Content(mediaItem: mediaItem),
          ),
        );
      },
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({required this.mediaItem});
  final MediaItem mediaItem;

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final PageController _pageController = PageController();
  int index = 0;
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
                    ? CustomCloudImage(
                        id: id,
                        placeHolder: Center(child: CircularProgressIndicator(color: Colors.white)),
                        fit: BoxFit.contain,
                        fullQuality: true,
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
              child: Text(
                widget.mediaItem.title.toUpperCase(),
                style: TextStyle(color: Colors.white, letterSpacing: 5.0),
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
