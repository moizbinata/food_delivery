import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeController extends StateNotifier<ThemeMode> {
  final FlutterSecureStorage _storage;
  bool _loaded = false;

  ThemeController(this._storage) : super(ThemeMode.system);

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    final value = await _storage.read(key: 'theme_mode');
    switch (value) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      case 'system':
      default:
        state = ThemeMode.system;
        break;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final str = mode == ThemeMode.light
        ? 'light'
        : mode == ThemeMode.dark
            ? 'dark'
            : 'system';
    await _storage.write(key: 'theme_mode', value: str);
  }
}