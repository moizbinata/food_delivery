import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color catalogCard;
  final Color catalogCardOn;
  const AppColors({required this.catalogCard, required this.catalogCardOn});

  @override
  AppColors copyWith({Color? catalogCard, Color? catalogCardOn}) {
    return AppColors(
      catalogCard: catalogCard ?? this.catalogCard,
      catalogCardOn: catalogCardOn ?? this.catalogCardOn,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      catalogCard: Color.lerp(catalogCard, other.catalogCard, t) ?? catalogCard,
      catalogCardOn: Color.lerp(catalogCardOn, other.catalogCardOn, t) ?? catalogCardOn,
    );
  }
}

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C853)),
  useMaterial3: true,
  extensions: const [
    AppColors(catalogCard: Colors.blue, catalogCardOn: Colors.white),
  ],
  scaffoldBackgroundColor: Colors.lightBlueAccent.shade100,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: const ButtonStyle(
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.red),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll<Color>(Colors.red),
      side: WidgetStatePropertyAll<BorderSide>(const BorderSide(color: Colors.red)),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.blue),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.blue),
    actionsIconTheme: IconThemeData(color: Colors.blue),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.lightBlueAccent.shade100,
    indicatorColor: Colors.blueAccent,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      final selected = states.contains(WidgetState.selected);
      return IconThemeData(color: selected ? Colors.blue : Colors.blueGrey);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
      final selected = states.contains(WidgetState.selected);
      return TextStyle(color: selected ? Colors.blue : Colors.blueGrey);
    }),
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Colors.lightBlueAccent.shade100,
    selectedIconTheme: const IconThemeData(color: Colors.blue),
    unselectedIconTheme: const IconThemeData(color: Colors.blueGrey),
    selectedLabelTextStyle: const TextStyle(color: Colors.blue),
    unselectedLabelTextStyle: const TextStyle(color: Colors.blueGrey),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF00C853),
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  extensions: const [
    AppColors(catalogCard: Colors.grey, catalogCardOn: Colors.white),
  ],
  scaffoldBackgroundColor: Colors.grey.shade800,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.grey.shade300),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.grey.shade300),
      side: WidgetStatePropertyAll<BorderSide>(
        BorderSide(color: Colors.grey.shade300),
      ),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.grey.shade300),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.grey.shade300),
    actionsIconTheme: IconThemeData(color: Colors.grey.shade300),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.grey.shade800,
    indicatorColor: Colors.grey.shade600,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      final selected = states.contains(WidgetState.selected);
      return IconThemeData(color: selected ? Colors.grey.shade300 : Colors.grey);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
      final selected = states.contains(WidgetState.selected);
      return TextStyle(color: selected ? Colors.grey.shade300 : Colors.grey);
    }),
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Colors.grey.shade800,
    selectedIconTheme: IconThemeData(color: Colors.grey.shade300),
    unselectedIconTheme: const IconThemeData(color: Colors.grey),
    selectedLabelTextStyle: TextStyle(color: Colors.grey.shade300),
    unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
  ),
);

ThemeData responsiveTheme(ThemeData base) {
  final t = base.textTheme;
  return base.copyWith(
    textTheme: t.copyWith(
      displayLarge: t.displayLarge?.copyWith(fontSize: 48.sp),
      displayMedium: t.displayMedium?.copyWith(fontSize: 42.sp),
      displaySmall: t.displaySmall?.copyWith(fontSize: 36.sp),
      headlineLarge: t.headlineLarge?.copyWith(fontSize: 32.sp),
      headlineMedium: t.headlineMedium?.copyWith(fontSize: 28.sp),
      headlineSmall: t.headlineSmall?.copyWith(fontSize: 24.sp),
      titleLarge: t.titleLarge?.copyWith(fontSize: 22.sp),
      titleMedium: t.titleMedium?.copyWith(fontSize: 18.sp),
      titleSmall: t.titleSmall?.copyWith(fontSize: 16.sp),
      bodyLarge: t.bodyLarge?.copyWith(fontSize: 16.sp),
      bodyMedium: t.bodyMedium?.copyWith(fontSize: 14.sp),
      bodySmall: t.bodySmall?.copyWith(fontSize: 12.sp),
      labelLarge: t.labelLarge?.copyWith(fontSize: 14.sp),
      labelMedium: t.labelMedium?.copyWith(fontSize: 12.sp),
      labelSmall: t.labelSmall?.copyWith(fontSize: 11.sp),
    ),
  );
}