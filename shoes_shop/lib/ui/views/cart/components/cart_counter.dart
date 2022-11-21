import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key, required this.cart, required this.cartViewModel, required this.sizeTableViewModel})
      : super(key: key);

  final Cart cart;
  final CartViewModel cartViewModel;
  final SizeTableViewModel sizeTableViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            cart.quantity == 1
                ? showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Are you sure?',
                              style: shoesTextStyle),
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
                                Navigator.of(ctx).pop(false);
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'Yes',
                                style: shoesTextStyle,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(true);
                                cartViewModel.removeItem(
                                    cart.shoeid, cart.size);
                              },
                            ),
                          ],
                        ))
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
            press: () {
              if (cart.quantity == 5 ) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Liên hệ shop để order!'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "Contacts",
                    textColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamed(RoutePaths.contact);
                    },
                  ),
                ));
              } else {
                cartViewModel.addPurchased(cart);
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
