import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.model}) : super(key: key);
  final ShoesViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          buildOutlineButton(
            icon: Icons.remove,
            press: () {
              if (model.x > 1) {
                model.subPurchased();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              model.x.toString().padLeft(2, "0"),
              style: shoesTextStyle.copyWith(fontSize: 22),
            ),
          ),
          buildOutlineButton(
              icon: Icons.add,
              press: () {
                model.addPurchased();
              }),
        ],
      ),
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required Function() press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
