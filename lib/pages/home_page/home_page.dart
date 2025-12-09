import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/page_dot_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final index = navigationShell.currentIndex;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: navigationShell),
          Align(
            alignment: Alignment.centerRight,
            // right: 25,
            // top: 0,
            // bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageDotWidget(
                    // key: Key('nav-dot-0'),
                    onTap: () => navigationShell.goBranch(0),
                    active: index == 0,
                  ),
                  SizedBox(height: 20),
                  PageDotWidget(
                    // key: Key('nav-dot-1'),
                    onTap: () => navigationShell.goBranch(1),
                    active: index == 1,
                  ),
                  SizedBox(height: 20),
                  PageDotWidget(
                    onTap: () => navigationShell.goBranch(2),
                    active: index == 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
