import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/search_history/components/body.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

import '../../widgets/app_bar_tab.dart';

class SearchHistoryView extends StatefulWidget {
  const SearchHistoryView({Key? key}) : super(key: key);

  @override
  State<SearchHistoryView> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistoryView>
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
    return BaseView<SearchHistoryViewModel>(
        onModelReady: (model) => model.getShoesSearch(account.accountid),
        builder: (BuildContext context, SearchHistoryViewModel model,
                Widget? child) =>
            model.state == ViewState.Busy
                ? const Scaffold(body: CircleDelay())
                : Scaffold(
                    appBar: buildAppBar(
                        context, "Search", _tabController),
                    body: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Center(
                          child: Body(model: model, x: 0),
                        ),
                        Center(child: Body(model: model, x: 1)),
                        Center(
                          child: Body(model: model, x: 2),
                        )
                      ],
                    )));
  }
}
