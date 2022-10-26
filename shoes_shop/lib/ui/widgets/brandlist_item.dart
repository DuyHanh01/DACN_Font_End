import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/brand.dart';

class BrandListItem extends StatelessWidget {
  final Brand brand;
  final Function()? onTap;
  const BrandListItem({Key? key, required this.brand, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              brand.brandname!,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


