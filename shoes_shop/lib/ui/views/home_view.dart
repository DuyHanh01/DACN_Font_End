import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';
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
      onWillPop: () async {return false;},
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.18,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    height: size.height*0.2-40,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Hi! ${user.username}}',
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Search(),
                ],
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            // Expanded(
            //   child: _getPostUi(model.posts),
            // )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color: Colors.white10
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  showUnselectedLabels: false,
                  currentIndex: _selectedIndex,
                  backgroundColor: Colors.white60,
                  selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
                  selectedItemColor: AppColors.primaryColor,
                  type: BottomNavigationBarType.fixed,
                  onTap: _onItemTapped,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_pin_rounded), label: 'Your Card'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.group), label: 'Contacts')
                  ]),
            ),
          ),
        ),
        drawer: const MainDrawer(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          elevation: 2.0,
          child: const Icon(Icons.qr_code_scanner_outlined, size: 40),
        ),
      ),
    );
  }
}
