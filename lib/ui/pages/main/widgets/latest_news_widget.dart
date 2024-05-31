part of '../main_page.dart';

class _LastedNewsWidget extends StatelessWidget {
  /// Список последних новостей.
  const _LastedNewsWidget({
    required this.latestNews,
    required this.model,
  });

  final List<Article> latestNews;
  final MainVM model;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: latestNews.length,
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.mainWidth.a),
        child: NewsCard(
          onTapNews: () => model.onTapNews(latestNews[index]),
          getDate: model.getDate,
          news: latestNews[index],
        ),
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 20.a,
      ),
    );
  }
}