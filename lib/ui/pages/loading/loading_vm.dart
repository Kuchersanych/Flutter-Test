import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/ui/navigation/navigation.gr.dart';
import 'package:scan_me/util/future_utils.dart';

/// Управление состоянием [LoadingPage]
class LoadingVM with FutureUtils {
  ///  Принимаемые параметры
  final BuildContext context;

  LoadingVM(this.context);

  void onEnd() {
    context.router.replace(const IMainRoute());
  }
}
