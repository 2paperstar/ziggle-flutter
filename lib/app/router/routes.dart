import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:ziggle/app/modules/notices/presentation/pages/feed_page.dart';
import 'package:ziggle/app/modules/splash/presentation/pages/splash_page.dart';

part 'paths.dart';

abstract class AppRoutes {
  static final config = GoRouter(
    initialLocation: _Paths.splash,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: _Paths.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: _Paths.feed,
        builder: (context, state) => const FeedPage(),
      ),
    ],
  );
}