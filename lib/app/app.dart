import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_food/l10n/app_localizations.dart';
import 'package:delivery_food/app/di.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'router.dart';
import 'theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeControllerProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? 'Delivery Food',
      routerConfig: router,
      theme: responsiveTheme(lightTheme),
      darkTheme: responsiveTheme(darkTheme),
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}