import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/search_history.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:substring_highlight/substring_highlight.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  final ShoesViewModel model;
  Search({super.key, required this.model});

  late TextEditingController controller;
  late TextEditingValue textEditingValue;

  static String _displayStringForOption(Shoes option) => option.shoename;

  @override
  Widget build(BuildContext context) {
    List<Shoes?>? list = model.shoes;
    List<Shoes> kOptions = [];

    for (int i = 0; i < list!.length; i++) {
      String name = list[i]!.shoename.toLowerCase();
      kOptions.add(list[i]!);
      kOptions[i].shoename = name;
    }

    Account account = Provider.of<Account>(context);
    SearchHistoryViewModel searchHistoryViewModel = Provider.of<SearchHistoryViewModel>(context);

    return SliverToBoxAdapter(
      child: Autocomplete<Shoes>(
        displayStringForOption: _displayStringForOption,
        optionsBuilder: (textEditingValue) {
          this.textEditingValue = textEditingValue;
          if (textEditingValue.text == '') {
            return const Iterable<Shoes>.empty();
          }
          return kOptions.where((Shoes option) {
            return option.shoename
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        optionsViewBuilder: (context, Function(Shoes) onSelected, options) {
          return Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 15,
                        color: AppColors.primaryColor.withOpacity(0.3))
                  ]),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Image.network(
                        option.image1,
                        height: 55,
                        width: 55,
                        fit: BoxFit.cover,
                      ),
                      title: SubstringHighlight(
                        text: option.shoename,
                        term: controller.text,
                        textStyleHighlight: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                      subtitle: model.checkTimeSale(option)
                          ? Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\$${option.saleprice}  ',
                                    style: shoesSalePrice,
                                  ),
                                  TextSpan(
                                      text: '\$${option.price}',
                                      style: shoesPriceOld),
                                ],
                              ),
                            )
                          : Text(
                              '\$${option.price}',
                              style: shoesTextStyle,
                            ),
                      onTap: () async {
                        Navigator.of(context).pushNamed(RoutePaths.detailView,
                            arguments: option);
                        var searchHistory = SearchHistory(
                            null, account.accountid, option.shoename);
                        await searchHistoryViewModel
                            .insertSearchHistory(searchHistory);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: options.length,
              ),
            ),
          );
        },
        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
          this.controller = controller;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      color: AppColors.primaryColor.withOpacity(0.3))
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: AppColors.primaryColor),
                    controller: controller,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: S.of(context).search,
                      hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: 16),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            String search = textEditingValue.text;
                            var searchHistory =
                                SearchHistory(null, account.accountid, search);
                            await searchHistoryViewModel
                                .insertSearchHistory(searchHistory);
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushNamed(RoutePaths.searchHistory);
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 30,
                            color: AppColors.primaryColor,
                          )),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        },
        onSelected: (Shoes selection) {},
      ),
    );
  }
}
