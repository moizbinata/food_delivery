import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class NavigationService {
  final GoRouter _router;
  const NavigationService(this._router);

  void go(String location) => _router.go(location);

  void goSplash() => go(AppRoutes.splash);
  void goLogin() => go(AppRoutes.login);
  void goCatalog() => go(AppRoutes.catalog);
  void goCart() => go(AppRoutes.cart);
  void goProfile() => go(AppRoutes.profile);

}