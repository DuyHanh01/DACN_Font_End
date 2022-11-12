import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/order.dart';
import 'package:shoes_shop/core/models/rating.dart';
import 'package:shoes_shop/core/view_models/orderdetails_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/order/compomemts/textspan_widget.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class OrderDetailsView extends StatelessWidget {
  final Order order;
  OrderDetailsView({Key? key, required this.order}) : super(key: key);
  double rate = 5.0;

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return BaseView<OrderDetailsViewModel>(
        onModelReady: (model) => model.getOrderDetails(order.orderid!),
        builder: (BuildContext context, OrderDetailsViewModel model,
                Widget? child) =>
            Scaffold(
              appBar: buildAppBar(context, 'Order: ${order.orderid}'),
              body: model.state == ViewState.Busy
                  ? const CircleDelay()
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: model.orderDetails!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Rate This Product',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            RatingBar.builder(
                                                initialRating: 5,
                                                minRating: 0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 40,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                onRatingUpdate: (rating) {
                                                  if(rating!=0){
                                                    rate = rating;
                                                  }
                                                }),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              var rating = Rating(account.accountId, model.orderDetails![index]!.shoeid, rate);
                                              if (order.statusid == 4)
                                              {
                                                await model.insertRating(rating);buildToast(model.errorMessageRating);
                                              } else {
                                                buildToast('Bạn chưa thể đánh giá sản phẩm này');
                                              }
                                              Navigator.pop(context, 'OK');
                                            },
                                            child: const Text('OK',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .primaryColor)),
                                          ),
                                        ],
                                      ));
                            },
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
