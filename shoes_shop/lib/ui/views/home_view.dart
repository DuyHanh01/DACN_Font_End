import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/brandlist_item.dart';
import 'package:shoes_shop/ui/widgets/feed_news.dart';
import 'package:shoes_shop/ui/widgets/home_bottom_menu_icon.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';
import 'package:shoes_shop/ui/widgets/press_back_button_again_to_exit_app.dart';
import 'package:shoes_shop/ui/widgets/search.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Account user = Provider.of<Account>(context);
    return WillPopScope(
        onWillPop: () async {
          return onWillPop();
        },
        child: BaseView<HomeViewModel>(
          onModelReady: (model) => model.getAllBrands(),
          builder: (BuildContext context, HomeViewModel model, Widget? child) =>
              Scaffold(
            appBar: appBar(),
            body:  CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                const Search(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                const FeedNews(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 90, child: _getPostUi(model.brands)),
                ),
              ],
            ),
            bottomNavigationBar: bottomMenu(),
            drawer: const MainDrawer(),
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      shadowColor: AppColors.primaryColor.withOpacity(0.2),
      centerTitle: true,
      title: const Text(
        'Vũ Hạnh Sneaker',
        style: appBarStyle,
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Badge(
                badgeContent: const Text('0', style: numberSoppingCart),
                badgeColor: AppColors.red,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                ))),
        const SizedBox(width: 15)
      ],
    );
  }

  BottomNavigationBar bottomMenu() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: AppColors.primaryColor,
      currentIndex: _selectedIndex,
      backgroundColor: AppColors.white,
      items: [
        homeBottomMenuIcon(
          currentIndex: _selectedIndex,
          itemIndex: 0,
          svgPic: 'assets/svg/home.svg',
          title: 'Home',
        ),
        homeBottomMenuIcon(
          itemIndex: _selectedIndex,
          currentIndex: 1,
          svgPic: 'assets/svg/category.svg',
          title: 'Brand',
        ),
        homeBottomMenuIcon(
          currentIndex: _selectedIndex,
          itemIndex: 2,
          svgPic: 'assets/svg/notification.svg',
          title: '',
        ),
        homeBottomMenuIcon(
          currentIndex: _selectedIndex,
          itemIndex: 3,
          svgPic: 'assets/svg/profile.svg',
          title: 'Profile',
        ),
      ],
    );
  }

  Widget _getPostUi(List<Brand?> brands) => ListView.builder(
    itemCount: brands.length,
    itemBuilder: (BuildContext context, int index) => BrandListItem(
      brand: brands[index]!,
      onTap: () {
      },
    ),
  );

}
