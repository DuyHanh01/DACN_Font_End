import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingHome extends StatelessWidget {

  const RatingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RatingBar.builder(
            initialRating: 3,
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
