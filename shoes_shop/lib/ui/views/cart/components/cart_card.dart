import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/cart/components/cart_counter.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cart, required this.cartViewModel})
      : super(key: key);

  final Cart cart;
  final CartViewModel cartViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SizeTableViewModel>(
        builder: (BuildContext context, SizeTableViewModel model,
                Widget? child) =>
            Card(
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(cart.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColors.black.withOpacity(.05),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        cart.shoename,
                        style: shoesTextStyle.copyWith(
                            color: AppColors.primaryColor, fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Size: ${cart.size}',
                        style: shoesTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          text: "\$${cart.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontSize: 12),
                          children: [
                            TextSpan(
                                text: " x${cart.quantity}",
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      CartCounter(
                          cart: cart,
                          cartViewModel: cartViewModel,
                          sizeTableViewModel: model),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ));
  }
}
