import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/ui/common/splash_screen/splash.dart';

import 'loading_vm.dart';

class LoadingPage extends StatelessWidget {
  /// Экран загрузки приложения
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoadingVM>();

    return Splash(
      onEnd: model.onEnd,
      durationSec: 2,
    );
  }
}
