import 'dart:async';

import 'package:flutter/material.dart';

import 'future_utils.dart';

/// Класс используется для упрощения взаимодействия с [ChangeNotifier],
/// и реализует наиболее часто используемые методы и свойства
abstract class VMUtils<T> extends ChangeNotifier with FutureUtils {
  late T state;

  /// Оформленные подписчики
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  /// Вызов конструктора, при инициализации [VMUtils]
  VMUtils(T initialState) {
    if (initialState != null) {
      state = initialState;
    }
  }

  /// Обновление [state] и уведомление подписчиков
  void notify([T? newState]) {
    assert(
      ChangeNotifier.debugAssertNotDisposed(this),
      'Обновление состояния произошло после закрытия модели, с использованием state ${T.toString()}',
    );

    if (newState != null) {
      state = newState;
    }

    notifyListeners();
  }

  /// Закрывает все ресурсы, используемые объектом. После этого,
  /// его вызова использование текущего экземпляра класса невозможно,
  /// при попытке его использовать произойдет исключение
  ///
  /// Этот метод должен вызываться исключительно в пределах класса унаследованного от [VMUtils].
  @mustCallSuper
  void close() {
    assert(
      ChangeNotifier.debugAssertNotDisposed(this),
      'Вызов метода "close" произошел после закрытия модели, с использованием state ${T.toString()}',
    );

    for (var i in _subscriptions) {
      i.cancel();
    }
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }
}
