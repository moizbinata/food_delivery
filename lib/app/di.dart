import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/network/dio_client.dart';

import 'env.dart';
import 'theme_controller.dart';
import '../core/storage/secure_storage_service.dart';

final envConfigProvider = Provider<EnvConfig>((ref) => loadEnv());

final dioProvider = Provider<Dio>((ref) {
  final env = ref.watch(envConfigProvider);
  return createDio(baseUrl: env.apiBaseUrl);
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final base = ref.watch(secureStorageProvider);
  return SecureStorageService(base);
});


final localeProvider = StateProvider<Locale?>((ref) => null);

final themeControllerProvider = StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  final storage = ref.watch(secureStorageProvider);
  final controller = ThemeController(storage);
  controller.load();
  return controller;
});