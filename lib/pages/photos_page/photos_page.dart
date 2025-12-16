import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/pages/photos_page/data/model/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/photos_page/widgets/gallery_cover.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Appbar(),
          Expanded(
            child: PhotosPageBody(),
          ),
        ],
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(child: Text('COMMERCIAL')),
              Expanded(child: Text('LOGO')),
              Expanded(child: Text('PERSONAL')),
            ],
          ),
        ),
        Positioned(right: 20, child: HamburgerMenu(darkMode: false))
      ],
    );
  }
}

class PhotosPageBody extends StatefulWidget {
  const PhotosPageBody({super.key});

  @override
  State<PhotosPageBody> createState() => _PhotosPageBodyState();
}

class _PhotosPageBodyState extends State<PhotosPageBody> {
  static final List<MediaItem> _photosCoverUrls = [
    MediaItem(
      id: 'personal-1-cover_qzlwog',
      title: 'Barrenderos',
    ),
    MediaItem(id: 'professional-1-cover_ydopyh', title: 'Bomberos Comunarios', subtitle: 'Unión Europea'),
    MediaItem(
      id: 'personal-2-cover_m6wvn9',
      title: 'Bali',
    ),
    MediaItem(
      id: 'professional-2-cover_co0zjv',
      title: 'Recolección de frutos del Bosque',
      subtitle: 'Unión Europea',
    ),
    MediaItem(
      id: 'personal-3-cover_x6lnyc',
      title: 'Ñatitas',
    ),
    MediaItem(
      id: 'professional-3-cover_xmujn3',
      title: 'Catálogo 2024',
      subtitle: 'Crillón Tours',
    ),
    MediaItem(
      id: 'personal-4-cover_uenf3f',
      title: 'NK',
    ),
    MediaItem(
      id: 'professional-4-cover_nzraex',
      subtitle: 'Volver a vos',
      title: 'Yoga Y Mindfulness',
    ),
    MediaItem(
      id: 'personal-5-cover_sabwyp',
      title: 'Quinoa',
    ),
    MediaItem(id: 'professional-4-cover_y2bi0x', title: 'Colección 2023', subtitle: 'Maxiking'),
    MediaItem(
      id: 'personal-6-cover_q0hqtu',
      title: 'Chunchos',
    ),
    MediaItem(id: 'professional-6-cover_eh09bp', title: 'Lanzamiento UMA Lluvia', subtitle: 'UMA Experience'),
    MediaItem(
      id: 'personal-7-cover_ohxfpk',
      title: 'Oruro',
    ),
    MediaItem(id: 'professional-7-cover_houqta', title: 'Lanzamiento Gravel 2026', subtitle: 'Ruta de los Pistoleros'),
    MediaItem(
      id: 'personal-8-cover_rr9gjv',
      title: 'Pujllay',
    ),
  ];
  String? _selectedPhotoId;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        desktop: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          children: List.generate(
              _photosCoverUrls.length,
              (index) => GalleryCover(
                    item: _photosCoverUrls[index],
                    isFocused: _selectedPhotoId == _photosCoverUrls[index].id,
                    onFocused: () {
                      setState(() {
                        _selectedPhotoId = _photosCoverUrls[index].id;
                      });
                    },
                    onExit: () {
                      setState(() {
                        _selectedPhotoId = null;
                      });
                    },
                  )),
        ),
        mobile: ListView.builder(
          itemCount: _photosCoverUrls.length,
          itemBuilder: (context, index) => GalleryCover(
            item: _photosCoverUrls[index],
            isFocused: _selectedPhotoId == _photosCoverUrls[index].id,
            onFocused: () {
              setState(() {
                _selectedPhotoId = _photosCoverUrls[index].id;
              });
            },
            onExit: () {
              setState(() {
                _selectedPhotoId = null;
              });
            },
          ),
        ));
  }
}
