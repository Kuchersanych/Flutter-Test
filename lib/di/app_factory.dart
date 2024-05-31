import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/domain/repositories/mock_news_repository.dart';
import 'package:scan_me/domain/services/main_service.dart';
import 'package:scan_me/library/flutter_storages/app_shared_preferences.dart';
import 'package:scan_me/ui/app/app_vm.dart';
import 'package:scan_me/ui/pages/errors_pages/something_wrong_page.dart';
import 'package:scan_me/ui/pages/loading/loading_vm.dart';
import 'package:scan_me/ui/pages/main/main_page.dart';
import 'package:scan_me/ui/pages/main/main_vm.dart';
import 'package:scan_me/ui/app/app.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/ui/pages/loading/loading_page.dart';
import 'package:scan_me/ui/pages/news/news_page.dart';
import 'package:scan_me/ui/pages/news/news_page_vm.dart';

import '../ui/navigation/navigation.dart';

part 'app_scope.dart';

part 'screen_factory.dart';

part 'di_container.dart';

AbstractAppFactory get makeAppFactory => _AppFactory();

final _diContainer = _DIContainer._instance;

late final AbstractAppScope _appScope;

/// Зависимости приложения.
abstract interface class AbstractAppScope {

  /// Навигация.
  AppRouter get router;

  /// Локльное хранилище
  AbstractAppSharedPreferences get sharedPreferences;

  /// Репозиторий новостей.
  AbstractNewsRepository get newsRepository;
}

abstract class AbstractAppFactory {
  Widget makeApp();
}

class _AppFactory implements AbstractAppFactory {
  _AppFactory() {
    _appScope = _AppScope._instance;
  }

  @override
  Widget makeApp() {
    return ChangeNotifierProvider(
      create: _diContainer._makeAppVM,
      child: App(
        config: _appScope.router.config(),
      ),
    );
  }
}
