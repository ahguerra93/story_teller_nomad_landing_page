import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_page/gallery_page.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/animated_cover.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});
  final _photosKeyLabel = 'porfolio-photos-image';
  final _videosKeyLabel = 'porfolio-videos-image';
  final _photosPath = 'photos-section-updated_ezmngf';
  final _videosPath = 'video-section-updated_xflov4';
  final _photosTitle = 'PHOTOS';
  final _videosTitle = 'VIDEOS';
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: Row(
        children: [
          Expanded(
            child: AnimatedCover(
              key: Key(_photosKeyLabel),
              path: _photosPath,
              title: _photosTitle,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryPage(),
                    ));
              },
            ),
          ),
          Expanded(
            child: AnimatedCover(
              key: Key(_videosKeyLabel),
              path: _videosPath,
              title: _videosTitle,
            ),
          ),
        ],
      ),
      mobile: Column(
        children: [
          Expanded(
            child: AnimatedCover(
              key: Key(_photosKeyLabel),
              path: _photosPath,
              title: _photosTitle,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryPage(),
                    ));
              },
            ),
          ),
          Expanded(
            child: AnimatedCover(
              key: Key(_videosKeyLabel),
              path: _videosPath,
              title: _videosTitle,
            ),
          ),
        ],
      ),
    );
  }
}
