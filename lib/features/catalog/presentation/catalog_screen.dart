import 'package:flutter/material.dart';
import 'package:delivery_food/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_food/app/theme.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).extension<AppColors>();
    final scheme = Theme.of(context).colorScheme;
    final cardColor = appColors?.catalogCard ?? scheme.surfaceContainerHighest;
    final onCardColor = appColors?.catalogCardOn ?? Theme.of(context).colorScheme.onSurface;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            color: cardColor,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/seed/${index + 1}/800/400',
                    height: 160.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${t.catalogLabel} ${index + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: onCardColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: onCardColor),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}