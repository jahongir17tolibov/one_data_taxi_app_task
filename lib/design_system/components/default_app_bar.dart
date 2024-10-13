import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/design_system/components/text_view.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';

import 'app_back_button.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.titleText = '',
    this.centerTitle = true,
    this.backButtonEnabled = false,
  });

  final String titleText;
  final bool centerTitle;
  final bool backButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: backButtonEnabled ? const AppBackButton() : null,
      title: TextView(
        text: titleText,
        textColor: context.themeColors.onSurface,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
