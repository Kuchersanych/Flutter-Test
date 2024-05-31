part of 'app_factory.dart';

/// Фабрика экранов

/// Каждый класс текущего файла именуется в формате:
/// I(интеррфейс)
/// +
/// HomePage(название возвращаемого виджета)
///
/// Помечается аннотацией [@RoutePage()]
///
/// И служит для возможности внедрения зависимостей
/// Example: IHomePage

@RoutePage()
class ILoadingPage implements AutoRouteWrapper {
  const ILoadingPage();

  @override
  Widget wrappedRoute(_) {
    return Provider(
      create: _diContainer._makeLoadingVM,
      child: const LoadingPage(),
    );
  }
}

@RoutePage()
class ISomethingWrongPage implements AutoRouteWrapper {
  const ISomethingWrongPage(this.msg);

  final String msg;

  @override
  Widget wrappedRoute(_) {
    return SomethingWrongPage(msg: msg);
  }
}

@RoutePage()
class IDataNewsPage implements AutoRouteWrapper {

  final Article featuredNews;
  const IDataNewsPage(
      this.featuredNews,
      );

  @override
  Widget wrappedRoute(_) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _diContainer._makeNewsVM(context, featuredNews),
      child: const NewsPage(),
    );
  }
}

@RoutePage()
class IMainPage implements AutoRouteWrapper {
  const IMainPage();

  @override
  Widget wrappedRoute(_) {
    return ChangeNotifierProvider(
      create: _diContainer._makeMainVM,
      child: const MainPage(),
    );
  }
}
