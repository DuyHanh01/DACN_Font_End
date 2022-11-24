import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/button_style.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/order/compomemts/textspan_widget.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class Body extends StatelessWidget {
  final OrderViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.sortOrder(model.orders);
    return
        // model.state == ViewState.Busy
        //   ? const CircleDelay()
        //   :
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: model.orders!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      RoutePaths.orderDetail,
                      arguments: model.orders![index]),
                  child: Card(
                    color: AppColors.white,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              '${S.of(context).orderId}: ${model.orders![index]!.orderid}',
                              style: orderTextStyle.copyWith(
                                  color: AppColors.primaryColor, fontSize: 15)),
                          const SizedBox(height: 3),
                          buildTextSpan('${S.of(context).name}: ',
                              '${model.orders![index]!.firstName} ${model.orders![index]!.lastName}'),
                          const SizedBox(height: 2),
                          buildTextSpan('${S.of(context).phone}: ',
                              model.orders![index]!.phone),
                          const SizedBox(height: 2),
                          buildTextSpan('${S.of(context).email}: ',
                              model.orders![index]!.email),
                          const SizedBox(height: 2),
                          buildTextSpan('${S.of(context).address}: ',
                              model.orders![index]!.address),
                          const SizedBox(height: 2),
                          buildTextSpan('${S.of(context).createDate}: ',
                              model.orders![index]!.createdate!),
                          const SizedBox(height: 2),
                          buildTextSpan('${S.of(context).total}: ',
                              '\$${model.orders![index]!.total}'),
                          const SizedBox(height: 2),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${S.of(context).status}: ',
                                  style: shoesTextStyle,
                                ),
                                TextSpan(
                                    text: model.orders![index]!.statusname,
                                    style: orderTextSpanStyle.copyWith(
                                        color: model.orders![index]!.statusid!=5
                                            ? AppColors.green : AppColors.red, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${S.of(context).payment}: ',
                                  style: shoesTextStyle,
                                ),
                                TextSpan(
                                    text: model.orders![index]!.payment
                                        ? S.of(context).paid
                                        : S.of(context).unpaid,
                                    style: orderTextSpanStyle.copyWith(
                                        color: model.orders![index]!.payment
                                            ? AppColors.green : AppColors.red, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (model.orders![index]!.statusid == 4 ||
                                      model.orders![index]!.statusid == 5)
                                  ? const Text("")
                                  : AppButton.normalButton(
                                      title: S.of(context).cancel,
                                      onPress: () async {
                                        await model.cancelOrder(
                                            model.orders![index]!.orderid!);
                                        buildToast(model.errorMessage);
                                      },
                                      height: 30,
                                      width: 100)
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
            });
  }
}
