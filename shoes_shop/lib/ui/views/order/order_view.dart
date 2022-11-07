import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context, listen: false);
    return BaseView<OrderViewModel>(
      onModelReady: (model) => model.getOrderByAccountId(account.accountId),
      builder: (BuildContext context, OrderViewModel model, Widget? child) =>
          model.state == ViewState.Busy
              ? const CircleDelay()
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: model.orders!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            RoutePaths.orderDetail,
                            arguments: model.orders![index]!.orderid),
                        child: Card(
                          color: AppColors.white,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    'OrderId: ${model.orders![index]!.orderid}',
                                    style: shoesTextStyle),
                                const SizedBox(height: 5),
                                Text(
                                    'Create date: ${model.orders![index]!.createdate}'),
                                const SizedBox(height: 3),
                                Text('Total: ${model.orders![index]!.total}'),
                                const SizedBox(height: 3),
                                Text(
                                    'Status: ${model.orders![index]!.statusid}'),
                              ],
                            ),
                          ),
                        ));
                  }),
    );
  }
}
