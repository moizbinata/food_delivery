import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Comida a Domicilio';

  @override
  String get loginTitle => 'Iniciar sesión';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get signIn => 'Entrar';

  @override
  String get signingIn => 'Iniciando...';

  @override
  String get catalogLabel => 'Catálogo';

  @override
  String get cartLabel => 'Carrito';

  @override
  String get profileLabel => 'Perfil';

  @override
  String get welcome => '¡Bienvenido!';

  @override
  String get homeReady => 'Tu aplicación de entrega está lista.';

  @override
  String routeError(String error) {
    return 'Error de ruta: $error';
  }

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';
}
