import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

AlertDialog buildAlertDialog(
    BuildContext context, CartViewModel cartViewModel, Cart cart) {
  return AlertDialog(
    title: Text(S.of(context).areYouSure, style: shoesTextStyle),
    content: Text(
      S.of(context).removeItem,
      style: shoesTextStyle,
    ),
    actions: <Widget>[
      TextButton(
        child: Text(
          S.of(context).no,
          style: shoesTextStyle,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
      TextButton(
        child: Text(
          S.of(context).yes,
          style: shoesTextStyle,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
          cartViewModel.removeItem(cart.shoeid, cart.size);
        },
      ),
    ],
  );
}
