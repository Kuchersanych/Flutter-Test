part of '../main_page.dart';

class _HeaderLatestNews extends StatelessWidget {
  /// Заголовок 'Последние новости'.
  const _HeaderLatestNews();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      backgroundColor: context.theme.scaffoldBackgroundColor.withOpacity(0.95),
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.a),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.mainWidth.a,
            vertical: AppPadding.padding20.a,
          ),
          child: Row(
            children: [
              Text(
                textAlign: TextAlign.left,
                context.s.latestNews,
                style: context.mBlack18w400(fontSize: AppFontSize.size20.a),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
