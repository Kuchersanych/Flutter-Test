import 'package:flutter/material.dart';
import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/pages/main/main_vm.dart';
import 'package:scan_me/ui/pages/main/widgets/featured_news_card.dart';
import 'package:scan_me/ui/pages/main/widgets/news_card.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/app_font_size.dart';
import 'package:scan_me/ui/theme/app_padding.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

class FeaturedNewsWidget extends StatelessWidget {
  /// Карусель рекомендуемых новостей.
  const FeaturedNewsWidget({
    required this.model,
    required this.featuredNews,
    super.key,
  });

  final MainVM model;
  final List<Article> featuredNews;

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return SliverAppBar(
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(
          model.state.isCollapsed ? 103.a : 300.a,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppPadding.mainWidth.a,
                bottom: AppPadding.padding20.a,
              ),
              child: Text(
                s.featured,
                style: context.mBlack18w400(
                  fontSize: AppFontSize.size20.a,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth.a),
              child: Container(
                height: model.state.isCollapsed ? 103.a : 300.a,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    AppBorderRadius.radius12,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.shadowCardColor,
                      spreadRadius: 0,
                      blurRadius: 10.a,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => model.state.isCollapsed
                      ? _CollapsedFeaturedNewsCard(model: model, news: featuredNews[index])
                      : FeaturedNewsCard(
                          onTapNews: () => model.onTapNews(featuredNews[index]),
                          featuredNews: featuredNews[index],
                        ),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15.a),
                  itemCount: featuredNews.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CollapsedFeaturedNewsCard extends StatelessWidget {
  /// Сжатый виджет списка рекомендуемых новостей.
  const _CollapsedFeaturedNewsCard({
    required this.model,
    required this.news,
  });

  final MainVM model;
  final Article news;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: Curves.ease,
        duration: const Duration(milliseconds: 600),
        builder: (BuildContext context, double opacity, Widget? child) {
          return Opacity(
              opacity: opacity,
              child: NewsCard(
                onTapNews: () => model.onTapNews(news),
                getDate: model.getDate,
                news: news,
              ));
        });
  }
}
