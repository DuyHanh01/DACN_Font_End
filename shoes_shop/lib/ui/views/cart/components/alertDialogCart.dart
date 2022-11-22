import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

AlertDialog buildAlertDialog(
    BuildContext context, CartViewModel cartViewModel, Cart cart) {
  return AlertDialog(
    title: const Text('Are you sure?', style: shoesTextStyle),
    content: const Text(
      'Do you want to remove the item from the cart?',
      style: shoesTextStyle,
    ),
    actions: <Widget>[
      TextButton(
        child: const Text(
          'No',
          style: shoesTextStyle,
        ),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
      TextButton(
        child: const Text(
          'Yes',
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
