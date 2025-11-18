import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delivery_food/app/router.dart';
import 'navigation_service.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  final router = ref.watch(routerProvider);
  return NavigationService(router);
});