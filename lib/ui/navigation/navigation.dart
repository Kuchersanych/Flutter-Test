import 'package:auto_route/auto_route.dart';
import 'package:scan_me/ui/navigation/navigation.gr.dart';

import 'routes/app_routes.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static final AppRouter _router = AppRouter._();
  static const _duration = 500;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: AppRootRoutes.empty.path,
          page: AppRootRoutes.empty.page,
          children: [
            CustomRoute(
              initial: true,
              path: AppRootRoutes.loading.path,
              page: AppRootRoutes.loading.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              durationInMilliseconds: _duration,
            ),
            CustomRoute(
              initial: false,
              path: AppRootRoutes.main.path,
              page: AppRootRoutes.main.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              durationInMilliseconds: _duration,
            ),
            CustomRoute(
              initial: false,
              path: AppRootRoutes.dataNews.path,
              page: AppRootRoutes.dataNews.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              durationInMilliseconds: _duration,
            ),
          ],
        ),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();

  AppRouter._();

  factory AppRouter.instance() => _router;
}
