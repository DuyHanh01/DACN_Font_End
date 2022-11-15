import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';

class CartViewModel extends BaseViewModel {
  List<Cart> _carts = <Cart>[];
  List<Cart> get carts => _carts;

  int get itemCount {
    return _carts.length;
  }

  double get totalAmount {
    var total = 0.0;
    for (var element in _carts) {
      total += element.price * element.quantity;
    }
    return total;
  }

  Cart? getCart(int shoeid, int size) {
    return _carts.firstWhereOrNull(
        (element) => element.shoeid == shoeid && element.size == size);
  }

  void addItem(
    int shoeid,
    double price,
    String shoename,
    String image,
    int purchased,
    int size,
  ) {
    Cart? cart = getCart(shoeid, size);
    if (_carts.contains(cart)) {
       cart!.quantity += purchased;
    } else {
      if (size != 0) {
        _carts.add(
          Cart(
            shoeid: shoeid,
            shoename: shoename,
            price: price,
            size: size,
            image: image,
            quantity: purchased,
          ),
        );
      }
    }
    setState(ViewState.Idle);
  }

  void removeItem(int shoeid, int size) {
    _carts.remove(getCart(shoeid, size));
    setState(ViewState.Idle);
  }

  void addPurchased(Cart cart) {
    cart.quantity += 1;
    setState(ViewState.Idle);
  }

  void subPurchased(Cart cart) {
    if (cart.quantity >= 1) {
      cart.quantity -= 1;
    }
    setState(ViewState.Idle);
  }

  void clear() {
    _carts = [];
    setState(ViewState.Idle);
  }

  bool addCart(BuildContext context, ShoesViewModel shoesViewModel, CartViewModel cartViewModel, Shoes shoes) {
    if (shoesViewModel.size == 0) {
      Fluttertoast.showToast(
          msg: "Vui lòng chọn size",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.red.withOpacity(0.85),
          textColor: AppColors.white,
          fontSize: 14.0);
      return false;
    } else {
      Cart? cart =
      cartViewModel.getCart(shoes.shoeid, shoesViewModel.size);

      if (cart != null) {
        if (cart.quantity < 5 && (cart.quantity+shoesViewModel.x) <=5) {
          int total = shoesViewModel.x;
          int size = shoesViewModel.size;
          shoesViewModel.checkTimeSale(shoes)
              ? cartViewModel.addItem(shoes.shoeid, shoes.saleprice!,
              shoes.shoename, shoes.image1, total, size)
              : cartViewModel.addItem(shoes.shoeid, shoes.price,
              shoes.shoename, shoes.image1, total, size);
          return true;
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
          return false;
        }
      } else {
        int total = shoesViewModel.x;
        int size = shoesViewModel.size;
        shoesViewModel.checkTimeSale(shoes)
            ? cartViewModel.addItem(shoes.shoeid, shoes.saleprice!,
            shoes.shoename, shoes.image1, total, size)
            : cartViewModel.addItem(shoes.shoeid, shoes.price,
            shoes.shoename, shoes.image1, total, size);
        return true;
      }
    }
  }
}
