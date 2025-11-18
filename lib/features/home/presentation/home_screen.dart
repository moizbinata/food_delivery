import 'package:flutter/material.dart';
import 'package:delivery_food/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.appTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t.welcome,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                t.homeReady,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}