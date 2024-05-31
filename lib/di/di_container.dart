part of 'app_factory.dart';

/// Фабрика data

/// Хранимые свойства именуются в формате:
/// _get(получение)
/// +
/// Home(название возвращаемого класса)
/// +
/// VM, Service, Provider (назничение класса)
///
/// Example: _getHomeVM

/// Объявление методов(не хранимых свойств)
///
/// методы именуются в формате:
/// _make(сделать)
/// +
/// Home(название возвращаемого класса)
/// +
/// VM, Service, Provider (назничение класса)
///
/// Example: _makeHomeVM

class _DIContainer {
  static final _DIContainer _instance = _DIContainer._();

  late AbstractNewsService _mainService;

  /// Тут объявляются хранимые свойства
  ///
  ///
  _DIContainer._() {
    _mainService = MockNewsService(newsRepository: _appScope.newsRepository);

    /// Тут инициализируются хранимые свойства
    ///
    ///
  }

  /// app
  AppVM _makeAppVM(BuildContext context) => AppVM(
        AppState(),
        context: context,
      );

  /// loading
  LoadingVM _makeLoadingVM(BuildContext context) => LoadingVM(context);

  /// main
  MainVM _makeMainVM(BuildContext context) => MainVM(
        MainState(),
        context: context,
        mainService: _diContainer._mainService,
      );

  /// news
  NewsPageVM _makeNewsVM(BuildContext context, Article featuredNews) => NewsPageVM(
    NewsPageVMState(featuredNews: featuredNews),
        context: context,
      );
}
