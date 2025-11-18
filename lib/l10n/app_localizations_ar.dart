import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'توصيل الطعام';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signingIn => 'جارٍ تسجيل الدخول...';

  @override
  String get catalogLabel => 'الكتالوج';

  @override
  String get cartLabel => 'السلة';

  @override
  String get profileLabel => 'الملف الشخصي';

  @override
  String get welcome => 'مرحبًا!';

  @override
  String get homeReady => 'هيكل تطبيق التوصيل جاهز.';

  @override
  String routeError(String error) {
    return 'خطأ في المسار: $error';
  }

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeSystem => 'النظام';
}
