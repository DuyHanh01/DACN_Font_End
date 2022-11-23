import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

AppBar appBar(BuildContext context) {
  final cartViewModel = Provider.of<CartViewModel>(context);
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      S.of(context).titleAppBar,
      style: appBarTextStyle,
    ),
    actions: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Badge(
              label: Text(cartViewModel.itemCount.toString(), style: numberSoppingCart),
              backgroundColor: AppColors.red,
              child: Padding(
                padding: const EdgeInsets.only(top:10),
                child: GestureDetector(
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                  ),
                  onTap: () {Navigator.pushNamed(context, RoutePaths.cart);},
                ),
              ))),
      const SizedBox(width: 15)
    ],
  );
}