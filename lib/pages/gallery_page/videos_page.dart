import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_page/data/model/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_page/photos_page.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GalleryPage(
        showAppBar: false,
        covers: [
          MediaItem(
            id: '1.-fleishmann_h90qht',
            title: 'Todos Santos',
            subtitle: 'Fleishcmann Industrias Venado',
          ),
          MediaItem(
            id: '2-crillon_wyoddp',
            title: 'Video Corporativo 2024',
            subtitle: 'Crillón Tours',
          ),
          MediaItem(
            id: '3-mitsubishi_lsgj5p',
            title: 'L200',
            subtitle: 'Mitsubishi',
          ),
          MediaItem(
            id: '4-rdlp_qic4zp',
            title: 'Ruta de los Pistoleros',
            subtitle: 'Gravel Race 2026',
          ),
          MediaItem(
            id: '5-oruro_kcyybk',
            title: 'Carnaval Bolivia 2025',
            subtitle: 'Una Gran Nación',
          ),
          MediaItem(
            id: '6-bali_nsk501',
            title: 'Tour Bali',
            subtitle: 'Special Tours',
          ),
          MediaItem(
            id: '7-natitas_q2r0fx',
            title: 'Ñatitas',
          ),
          MediaItem(id: '8-haval_xvr8lp', title: 'Dargo 2023', subtitle: 'Haval'),
          MediaItem(id: '9-uma_s7vhir', title: 'UMA'),
          MediaItem(id: '10-bali-mask_gjpnmx', title: 'Balinese Mask'),
          MediaItem(
            id: '13-passport_ldgqao',
            title: 'Pasaporte para la Convervación',
            subtitle: 'Unión Europea',
          ),
          MediaItem(
            id: '14-delizia_evzzph',
            title: 'Helado Garapiña',
            subtitle: 'Delizia',
          ),
          MediaItem(
            id: '15-guandare_zynwjh',
            title: 'Proyecto Guandaré',
            subtitle: 'Naciones Unidas (UNDP)',
          ),
        ],
      ),
    );
  }
}
