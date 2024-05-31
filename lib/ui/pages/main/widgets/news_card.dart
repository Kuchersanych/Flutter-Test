import 'package:flutter/material.dart';
import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/app_card.dart';
import 'package:scan_me/ui/common/app_ink_well.dart';
import 'package:scan_me/ui/common/app_octo_image.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/app_font_size.dart';
import 'package:scan_me/ui/theme/app_padding.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class NewsCard extends StatelessWidget {
  /// Карточка последней новости.
  const NewsCard({
    required this.news,
    required this.onTapNews,
    required this.getDate,
    super.key,
  });

  /// Новость.
  final Article news;

  /// Колбек на нажатие по карточке новости.
  final VoidCallback onTapNews;

  /// Преобразование DateTime.
  final Function(DateTime) getDate;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTapNews,
      child: AppCard(
        color: news.readed ? context.theme.scaffoldBackgroundColor : context.theme.unreadNewsColor,
        child: Padding(
          padding: EdgeInsets.all(AppPadding.padding20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60.a,
                width: 90.a,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppBorderRadius.radius12,
                  ),
                ),
                child: AppOctoImage(
                  imageUrl: news.imageUrl,
                  size: AppFontSize.size20.a,
                ),
              ),
              SizedBox(width: 20.a),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      maxLines: 2,
                      style: context.mBlack16(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      getDate(news.publicationDate),
                      maxLines: 1,
                      style: context.mGray12(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
