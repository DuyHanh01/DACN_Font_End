import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/button_style.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

class Body extends StatelessWidget {
  final String paymentStatus;
  const Body({Key? key, required this.paymentStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("VHIT Shop Sneaker", style: shoesTextStyle.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w700, fontSize: 30),),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(paymentStatus, style: shoesTextStyle.copyWith(fontSize: 24)),
          ],
        ),
        const SizedBox(height: 30),
        AppButton.normalButton(
          title: "Go Back Shop",
          onPress: () => Navigator.pushNamed(context, RoutePaths.home),
        )
      ],
    );
  }
}
