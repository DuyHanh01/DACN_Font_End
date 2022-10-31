import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';

AppBar buildAppBar(BuildContext context, CartViewModel cart) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Column(
      children: [
        const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        Text(
          "${cart.carts.length} items",
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: () {Navigator.of(context).pop();},
        icon: SvgPicture.asset(AppUI.back,
            color: AppColors.black, height: 24, width: 24),
      ),
    ),
  );
}