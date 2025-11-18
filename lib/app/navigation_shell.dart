import 'package:flutter/material.dart';
import 'package:delivery_food/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final width = ScreenUtil().screenWidth;
    final useRail = width >= 600;
    final extended = width >= 1024;
    final destinations = [
      (icon: const Icon(Icons.storefront), label: t.catalogLabel),
      (icon: const Icon(Icons.shopping_cart), label: t.cartLabel),
      (icon: const Icon(Icons.person), label: t.profileLabel),
    ];
    return Scaffold(
      body: Row(
        children: [
          if (useRail)
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              extended: extended,
              labelType: extended ? NavigationRailLabelType.none : NavigationRailLabelType.all,
              onDestinationSelected: (index) => navigationShell.goBranch(index,
                  initialLocation: index == navigationShell.currentIndex),
              destinations: destinations
                  .map((d) => NavigationRailDestination(icon: d.icon, label: Text(d.label)))
                  .toList(),
            ),
          Expanded(child: navigationShell),
        ],
      ),
      bottomNavigationBar: useRail
          ? null
          : NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => navigationShell.goBranch(index,
                  initialLocation: index == navigationShell.currentIndex),
              destinations: destinations
                  .map((d) => NavigationDestination(icon: d.icon, label: d.label))
                  .toList(),
            ),
    );
  }
}