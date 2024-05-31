part of 'app_factory.dart';

/// Область зависимостей, которые необходимы на протяжении всего жизненого цикла приложения.
class _AppScope implements AbstractAppScope {
  late final AppRouter _router;

  static final _AppScope _instance = _AppScope._();

  @override
  AppRouter get router => _router;

  /// Создайте экземпляр [_AppScope].
  _AppScope._() {
    init();
  }

  /// Инициализация scope.
  Future<void> init() async {
    _initRouter();
  }

  void _initRouter() {
    _router = AppRouter.instance();
  }

  @override
  AbstractAppSharedPreferences get sharedPreferences => AppSharedPreferences();

  @override
  AbstractNewsRepository get newsRepository => MockNewsRepository();
}
