import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/buttonstate.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

bool isAnimating = true;

class ButtonStates extends StatefulWidget {
  ButtonStates({Key? key}) : super(key: key);

  @override
  State<ButtonStates> createState() => _ButtonStatesState();
}

class _ButtonStatesState extends State<ButtonStates> {
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;

    // update the UI depending on below variable values
    CartViewModel cartViewModel = CartViewModel();

    final isInit = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.completed;

    return Container(
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        onEnd: () => setState(() {
          isAnimating = !isAnimating;
        }),
        width: state == ButtonState.init ? buttonWidth : 70,
        height: 53,
        // If Button State is Submiting or Completed  show 'buttonCircular' widget as below
        child: isInit ? buildButton() : circularContainer(isDone),
      ),
    );
  }

  // If Button State is init : show Normal submit button
  Widget buildButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          fixedSize: const Size.fromHeight(53),
        ),
        child: const Text(
          "Add to bag",
          style: shoesTextStyle,
        ),
        onPressed: () async {
          // here when button is pressed
          // we are changing the state
          // therefore depending on state our button UI changed.
          setState(() {
            state = ButtonState.submitting;
          });
          //await 2 sec // you need to implement your server response here.
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            state = ButtonState.completed;
          });
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            state = ButtonState.init;
          });
        },
      );

  // this is custom Widget to show rounded container
  // here is state is submitting, we are showing loading indicator on container then.
  // if it completed then showing a Icon.

  Widget circularContainer(bool done) {
    final color = done ? Colors.green : AppColors.primaryColor;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: done
            ? const Icon(Icons.done, size: 50, color: Colors.white)
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
