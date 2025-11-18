import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseCoordinator<S> extends StateNotifier<S> {
  BaseCoordinator(super.state);

  void attachRef(WidgetRef ref) {}
}
