import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/main_logo.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';
import 'package:story_teller_nomad_landing_page/pages/photos_page/data/model/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/photos_page/widgets/gallery_cover.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GalleryPage(
        commercialCovers: [
          MediaItem(id: 'professional-1-cover_ydopyh', title: 'Bomberos Comunarios', subtitle: 'Unión Europea'),
          MediaItem(
            id: 'professional-2-cover_co0zjv',
            title: 'Recolección de frutos del Bosque',
            subtitle: 'Unión Europea',
          ),
          MediaItem(
            id: 'professional-3-cover_xmujn3',
            title: 'Catálogo 2024',
            subtitle: 'Crillón Tours',
          ),
          MediaItem(
            id: 'professional-4-cover_nzraex',
            subtitle: 'Volver a vos',
            title: 'Yoga Y Mindfulness',
          ),
          MediaItem(id: 'professional-4-cover_y2bi0x', title: 'Colección 2023', subtitle: 'Maxiking'),
          MediaItem(id: 'professional-6-cover_eh09bp', title: 'Lanzamiento UMA Lluvia', subtitle: 'UMA Experience'),
          MediaItem(
              id: 'professional-7-cover_houqta', title: 'Lanzamiento Gravel 2026', subtitle: 'Ruta de los Pistoleros'),
        ],
        personalCovers: [
          MediaItem(
            id: 'personal-1-cover_qzlwog',
            title: 'Barrenderos',
          ),
          MediaItem(
            id: 'personal-2-cover_m6wvn9',
            title: 'Bali',
          ),
          MediaItem(
            id: 'personal-3-cover_x6lnyc',
            title: 'Ñatitas',
          ),
          MediaItem(
            id: 'personal-4-cover_uenf3f',
            title: 'NK',
          ),
          MediaItem(
            id: 'personal-5-cover_sabwyp',
            title: 'Quinoa',
          ),
          MediaItem(
            id: 'personal-6-cover_q0hqtu',
            title: 'Chunchos',
          ),
          MediaItem(
            id: 'personal-7-cover_ohxfpk',
            title: 'Oruro',
          ),
          MediaItem(
            id: 'personal-8-cover_rr9gjv',
            title: 'Pujllay',
          ),
        ],
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 18, letterSpacing: 5, fontWeight: FontWeight.w500, color: Colors.black);
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'COMMERCIAL',
                style: style,
              ),
            ),
          ),
          Expanded(
            child: Center(child: MainLogo(darkMode: false)),
          ),
          Expanded(
              child: Center(
                  child: Text(
            'PERSONAL',
            style: style,
          ))),
        ],
      ),
    );
  }
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({required this.commercialCovers, required this.personalCovers, this.onSelected, super.key});
  final List<MediaItem> commercialCovers;
  final List<MediaItem> personalCovers;
  final void Function(MediaItem item)? onSelected;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late ScrollController _scrollController;
  bool _isAppBarVisible = true;
  final double _appBarExpandedHeight = 100.0;

  String? _selectedPhotoId;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final bool isVisible = _scrollController.offset < _appBarExpandedHeight;
    if (isVisible != _isAppBarVisible) {
      setState(() {
        _isAppBarVisible = isVisible;
      });
      // You can add callbacks here to notify other parts of your app
      log('AppBar is ${_isAppBarVisible ? "visible" : "hidden"}');
    }
  }

  List<MediaItem> _allCovers(bool isMobile) {
    if (isMobile) {
      return [
        ...widget.commercialCovers,
        ...widget.personalCovers,
      ];
    } else {
      // Create intertwined list: commercial, personal, commercial, personal, etc.
      final maxLength = widget.commercialCovers.length > widget.personalCovers.length
          ? widget.commercialCovers.length
          : widget.personalCovers.length;

      List<MediaItem> intertwinedList = [];

      for (int i = 0; i < maxLength; i++) {
        // Add commercial item or empty placeholder
        if (i < widget.commercialCovers.length) {
          intertwinedList.add(widget.commercialCovers[i]);
        } else {
          intertwinedList.add(MediaItem(id: '', title: ''));
        }

        // Add personal item or empty placeholder
        if (i < widget.personalCovers.length) {
          intertwinedList.add(widget.personalCovers[i]);
        } else {
          intertwinedList.add(MediaItem(id: '', title: ''));
        }
      }

      return intertwinedList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < Breakpoints.tablet;
    final coverUrls = _allCovers(isMobile);
    return Stack(
      children: [
        ResponsiveLayout(
          desktop: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: _appBarExpandedHeight,
                floating: true,
                snap: true,
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: _Appbar(),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = coverUrls[index];
                    // Return empty container for items with empty id
                    if (item.id.isEmpty) {
                      return Container();
                    }
                    return GalleryCover(
                      item: item,
                      isFocused: _selectedPhotoId == item.id,
                      onFocused: () {
                        setState(() {
                          _selectedPhotoId = item.id;
                        });
                      },
                      onExit: () {
                        setState(() {
                          _selectedPhotoId = null;
                        });
                      },
                    );
                  },
                  childCount: coverUrls.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                ),
              ),
            ],
          ),
          mobile: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // SliverAppBar(
              //   expandedHeight: _appBarExpandedHeight,
              //   floating: true,
              //   snap: true,
              //   backgroundColor: Colors.white,
              //   elevation: 0,
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: _Appbar(),
              //   ),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => GalleryCover(
                    item: coverUrls[index],
                    isFocused: _selectedPhotoId == coverUrls[index].id,
                    onFocused: () {
                      setState(() {
                        _selectedPhotoId = coverUrls[index].id;
                      });
                    },
                    onExit: () {
                      setState(() {
                        _selectedPhotoId = null;
                      });
                    },
                  ),
                  childCount: coverUrls.length,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 30,
          top: 30,
          child: HamburgerMenu(
            darkMode: isMobile ? true : !_isAppBarVisible,
            homeOptionEnabled: true,
          ),
        ),
        if (isMobile ? true : !_isAppBarVisible)
          Positioned(
            left: 30,
            top: 30,
            child: MainLogo(darkMode: true),
          ),
      ],
    );
  }
}
