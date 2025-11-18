import 'package:delivery_food/core/base_classes/base_coordinator.dart';
import 'package:delivery_food/features/login/state/login_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delivery_food/l10n/app_localizations.dart';
import 'package:delivery_food/app/di.dart';

class LoginCoordinator extends BaseCoordinator<LoginViewState> {
  LoginCoordinator() : super(const LoginViewState());
  WidgetRef? _ref;

  void initialize(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final deviceLocale = Localizations.localeOf(context);
    final currentLocale = _ref?.watch(localeProvider) ?? deviceLocale;
    state = state.copyWith(
      isLoading: false,
      hasError: false,
      loginTitle: t.loginTitle,
      locale: currentLocale,
    );
  }

  @override
  void attachRef(WidgetRef ref) {
    _ref = ref;
  }

  void changeLocale(Locale locale) {
    _ref?.read(localeProvider.notifier).state = locale;
    state = state.copyWith(locale: locale);
  }
}
