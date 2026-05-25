import 'package:go_router/go_router.dart';
import 'package:place_on_map/core/navigation/nav_bar.dart';
import 'package:place_on_map/features/map/view/map_page.dart';
import 'package:place_on_map/features/place/view/place_page.dart';

final router = GoRouter(
  initialLocation: '/map',
  routes: [
    ShellRoute(
      builder: (context, state, child) => NavBar(child: child),
      routes: [
        GoRoute(
          path: "/map",
          pageBuilder: (context, state) => NoTransitionPage(child: MapPage()),
        ),
        GoRoute(
          path: "/place",
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const PlacePage()),
        ),
      ],
    ),
  ],
);
