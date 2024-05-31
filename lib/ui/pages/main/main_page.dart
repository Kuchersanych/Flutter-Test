import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/custom_app_bar.dart';
import 'package:scan_me/ui/pages/main/main_vm.dart';
import 'package:scan_me/ui/pages/main/widgets/featured_news_widget.dart';
import 'package:scan_me/ui/pages/main/widgets/news_card.dart';
import 'package:scan_me/ui/theme/app_font_size.dart';
import 'package:scan_me/ui/theme/app_padding.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

part 'widgets/header_latest_news.dart';

part 'widgets/latest_news_widget.dart';

class MainPage extends StatelessWidget {
  /// Главный экран.
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainVM>();
    final state = context.select((MainVM value) => value.state);

    return Scaffold(
      appBar: CustomAppBar(
        onTap: model.readAllNews,
      ),
      body: CustomScrollView(
        controller: model.controller,
        slivers: [
          FeaturedNewsWidget(
            model: model,
            featuredNews: state.featuredNews,
          ),
          const _HeaderLatestNews(),
          _LastedNewsWidget(latestNews: state.latestNews, model: model),
          SliverToBoxAdapter(
            child: SizedBox(height: 40.a),
          )
        ],
      ),
    );
  }
}
