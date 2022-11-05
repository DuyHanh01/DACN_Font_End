import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/brandshoes/components/body.dart';

import 'package:shoes_shop/ui/widgets/circle_delay.dart';

import '../../widgets/app_bar_tab.dart';

class BrandShoesView extends StatefulWidget {
  const BrandShoesView({Key? key, required this.brand}) : super(key: key);
  final Brand brand;

  @override
  State<BrandShoesView> createState() => _BrandShoesViewState();
}

class _BrandShoesViewState extends State<BrandShoesView>
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
        onModelReady: (model) => model.getAllShoesByBrandId(
            account.accountId, widget.brand.brandid!),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            model.state == ViewState.Busy
                ? const Scaffold(body: CircleDelay())
                : Scaffold(
                    appBar: buildAppBar(context, widget.brand.brandname, _tabController),
                    body: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Center(
                          child: Body(model: model, x: 0),
                        ),
                        Center(
                          child: Body(model: model, x: 1)
                        ),
                        Center(
                          child: Body(model: model, x: 2),
                        )
                      ],
                    )));
  }
}
