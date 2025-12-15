import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/gesture_card_deck.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/landing_section.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/page_dot_widget.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/portfolio_section.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/services_section.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < Breakpoints.tablet;
    final margin = mobile ? 15.0 : 30.0;
    final darkMode = index != 1;
    final color = darkMode
        ? Colors.white
        : Colors.black; // Change text/icon color based on section (assuming services section is light mode)
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
                LandingSection(
                  key: Key('Landind-section'),
                ),
                ServicesSection(),
                PortfolioSection(),
              ],
              onPageChanged: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            // right: 25,
            // top: 0,
            // bottom: 0,
            child: PaginationDotsSection(
              currentIndex: index,
              onDotTapped: (int tappedIndex) {
                setState(() {
                  index = tappedIndex;
                });
              },
              mobile: mobile,
              darkMode: darkMode,
            ),
          ),
          Positioned(
            top: margin,
            right: margin,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.menu,
                color: color,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: margin,
            left: margin,
            child: Row(spacing: 5, children: [
              ResponsiveText(
                '©',
                style: TextStyle(
                  color: color,
                  fontSize: 25,
                  wordSpacing: 3.0,
                  letterSpacing: 3.0,
                ),
                mobileFontSize: 15,
              ),
              ResponsiveText(
                'Storytellernomad',
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  wordSpacing: 3.0,
                  letterSpacing: 3.0,
                ),
                mobileFontSize: 10,
              ),
            ]),
          ),
          Positioned(
            bottom: margin,
            right: margin,
            child: _SocialIcons(darkMode: darkMode),
          ),
        ],
      ),
    );
  }
}

class _SocialIcons extends StatelessWidget {
  const _SocialIcons({required this.darkMode});
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < Breakpoints.tablet;
    final size = mobile ? 16.0 : 24.0;
    final spacing = mobile ? 10.0 : 16.0;
    final color = darkMode ? Colors.white : Colors.black;
    return mobile
        ? Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: [
              Icon(FontAwesomeIcons.instagram, color: color, size: size),
              Icon(FontAwesomeIcons.youtube, color: color, size: size),
              Icon(FontAwesomeIcons.tiktok, color: color, size: size),
              Icon(FontAwesomeIcons.xTwitter, color: color, size: size),
            ],
          )
        : Row(
            spacing: spacing,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.instagram, color: color, size: size),
              Icon(FontAwesomeIcons.youtube, color: color, size: size),
              Icon(FontAwesomeIcons.tiktok, color: color, size: size),
              Icon(FontAwesomeIcons.xTwitter, color: color, size: size),
            ],
          );
  }
}

class PaginationDotsSection extends StatelessWidget {
  const PaginationDotsSection({
    super.key,
    required this.currentIndex,
    required this.onDotTapped,
    this.mobile = false,
    required this.darkMode,
  });
  final int currentIndex;
  final void Function(int) onDotTapped;
  final bool mobile;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PageDotWidget(
            // key: Key('nav-dot-0'),
            onTap: () => onDotTapped(0),
            active: currentIndex == 0,
            mobile: mobile,
            darkMode: darkMode,
          ),
          SizedBox(height: 20),
          PageDotWidget(
            // key: Key('nav-dot-1'),
            onTap: () => onDotTapped(1),
            active: currentIndex == 1,
            mobile: mobile,
            darkMode: darkMode,
          ),
          SizedBox(height: 20),
          PageDotWidget(
            onTap: () => onDotTapped(2),
            active: currentIndex == 2,
            mobile: mobile,
            darkMode: darkMode,
          ),
        ],
      ),
    );
  }
}
