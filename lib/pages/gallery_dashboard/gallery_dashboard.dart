import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/main_logo.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/widgets/gallery_cover.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({required this.covers, this.showAppBar = true, this.onSelected, super.key});

  final List<MediaItem> covers;
  final void Function(MediaItem item)? onSelected;
  final bool showAppBar;

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

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < Breakpoints.tablet;

    return Stack(
      children: [
        ResponsiveLayout(
          desktop: CustomScrollView(
            controller: _scrollController,
            slivers: [
              if (widget.showAppBar)
                SliverAppBar(
                  expandedHeight: _appBarExpandedHeight,
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(background: _Appbar()),
                ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = widget.covers[index];
                  // Return empty container for items with empty id
                  if (item.id.isEmpty) {
                    return Container();
                  }
                  return GalleryCover(
                    item: item,
                    isFocused: _selectedPhotoId == item.id,
                    onPressed: () => widget.onSelected?.call(item),
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
                }, childCount: widget.covers.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4 / 3),
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
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = widget.covers[index];
                  if (item.id.isEmpty) {
                    return Container();
                  }
                  return GalleryCover(
                    item: item,
                    isFocused: _selectedPhotoId == item.id,
                    onPressed: () => widget.onSelected?.call(item),
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
                }, childCount: widget.covers.length),
              ),
            ],
          ),
        ),
        Positioned(
          right: 30,
          top: 30,
          child: HamburgerMenu(
            darkMode: isMobile
                ? true
                : !widget.showAppBar
                ? true
                : !_isAppBarVisible,
            homeOptionEnabled: true,
          ),
        ),
        if (isMobile
            ? true
            : !widget.showAppBar
            ? true
            : !_isAppBarVisible)
          Positioned(left: 30, top: 30, child: MainLogo(darkMode: true)),
      ],
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
            child: Center(child: Text('COMMERCIAL', style: style)),
          ),
          Expanded(child: Center(child: MainLogo(darkMode: false))),
          Expanded(
            child: Center(child: Text('PERSONAL', style: style)),
          ),
        ],
      ),
    );
  }
}
