import 'package:scan_me/util/vm_utils.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/article.dart';

/// Состояние [NewsPageVM]
class NewsPageVMState {
  /// Просматриваемая новость.
  final Article featuredNews;

  NewsPageVMState({
    required this.featuredNews,
  });

  NewsPageVMState copyWith({
    Article? featuredNews,
  }) {
    return NewsPageVMState(
      featuredNews: featuredNews ?? this.featuredNews,
    );
  }
}

/// Управление состоянием [NewsPageVM]
class NewsPageVM extends VMUtils<NewsPageVMState> {
  /// Принимаемые параметры
  final BuildContext context;

  NewsPageVM(
    super.initialState, {
    required this.context,
  });
}
