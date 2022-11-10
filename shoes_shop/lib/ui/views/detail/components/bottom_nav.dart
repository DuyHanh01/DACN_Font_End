import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

class BottomNav extends StatelessWidget {
  const BottomNav(
      {Key? key,
      required this.cartViewModel,
      required this.shoesViewModel,
      required this.shoes})
      : super(key: key);
  final CartViewModel cartViewModel;
  final Shoes shoes;
  final ShoesViewModel shoesViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.lightGray, blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
                badgeContent: Text('${cartViewModel.itemCount}',
                    style: numberSoppingCart),
                badgeColor: AppColors.red,
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 26,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                )),
          ),
          const SizedBox(width: 35),
          IconButton(
              onPressed: () {
                addCart(context);
              },
              icon: const Icon(Icons.shopping_cart))
          // Expanded(
          //   child: ButtonStates(),
          // ),
        ],
      ),
    );
  }

  void addCart(BuildContext context) {
    if (shoesViewModel.size == 0) {
      Fluttertoast.showToast(
          msg: "Vui lòng chọn size",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.red.withOpacity(0.85),
          textColor: AppColors.white,
          fontSize: 14.0);
    } else {
      Cart? cart =
          cartViewModel.getCart(shoes.shoeid, shoesViewModel.size);
      if (cart != null) {
        if (cart.quantity < 5) {
          int total = shoesViewModel.x;
          int size = shoesViewModel.size;
          shoesViewModel.checkTimeSale(shoes)
              ? cartViewModel.addItem(shoes.shoeid, shoes.saleprice!,
                  shoes.shoename, shoes.image1, total, size)
              : cartViewModel.addItem(shoes.shoeid, shoes.price,
                  shoes.shoename, shoes.image1, total, size);
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Liên hệ shop để order!'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: "Contacts",
              textColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(RoutePaths.contact);
              },
            ),
          ));
        }
      } else {
        int total = shoesViewModel.x;
        int size = shoesViewModel.size;
        shoesViewModel.checkTimeSale(shoes)
            ? cartViewModel.addItem(shoes.shoeid, shoes.saleprice!,
                shoes.shoename, shoes.image1, total, size)
            : cartViewModel.addItem(shoes.shoeid, shoes.price,
                shoes.shoename, shoes.image1, total, size);
      }
    }
  }
}
