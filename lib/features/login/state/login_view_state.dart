import 'package:flutter/material.dart';
class LoginViewState {
  final bool isLoading;
  final bool hasError;
  final String? loginTitle;
  final Locale? locale;

  const LoginViewState({this.isLoading = false, this.hasError = false, this.loginTitle, this.locale});

  LoginViewState copyWith({bool? isLoading, bool? hasError, String? loginTitle, Locale? locale}) => LoginViewState(
        isLoading: isLoading ?? this.isLoading,
        hasError: hasError ?? this.hasError,
        loginTitle: loginTitle ?? this.loginTitle,
        locale: locale ?? this.locale,
      );
}