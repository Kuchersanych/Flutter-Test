import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/expanded_single_child_scroll_view.dart';
import 'package:scan_me/ui/pages/main/widgets/featured_news_card.dart';
import 'package:scan_me/ui/pages/news/news_page_vm.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class NewsPage extends StatelessWidget {
  /// Пример описания виджета
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((NewsPageVM value) => value.state);

    final featuredNews = state.featuredNews;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: ExpandedSingleChildScrollView(
          child: Column(
            children: [
              FeaturedNewsCard(
                width: double.infinity,
                featuredNews: featuredNews,
                onTapNews: () {},
                isActive: false,
                isShowBack: true,
              ),
              SizedBox(height: 20.a),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.a),
                child: Text(
                  featuredNews.description ?? '',
                  style: context.mBlack16(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
