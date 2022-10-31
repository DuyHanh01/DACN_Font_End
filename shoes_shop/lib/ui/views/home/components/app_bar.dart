import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

AppBar appBar(BuildContext context) {
  final cartViewModel = Provider.of<CartViewModel>(context);
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
              badgeContent: Text(cartViewModel.carts.length.toString(), style: numberSoppingCart),
              badgeColor: AppColors.red,
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                ),
                onPressed: () {Navigator.pushNamed(context, RoutePaths.cart);},
              ))),
      const SizedBox(width: 15)
    ],
  );
}