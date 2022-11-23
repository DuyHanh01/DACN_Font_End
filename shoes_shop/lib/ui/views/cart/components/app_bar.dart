import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';

AppBar buildAppBar(BuildContext context, CartViewModel cart) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Column(
      children: [
        Text(
          S.of(context).cart,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        Text(
          "${cart.carts.length} ${S.of(context).items}",
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: () {Navigator.of(context).pop(true);},
        icon: SvgPicture.asset(AppUI.back,
            color: AppColors.black, height: 24, width: 24),
      ),
    ),
  );
}