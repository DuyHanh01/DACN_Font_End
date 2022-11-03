import 'package:flutter/material.dart';
class CircleDelay extends StatelessWidget {
  const CircleDelay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Center(
          child: SizedBox(
            height: 45,
            width: 45,
            child: CircularProgressIndicator(
              strokeWidth: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}
