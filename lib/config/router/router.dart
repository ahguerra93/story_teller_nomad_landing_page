import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/home_page.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/landing_section.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/portfolio_section.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/services_section.dart';

final router = GoRouter(initialLocation: '/landing', routes: [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return HomePage(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/landing',
            builder: (context, state) => const LandingSection(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/services',
            builder: (context, state) => const ServicesSection(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/galleries',
            builder: (context, state) => const PortfolioSection(),
          ),
        ],
      ),
    ],
  ),
]);
