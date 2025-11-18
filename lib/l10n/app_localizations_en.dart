import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Delivery Food';

  @override
  String get loginTitle => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get signIn => 'Sign in';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get catalogLabel => 'Catalog';

  @override
  String get cartLabel => 'Cart';

  @override
  String get profileLabel => 'Profile';

  @override
  String get welcome => 'Welcome!';

  @override
  String get homeReady => 'Your delivery app scaffold is ready.';

  @override
  String routeError(String error) {
    return 'Route error: $error';
  }

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';
}
