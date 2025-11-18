import 'package:flutter/material.dart';
import 'package:delivery_food/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Text(
          t.profileLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}