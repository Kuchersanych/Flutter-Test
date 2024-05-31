

import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/app_button.dart';
import 'package:scan_me/ui/resources/assets_path.dart';
import 'package:scan_me/ui/theme/app_size.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// AppBar приложения.
  const CustomAppBar({

    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      actions: [
        SizedBox(
            width: 120.a,
            child: (AppButton(
              onTap: onTap,
              text: context.s.markAllRead,
              textStyle: context.mBlack18w400(),
            )))
      ],
      title: Text(
        context.s.notifications,
        style: context.mBlack18w400(),
      ),
      centerTitle: true,
      leading: Image.asset(AssetsPath.chevronLeft),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.appBarHeight.a);
}
