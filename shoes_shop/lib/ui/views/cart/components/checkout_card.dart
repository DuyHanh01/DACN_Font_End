import 'package:flutter/material.dart';
import 'package:shoes_shop/core/utils/utils.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);


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
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$${sumCart()}",
                        style: shoesTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double sumCart (){
    double sum = 0;
    for (var element in Utils.carts) {
      sum += element.price*element.purchased;
    }
    return sum;
  }
}
