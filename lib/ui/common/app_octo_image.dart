import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class AppOctoImage extends StatelessWidget {
  /// Виджет для показа загруженного изображения.
  const AppOctoImage({super.key,
    required this.imageUrl,
    this.size = 50,
  });

  /// Url изображения новости.
  final String imageUrl;

  /// Размер лоадера.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
      ),
      clipBehavior: Clip.hardEdge,
      child: OctoImage(
        fit: BoxFit.fill,
        height: double.infinity,
        image: NetworkImage(imageUrl),
        progressIndicatorBuilder: (_, __) {
          return Center(
            child: SizedBox(
              height: size.a,
              width: size.a,
              child: CircularProgressIndicator(
                color: context.theme.dividerColor,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stacktrace) => const Icon(Icons.error),
      ),
    );
  }
}
