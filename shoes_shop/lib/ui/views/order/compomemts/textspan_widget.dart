import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
Widget buildTextSpan(String textSpan, String text) {
  return Text.rich(
    TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: textSpan,
          style: shoesTextStyle,
        ),
        TextSpan(text: text, style: orderTextSpanStyle),
      ],
    ),
  );
}