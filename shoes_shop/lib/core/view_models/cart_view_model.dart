import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/cart/components/snack_bar_cart.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

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

  Future<bool> addCart(BuildContext context, ShoesViewModel shoesViewModel,
      CartViewModel cartViewModel, Shoes shoes, int number) async {
    if (shoesViewModel.size == 0) {
      buildToast(S.of(context).chooseSize);
      return false;
    } else {
      Cart? cart = cartViewModel.getCart(shoes.shoeid, shoesViewModel.size);
      if (cart != null) {
        if ((cart.quantity + shoesViewModel.x) > number) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
          return false;
        } else if (cart.quantity < 5 &&
            (cart.quantity + shoesViewModel.x) <= 5) {
          int total = shoesViewModel.x;
          int size = shoesViewModel.size;
          shoesViewModel.checkTimeSale(shoes)
              ? cartViewModel.addItem(shoes.shoeid, shoes.saleprice!,
                  shoes.shoename, shoes.image1, total, size)
              : cartViewModel.addItem(shoes.shoeid, shoes.price, shoes.shoename,
                  shoes.image1, total, size);
          return true;
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
          return false;
        }
      } else {
        if (shoesViewModel.x > number) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
          return false;
        } else {
          int total = shoesViewModel.x;
          int size = shoesViewModel.size;
          shoesViewModel.checkTimeSale(shoes)
              ? cartViewModel.addItem(shoes.shoeid, shoes.saleprice!,
                  shoes.shoename, shoes.image1, total, size)
              : cartViewModel.addItem(shoes.shoeid, shoes.price, shoes.shoename,
                  shoes.image1, total, size);
          return true;
        }
      }
    }
  }
}
