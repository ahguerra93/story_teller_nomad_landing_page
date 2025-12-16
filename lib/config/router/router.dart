import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/pages/contact_page/contact_page.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/home_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => ContactPage(),
    ),
    GoRoute(
      path: '/photo-gallery',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/video-gallery',
      builder: (context, state) => HomePage(),
    ),
  ],
);
