import 'package:auto_route/auto_route.dart';

import '../navigation.gr.dart';

/// Корневые навигационные роуты приложения
abstract class AppRootRoutes {
  static const empty = AppRouteModel(path: '/empty', name: EmptyRouter.name, page: EmptyRouter.page),
      loading = AppRouteModel(path: 'loading', name: ILoadingRoute.name, page: ILoadingRoute.page),
      somethingWrong = AppRouteModel(
          path: 'something_wrong', name: ISomethingWrongRoute.name, page: ISomethingWrongRoute.page),
      main = AppRouteModel(path: 'main', name: IMainRoute.name, page: IMainRoute.page),
      dataNews = AppRouteModel(path: 'files', name: IDataNewsRoute.name, page: IDataNewsRoute.page);
}

/// Вложенные навигационные роуты приложения
abstract class AppNestedRoutes {}

/// Модель описания роута
class AppRouteModel {
  final String path;
  final String name;
  final PageInfo page;

  const AppRouteModel({
    required this.path,
    required this.name,
    required this.page,
  });
}
