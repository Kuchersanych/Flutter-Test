import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/app_ink_well.dart';
import 'package:scan_me/ui/common/app_octo_image.dart';
import 'package:scan_me/ui/resources/assets_path.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class FeaturedNewsCard extends StatelessWidget {
  /// Карточка рекомендованной новости.
  const FeaturedNewsCard({
    super.key,
    required this.featuredNews,
    required this.onTapNews,
    this.height,
    this.width,
    this.isActive = true,
    this.isShowBack = false,
  });

  /// Рекомендуемая новость.
  final Article featuredNews;

  /// Колбек на нажатие по карточке новости.
  final VoidCallback onTapNews;

  /// Высота карточки.
  final double? height;

  /// Ширина карточки.
  final double? width;

  /// Активноть карточки для нажатия.
  final bool isActive;

  /// Показать стрелку возврата на предыдущую страницу.
  final bool isShowBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.theme.transparent,
      onTap: isActive ? onTapNews : null,
      child: SizedBox(
        height: height ?? 300.a,
        width: width ?? 300.a,
        child: Stack(
          children: [
            AppOctoImage(imageUrl: featuredNews.imageUrl),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.a,
                  vertical: 40.a,
                ),
                child: Text(
                  featuredNews.title,
                  style: context.mBlack18w400(fontSize: 28.a, color: context.theme.scaffoldBackgroundColor),
                  maxLines: 2,
                ),
              ),
            ),
            if (isShowBack)
              Align(
                alignment: Alignment.topLeft,
                child: AppInkWell(
                  splashColor: context.theme.transparent,
                  onTap: () => context.popRoute(true),
                  child: Padding(
                    padding: EdgeInsets.only(top: 47.0.a, left: 16.a),
                    child: Image.asset(AssetsPath.chevronLeftWhite),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
