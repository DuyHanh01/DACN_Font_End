import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/home/components/shoe_search_item.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class SuggestedProducts extends StatelessWidget {
  const SuggestedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
    return BaseView<SearchHistoryViewModel>(
        onModelReady: (model) => model.getShoesSearch(account.accountid),
        builder: (BuildContext context, SearchHistoryViewModel model,
                Widget? child) =>
            SliverToBoxAdapter(
              child: SizedBox(
                height: 135,
                child: model.state == ViewState.Busy
                    ? const CircleDelay()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: model.shoesSearch?.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed(
                                RoutePaths.detailView,
                                arguments: model.shoesSearch![i],
                              ),
                              child: ShoesSearchItem(model: model, index: i),
                            ),
                          );
                        },
                      ),
              ),
            ));
  }
}
