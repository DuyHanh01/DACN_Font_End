import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/shoe_not_fav_item.dart';

class SuggestedProducts extends StatelessWidget {
  final ShoesViewModel shoesViewModel;
  const SuggestedProducts({Key? key, required this.shoesViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Shoes> list = [];
    shoesViewModel.getShoesTopPurchased(list);

    Account account = Provider.of<Account>(context);
    return BaseView<SearchHistoryViewModel>(
        onModelReady: (model) => model.getShoesSearch(account.accountid),
        builder: (BuildContext context, SearchHistoryViewModel model,
                Widget? child) =>
            // model.state == ViewState.Busy
            //     ? const SliverToBoxAdapter(child: CircleDelay())
            //     :
            SliverToBoxAdapter(
                    child: model.shoesSearch!.isNotEmpty
                        ? SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.shoesSearch?.length,
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: GestureDetector(
                                    onTap: () =>
                                        Navigator.of(context).pushNamed(
                                      RoutePaths.detailView,
                                      arguments: model.shoesSearch![i],
                                    ),
                                    child: ShoeNotFavItem(
                                        model: model,
                                        shoes: model.shoesSearch![i]!),
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: list.length,
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: GestureDetector(
                                    onTap: () =>
                                        Navigator.of(context).pushNamed(
                                      RoutePaths.detailView,
                                      arguments: list[i],
                                    ),
                                    child: ShoeNotFavItem(
                                        shoes: shoesViewModel.shoes![i]!,
                                        model: shoesViewModel),
                                  ),
                                );
                              },
                            ),
                          ),
                  ));
  }
}
