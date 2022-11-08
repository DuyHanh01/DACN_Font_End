import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/checkout/components/button_icon.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key, required this.cartViewModel}) : super(key: key);
  CartViewModel cartViewModel;

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
            Text.rich(
              TextSpan(
                style: shoesTextStyle.copyWith(fontWeight: FontWeight.w500),
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "\$${cartViewModel.totalAmount}",
                    style: shoesTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: DefaultButton(
                      text: "COD",
                      press: () {},
                      textColor: AppColors.white,
                      backColor: AppColors.primaryColor),
                ),
                SizedBox(
                  width: 150,
                  child:
                      ButtonIcon(text: "MOMO", icon: AppUI.momo, press: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
