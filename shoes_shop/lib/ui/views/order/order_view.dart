import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/order/compomemts/app_bar.dart';
import 'package:shoes_shop/ui/views/order/compomemts/body.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';

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
                    appBar: appBar(context),
                    body: Body(model: model),
                    bottomNavigationBar:
                        const CustomBottomNavBar(selectedMenu: MenuState.order),
                  ));
  }
}
