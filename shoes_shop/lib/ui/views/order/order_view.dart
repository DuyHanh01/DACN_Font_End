import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/order/compomemts/app_bar.dart';
import 'package:shoes_shop/ui/views/order/compomemts/body.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';
class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    Account account = Provider.of<Account>(context);
    return BaseView<OrderViewModel>(
        onModelReady: (model) => model.getOrderByAccountId(account.accountid),
        builder: (BuildContext context, OrderViewModel model, Widget? child) =>
            Scaffold(
                    appBar: appBar(context),
                    body: Body(model: model),
                    bottomNavigationBar:
                    CustomBottomNavBar(selectedMenu: MenuState.order, provider: provider),
                  ));
  }
}
