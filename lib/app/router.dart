import 'package:delivery_food/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_food/l10n/app_localizations.dart';

// Navigation shell removed to show only Splash as first screen
import '../features/login/presentation/screen/login_view.dart';

GoRouter? appRouter;

final routerProvider = Provider<GoRouter>((ref) {

  bool isProtected(String location) {
    return location.startsWith('/cart') || location.startsWith('/profile');
  }

  final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginView(),
        // redirect: ,
      ),
    ],
    errorBuilder: (context, state) {
      final t = AppLocalizations.of(context)!;
      return Scaffold(
        body: Center(
          child: Text(t.routeError('${state.error}')),
        ),
      );
    },
  );
  appRouter = router;
  return router;
});