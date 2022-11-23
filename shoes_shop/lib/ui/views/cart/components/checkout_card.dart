import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
    required this.cartViewModel,
  }) : super(key: key);
  final CartViewModel cartViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    style: shoesTextStyle.copyWith(fontWeight: FontWeight.w500),
                    text: "${S.of(context).total}:\n",
                    children: [
                      TextSpan(
                        text: "\$${cartViewModel.totalAmount}",
                        style: shoesTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: DefaultButton(
                      text: S.of(context).checkout,
                      press: () {
                        if (cartViewModel.itemCount != 0) {
                          Navigator.of(context).pushNamed(RoutePaths.checkout);
                        }
                      },
                      textColor: AppColors.white,
                      backColor: AppColors.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
