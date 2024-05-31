import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/domain/services/main_service.dart';
import 'package:scan_me/ui/navigation/navigation.gr.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';
import 'package:scan_me/util/vm_utils.dart';

class MainState {
  /// Состояние [MainVM]
  MainState({
    this.featuredNews = const [],
    this.latestNews = const [],
    this.isCollapsed = false,
  });

  /// Массив рекомендованных новостей.
  final List<Article> featuredNews;

  /// Массив последних новостей.
  final List<Article> latestNews;

  /// Состояние ленты рекомендуемых новостей.
  final bool isCollapsed;

  MainState copyWith({
    List<Article>? featuredNews,
    List<Article>? latestNews,
    bool? isCollapsed,
  }) {
    return MainState(
      featuredNews: featuredNews ?? this.featuredNews,
      latestNews: latestNews ?? this.latestNews,
      isCollapsed: isCollapsed ?? this.isCollapsed,
    );
  }
}

/// Управление состоянием [MainPage]
class MainVM extends VMUtils<MainState> {
  final BuildContext context;
  late AbstractNewsService _mainService;

  final controller = ScrollController();

  MainVM(
    super.initialState, {
    required this.context,
    required AbstractNewsService mainService,
  }) {
    _mainService = mainService;
    _getFeaturedNews();
    _getLatestNews();
    controller.addListener(_getController);
  }

  /// Получение списка рекомендованных новостей.
  Future<void> _getFeaturedNews() async {
    doFuture(
        future: _mainService.getFeaturedNews(),
        onValue: (value) {
          notify(state.copyWith(featuredNews: value));
        });
  }

  /// Получение списка последних новостей.
  Future<void> _getLatestNews() async {
    doFuture(
        future: _mainService.getLatestNews(),
        onValue: (value) {
          notify(state.copyWith(latestNews: value));
        });
  }

  /// Переход на экран просмотра новости и изменение статуса на "Прочитано".
  void onTapNews(Article news) {
    context.pushRoute(IDataNewsRoute(featuredNews: news));
    _readNews(news);
  }

  /*
  При прочтении рекомендованной новости изменяется
  статус последней новости из-за совпадения
  id
  */

  /// Прочитать новость.
  void _readNews(Article news) {
    var item = state.latestNews.firstWhere((element) => element.id == news.id);
    item.readed = true;
    notify(state.copyWith(latestNews: state.latestNews));
  }

  /// Прочитать все новости.
  void readAllNews() {
    List<Article> newList = [];
    for (var e in state.latestNews) {
      e.readed = true;
      newList.add(e);
    }
    notify(state.copyWith(latestNews: newList));
  }

  /// Преобразование DateTime.
  String getDate(DateTime data) {
    final s = context.s;
    String value;
    var today = DateTime.now();
    var difference = today.difference(data).inDays;
    if (difference < 1) {
      value = s.today;
    } else if (difference > 0 && difference < 30) {
      value = '$difference ${s.daysAgo(difference)}';
    } else if (difference / 30 > 0 && difference / 30 < 12) {
      value = '${difference ~/ 30} ${s.monthsAgo(difference ~/ 30)}';
    } else {
      value = DateFormat('yMd').format(data);
    }
    return value;
  }

  /// Контроллер скролла для изменения верхнего виджета.
  void _getController() {
    notify(
      state = state.copyWith(isCollapsed: controller.offset > 20.9),
    );
  }
}
