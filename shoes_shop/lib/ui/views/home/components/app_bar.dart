import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'VHIT Sneaker',
      style: appBarStyle,
    ),
    actions: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Badge(
              badgeContent: const Text('0', style: numberSoppingCart),
              badgeColor: AppColors.red,
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                ),
                onPressed: () {Navigator.pushNamed(context, '/cart');},
              ))),
      const SizedBox(width: 15)
    ],
  );
}