import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/order/compomemts/textspan_widget.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
    return BaseView<OrderViewModel>(
        onModelReady: (model) => model.getOrderByAccountId(account.accountId),
        builder: (BuildContext context, OrderViewModel model, Widget? child) =>
            model.state == ViewState.Busy
                ? const Scaffold(body: CircleDelay())
                : Scaffold(
              appBar: buildAppBar(context, 'Your Order'),
                    body: ListView.builder(
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
                                          model.orders![index]!.createdate),
                                      const SizedBox(height: 2),
                                      buildTextSpan('Total: ',
                                          '\$${model.orders![index]!.total}'),
                                      const SizedBox(height: 2),
                                      buildTextSpan(
                                          'Status: ',
                                          model.orders![index]!.statusid
                                              .toString()),
                                    ],
                                  ),
                                ),
                              ));
                        }),
                    bottomNavigationBar:
                        const CustomBottomNavBar(selectedMenu: MenuState.order),
                  ));
  }
}
