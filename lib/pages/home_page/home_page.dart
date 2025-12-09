import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/gesture_card_deck.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/landing_section.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/page_dot_widget.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/portfolio_section.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/services_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _controller;
  int index = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: index);
    _controller.addListener(
      () {
        final currentPage = _controller.page?.toInt();
        if (currentPage != index) {
          setState(() {
            index = currentPage ?? 0;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureCardDeck(
              currentIndex: index,
              slideCurve: Curves.easeInOutCubic,
              scaleCurve: Curves.easeInOutCubic,
              animationDuration: Duration(milliseconds: 800),
              pages: [
                LandingSection(),
                ServicesSection(),
                PortfolioSection(),
              ],
              onPageChanged: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
            ),
            // PageView(
            //   pageSnapping: true,
            //   scrollDirection: Axis.vertical,
            //   controller: _controller,
            //   children: [
            //     LandingSection(),
            //     ServicesSection(),
            //     PortfolioSection(),
            //   ],
            // ),
          ),
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
                      onTap: () => setState(() => index = 0),
                      active: index == 0,
                    ),
                    SizedBox(height: 20),
                    PageDotWidget(
                      // key: Key('nav-dot-1'),
                      onTap: () => setState(() => index = 1),
                      active: index == 1,
                    ),
                    SizedBox(height: 20),
                    PageDotWidget(
                      onTap: () => setState(() => index = 2),
                      active: index == 2,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
