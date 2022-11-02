import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

class CartCounter extends StatelessWidget {
  CartCounter({
    Key? key,
    required this.cart, required this.cartViewModel
  }) : super(key: key);

  final Cart cart;
  final CartViewModel cartViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (cart.purchased > 1) {
              cartViewModel.subPurchased(cart);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            cart.purchased .toString().padLeft(2, "0"),
            style: shoesTextStyle.copyWith(fontSize: 14),
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              cartViewModel.addPurchased(cart);
            }),
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required Function() press}) {
    return SizedBox(
      width: 20,
      height: 20,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: press,
        child: Icon(icon, size: 16),
      ),
    );
  }
}
