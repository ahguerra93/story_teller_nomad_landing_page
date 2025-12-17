import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/data/model/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/gallery_dashboard.dart';

class PhotosPage extends StatelessWidget {
  PhotosPage({super.key});

  List<MediaItem> _allCovers(bool isMobile) {
    if (isMobile) {
      return [
        ...commercialCovers,
        ...personalCovers,
      ];
    } else {
      // Create intertwined list: commercial, personal, commercial, personal, etc.
      final maxLength =
          commercialCovers.length > personalCovers.length ? commercialCovers.length : personalCovers.length;

      List<MediaItem> intertwinedList = [];

      for (int i = 0; i < maxLength; i++) {
        // Add commercial item or empty placeholder
        if (i < commercialCovers.length) {
          intertwinedList.add(commercialCovers[i]);
        } else {
          intertwinedList.add(MediaItem(id: '', title: ''));
        }

        // Add personal item or empty placeholder
        if (i < personalCovers.length) {
          intertwinedList.add(personalCovers[i]);
        } else {
          intertwinedList.add(MediaItem(id: '', title: ''));
        }
      }
      return intertwinedList;
    }
  }

  final List<MediaItem> commercialCovers = [
    MediaItem(id: 'professional-1-cover-light_pm22em', title: 'Bomberos Comunarios', subtitle: 'Unión Europea'),
    MediaItem(
      id: 'professional-2-cover-light_laavuy',
      title: 'Recolección de frutos del Bosque',
      subtitle: 'Unión Europea',
    ),
    MediaItem(
      id: 'professional-3-cover-light_im3m8w',
      title: 'Catálogo 2024',
      subtitle: 'Crillón Tours',
    ),
    MediaItem(
      id: 'professional-4-cover-light_cxkbri',
      subtitle: 'Volver a vos',
      title: 'Yoga Y Mindfulness',
    ),
    MediaItem(id: 'professional-4-cover-light_dmufa6', title: 'Colección 2023', subtitle: 'Maxiking'),
    MediaItem(id: 'professional-6-cover-light_webprk', title: 'Lanzamiento UMA Lluvia', subtitle: 'UMA Experience'),
    MediaItem(
        id: 'professional-7-cover-light_lvojsu', title: 'Lanzamiento Gravel 2026', subtitle: 'Ruta de los Pistoleros'),
  ];
  final List<MediaItem> personalCovers = [
    MediaItem(
      id: 'personal-1-cover-light_hed2t5',
      title: 'Barrenderos',
    ),
    MediaItem(
      id: 'personal-2-cover-light_mi00jd',
      title: 'Bali',
    ),
    MediaItem(
      id: 'personal-3-cover-light_i1opej',
      title: 'Ñatitas',
    ),
    MediaItem(
      id: 'personal-4-cover-light_ryntuz',
      title: 'NK',
    ),
    MediaItem(
      id: 'personal-5-cover-light_g3su9c',
      title: 'Quinoa',
    ),
    MediaItem(
      id: 'personal-6-cover-light_qvzzcb',
      title: 'Chunchos',
    ),
    MediaItem(
      id: 'personal-7-cover-light_rh8pi9',
      title: 'Oruro',
    ),
    MediaItem(
      id: 'personal-8-cover-light_k44qav',
      title: 'Pujllay',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GalleryPage(
        covers: _allCovers(MediaQuery.of(context).size.width < Breakpoints.tablet),
      ),
    );
  }
}
