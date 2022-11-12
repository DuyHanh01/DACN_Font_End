import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';

class RatingHome extends StatelessWidget {

  final ShoesViewModel model;
  final int index;
  const RatingHome({Key? key, required this.model, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RatingBar.builder(
            initialRating: model.shoes?[index]?.rate?? 0,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 12,
            itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (rating) {})
      ],
    );
  }
}
