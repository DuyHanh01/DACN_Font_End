import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/config/theme.dart';

AppBar buildAppBar(BuildContext context, String? title) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title!,
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop(true);
        },
        icon: SvgPicture.asset(AppUI.back,
            color: AppColors.black, height: 24, width: 24),
      ),
    ),
  );
}
