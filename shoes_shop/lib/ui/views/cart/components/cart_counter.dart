import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/cart/components/alertDialogCart.dart';
import 'package:shoes_shop/ui/views/cart/components/snack_bar_cart.dart';

class CartCounter extends StatelessWidget {
  const CartCounter(
      {Key? key,
      required this.cart,
      required this.cartViewModel,
      required this.sizeTableViewModel})
      : super(key: key);

  final Cart cart;
  final CartViewModel cartViewModel;
  final SizeTableViewModel sizeTableViewModel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            cart.quantity == 1
                ? showDialog(
                    context: context,
                    builder: (ctx) =>
                        buildAlertDialog(context, cartViewModel, cart))
                : cartViewModel.subPurchased(cart);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            cart.quantity.toString().padLeft(2, "0"),
            style: shoesTextStyle.copyWith(fontSize: 14),
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () async {
              await sizeTableViewModel.getSizeTableByShoeId(cart.shoeid);
              if (sizeTableViewModel.checkAmountSize(
                  sizeTableViewModel.sizetables![0]!, cart)) {
                if (cart.quantity < 5) {
                  cartViewModel.addPurchased(cart);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
                }
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
              }
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
