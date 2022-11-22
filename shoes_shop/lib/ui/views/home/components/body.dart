import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/views/home/components/brand_list.dart';
import 'package:shoes_shop/ui/views/home/components/category_title.dart';
import 'package:shoes_shop/ui/views/home/components/popular_list.dart';
import 'package:shoes_shop/ui/views/home/components/sale_news.dart';
import 'package:shoes_shop/ui/views/home/components/suggested_products.dart';
import 'package:shoes_shop/ui/widgets/search.dart';

class Body extends StatelessWidget {
  final ShoesViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        Search(model: model),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        const SaleNews(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        const CategoryTitle(title: 'Category', trailingTitle: ''),
        const HomeBrandList(),
        const CategoryTitle(title: 'Suggest for you', trailingTitle: ''),
        SuggestedProducts(shoesViewModel: model),
        const CategoryTitle(title: 'Popular', trailingTitle: 'View All'),
        HomePopularList(model: model),
      ],
    );
  }
}
