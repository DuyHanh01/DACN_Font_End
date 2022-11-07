import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/home/components/brand_list.dart';
import 'package:shoes_shop/ui/views/home/components/category_title.dart';
import 'package:shoes_shop/ui/views/home/components/popular_list.dart';
import 'package:shoes_shop/ui/views/home/components/sale_news.dart';
import 'package:shoes_shop/ui/widgets/search.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        Search(),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SaleNews(),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        CategoryTitle(title: 'Category', trailingTitle: ''),
        HomeBrandList(),
        CategoryTitle(title: 'Popular', trailingTitle: 'View All'),
        HomePopularList(),
      ],
    );
  }
}
