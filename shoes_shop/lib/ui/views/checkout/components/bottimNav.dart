import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/checkout.dart';
import 'package:shoes_shop/core/models/order.dart';
import 'package:shoes_shop/core/models/orderdetails.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/checkout/components/button_icon.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  const BottomNav(
      {Key? key,
      required this.cartViewModel,
      required this.controllerFirstName,
      required this.controllerLastName,
      required this.controllerPhone,
      required this.controllerEmail,
      required this.controllerAddress,
      required this.controllerNote})
      : super(key: key);
  final CartViewModel cartViewModel;
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerEmail;
  final TextEditingController controllerAddress;
  final TextEditingController controllerNote;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return BaseView<OrderViewModel>(
        builder: (BuildContext context, OrderViewModel model, Widget? child) =>
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -15),
                    blurRadius: 20,
                    color: const Color(0xFFDADADA).withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: shoesTextStyle.copyWith(
                            fontWeight: FontWeight.w500),
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text: "\$${cartViewModel.totalAmount}",
                            style: shoesTextStyle.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: DefaultButton(
                              text: "COD",
                              press: () async {
                                var order = Order(null, account.accountId, 1, null, null, null, controllerFirstName.text, controllerLastName.text, controllerPhone.text, controllerEmail.text, controllerAddress.text, controllerNote.text, cartViewModel.totalAmount, false, null);

                                List<OrderDetails> lstOrderDetails = [];
                                for(int i = 0;i<cartViewModel.carts.length;i++){
                                  var o = OrderDetails(null, cartViewModel.carts[i].shoeid, cartViewModel.carts[i].quantity, cartViewModel.carts[i].size, cartViewModel.carts[i].price, null, null, null, null);
                                  lstOrderDetails.add(o);
                                }
                                var checkout = Checkout(order, lstOrderDetails);
                                await model.insertOrder(checkout);
                                Fluttertoast.showToast(
                                    msg: model.errorMessage,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: AppColors.red.withOpacity(0.7),
                                    textColor: AppColors.white,
                                    fontSize: 14.0);
                                cartViewModel.clear();
                                Navigator.of(context).pushNamed(
                                  RoutePaths.home,
                                );
                              },
                              textColor: AppColors.white,
                              backColor: AppColors.primaryColor),
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ButtonIcon(
                              text: "MOMO", icon: AppUI.momo, press: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
