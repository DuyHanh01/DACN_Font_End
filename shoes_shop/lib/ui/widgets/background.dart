import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';


class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = AppUI.imgTopLogin,
  }) : super(key: key);

  final String topImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              topImage,
              width: 180,
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
