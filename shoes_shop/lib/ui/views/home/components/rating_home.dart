import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingHome extends StatelessWidget {

  final double size;
  const RatingHome({Key? key, required this.size}) : super(key: key);

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
            itemSize: size,
            itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (rating) {})
      ],
    );
  }
}
