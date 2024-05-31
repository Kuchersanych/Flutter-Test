import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.decoration,
    this.height,
    this.color,
    super.key});

  final Widget child;
  final Decoration? decoration;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 103.a,
      width: 358.a,
      decoration: decoration ?? BoxDecoration(
        color: color ?? context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 0,
            blurRadius: 20.a,
            offset: Offset(4.a, 4.a), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
