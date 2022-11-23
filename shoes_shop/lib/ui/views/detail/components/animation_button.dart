import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/buttonstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

bool isAnimating = true;

class ButtonStates extends StatefulWidget {
  const ButtonStates(
      {Key? key,
      required this.cartViewModel,
      required this.shoes,
      required this.shoesViewModel})
      : super(key: key);
  final CartViewModel cartViewModel;
  final Shoes shoes;
  final ShoesViewModel shoesViewModel;

  @override
  State<ButtonStates> createState() => _ButtonStatesState();
}

class _ButtonStatesState extends State<ButtonStates> {
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    // update the UI depending on below variable values
    final isInit = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.completed;
    final isCancel = state == ButtonState.cancel;

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
        child: isInit
            ? buildButton()
            : (isCancel
                ? circularCancelContainer(isCancel)
                : circularContainer(isDone)),
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
        child: Text(
          S.of(context).addToBag,
          style: shoesTextStyle,
        ),
        onPressed: () async {
          setState(() {
            state = ButtonState.submitting;
          });
          var success = await widget.cartViewModel.addCart(
              context,
              widget.shoesViewModel,
              widget.cartViewModel,
              widget.shoes,
              widget.shoesViewModel.number);
          //await 2 sec // you need to implement your server response here.
          if (success == true) {
            await Future.delayed(const Duration(milliseconds: 1500));
            setState(() {
              state = ButtonState.completed;
            });
          } else {
            await Future.delayed(const Duration(milliseconds: 1500));
            setState(() {
              state = ButtonState.cancel;
            });
          }

          await Future.delayed(const Duration(seconds: 1));
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

  Widget circularCancelContainer(bool cancel) {
    final color = cancel ? Colors.red : AppColors.primaryColor;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: cancel
            ? const Icon(Icons.cancel, size: 50, color: Colors.white)
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    state = ButtonState.init;
    super.dispose();
  }
}
