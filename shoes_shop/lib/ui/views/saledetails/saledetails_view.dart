import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/saledetails/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar_tab.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

// ignore: must_be_immutable
class SaleDetailsView extends StatefulWidget {
  SaleDetailsView({Key? key, required this.sales}) : super(key: key);
  Sales sales;

  @override
  State<SaleDetailsView> createState() => _SaleDetailsViewState();
}

class _SaleDetailsViewState extends State<SaleDetailsView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) =>
            model.getAllShoesBySaleId(account.accountid, widget.sales.saleid),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            model.state == ViewState.Busy
                ? const Scaffold(body: CircleDelay())
                : Scaffold(
                    appBar: buildAppBar(context, widget.sales.salename, _tabController),
                    body: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Center(
                          child: Body(model: model, x: 0),
                        ),
                        Center(
                          child: Body(model: model, x: 1),
                        ),
                        Center(
                          child: Body(model: model,x: 2),
                        ),
                      ],
                    ),
                  ));
  }
}
