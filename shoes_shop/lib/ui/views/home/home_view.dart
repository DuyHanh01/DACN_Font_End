import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/home/components/app_bar.dart';
import 'package:shoes_shop/ui/views/home/components/body.dart';
import 'package:shoes_shop/ui/views/home/components/home_bottom_menu_icon.dart';
import 'package:shoes_shop/ui/views/order/order_view.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';
import 'package:shoes_shop/ui/widgets/press_back_button_again_to_exit_app.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Body(),
    Text('b'),
    OrderView(),
    Text('d'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return onWillPop();
        },
        child: BaseView<HomeViewModel>(
          builder: (BuildContext context, HomeViewModel model, Widget? child) =>
              Scaffold(
            appBar: appBar(context),
            body: Center(
              child: _widgetOptions.elementAt(selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,
              onTap: onItemTapped,
              type: BottomNavigationBarType.fixed,
              elevation: 8,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectedItemColor: AppColors.primaryColor,
              currentIndex: selectedIndex,
              backgroundColor: AppColors.white,
              items: [
                homeBottomMenuIcon(
                  currentIndex: selectedIndex,
                  itemIndex: 0,
                  img: Icons.home_rounded,
                  title: 'Home',
                ),
                homeBottomMenuIcon(
                  itemIndex: 1,
                  currentIndex: selectedIndex,
                  img: Icons.favorite_border_rounded,
                  title: 'Favorite',
                ),
                homeBottomMenuIcon(
                  currentIndex: selectedIndex,
                  itemIndex: 2,
                  img: Icons.shop_rounded,
                  title: 'Order',
                ),
                homeBottomMenuIcon(
                  currentIndex: selectedIndex,
                  itemIndex: 3,
                  img: Icons.person_outline_rounded,
                  title: 'Profile',
                ),
              ],
            ),
            drawer: const MainDrawer(),
          ),
        ));
  }
}
