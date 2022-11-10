import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/orderdetails_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/order/compomemts/textspan_widget.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class OrderDetailsView extends StatelessWidget {
  final int orderid;
  const OrderDetailsView({Key? key, required this.orderid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrderDetailsViewModel>(
        onModelReady: (model) => model.getOrderDetails(orderid),
        builder: (BuildContext context, OrderDetailsViewModel model,
                Widget? child) =>
            Scaffold(
              appBar: buildAppBar(context, 'Order: $orderid'),
              body: model.state == ViewState.Busy
                  ? const CircleDelay()
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: model.orderDetails!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {},
                            child: Card(
                              color: AppColors.white,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        model.orderDetails![index]!.image1!,
                                        height: 100,
                                        width: 100,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              model.orderDetails![index]!
                                                  .shoename!,
                                              style: orderTextStyle.copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 15)),
                                          const SizedBox(height: 3),
                                          buildTextSpan(
                                              'Size: ',
                                              model.orderDetails![index]!.size
                                                  .toString()),
                                          const SizedBox(height: 2),
                                          buildTextSpan('Price: ',
                                              '\$${model.orderDetails![index]!.price}'),
                                          const SizedBox(height: 2),
                                          buildTextSpan(
                                              'Quantity: ',
                                              model.orderDetails![index]!
                                                  .quantity
                                                  .toString()),
                                          const SizedBox(height: 2),
                                          buildTextSpan('Total: ',
                                              '\$${model.orderDetails![index]!.total}'),
                                        ],
                                      ),
                                    ],
                                  )),
                            ));
                      }),
            ));
  }
}
