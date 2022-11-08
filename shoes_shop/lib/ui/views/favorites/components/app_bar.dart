import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
AppBar appBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    title: Text(
      'Your Favorite',
      style: appBarTextStyle,
    ),
  );
}