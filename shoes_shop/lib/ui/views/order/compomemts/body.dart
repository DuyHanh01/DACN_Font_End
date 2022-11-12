import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/button_style.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/order/compomemts/textspan_widget.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';
class Body extends StatelessWidget {
  final OrderViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: model.orders!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                  RoutePaths.orderDetail,
                  arguments: model.orders![index]),
              child: Card(
                color: AppColors.white,
                margin: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          'OrderId: ${model.orders![index]!.orderid}',
                          style: orderTextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 15)),
                      const SizedBox(height: 3),
                      buildTextSpan('Name: ',
                          '${model.orders![index]!.firstName} ${model.orders![index]!.lastName}'),
                      const SizedBox(height: 2),
                      buildTextSpan('Phone: ',
                          model.orders![index]!.phone),
                      const SizedBox(height: 2),
                      buildTextSpan('Email: ',
                          model.orders![index]!.email),
                      const SizedBox(height: 2),
                      buildTextSpan('Address: ',
                          model.orders![index]!.address),
                      const SizedBox(height: 2),
                      buildTextSpan('CreateDate: ',
                          model.orders![index]!.createdate!),
                      const SizedBox(height: 2),
                      buildTextSpan('Total: ',
                          '\$${model.orders![index]!.total}'),
                      const SizedBox(height: 2),
                      buildTextSpan(
                          'Status: ',
                          model.orders![index]!.statusname
                              .toString()),
                      const SizedBox(height: 2),
                      buildTextSpan(
                          'Payment: ',
                          model.orders![index]!.payment ? 'paid' : 'unpaid'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          (model.orders![index]!.statusid==4 || model.orders![index]!.statusid==5) ? const Text(""):
                          AppButton.normalButton(title: 'Cancel', onPress: () async {
                            await model.cancelOrder(model.orders![index]!.orderid!);
                            buildToast(model.errorMessage);
                          }, height: 30, width: 100)
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
