import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  List<Cart> _carts = <Cart>[];
  List<Cart> get carts => _carts;

  int get itemCount {
    return _carts.length;
  }

  double get totalAmount {
    var total = 0.0;
    for (var element in _carts) {
      total += element.price * element.purchased;
    }
    return total;
  }

  void addItem(
    String shoeid,
    double price,
    String shoename,
    String purchased,
    // String? image1,
    // String size,
  ) {
    //   if (_carts.contains(shoeid)) {
    //     // change quantity...
    //     _carts.(
    //       shoeid,
    //       (existingCartItem) => Cart(
    //         shoeid: existingCartItem.shoeid,
    //         shoename: existingCartItem.shoename,
    //         price: existingCartItem.price,
    //         // size: existingCartItem.size,
    //         // image1: existingCartItem.image1,
    //         purchased: existingCartItem.purchased + 1,
    //       ),
    //     );
    //   } else {
    _carts.add(
      Cart(
        shoeid: shoeid,
        shoename: shoename,
        price: price,
        // size: size,
        // image1: image1!,
        purchased: 1,
      ),
    );
    //}
    notifyListeners();
  }

  void removeItem(String shoeid) {
    _carts.remove(carts.firstWhere((prod) => prod.shoeid == shoeid));
    setState(ViewState.Idle);
  }

  // void removeSingleItem(String shoeid) {
  //   if (!_carts.containsKey(shoeid)) {
  //     return;
  //   }
  //   if (_carts[shoeid]!.purchased > 1) {
  //     _carts(
  //       shoeid,
  //       (existingCartItem) => Cart(
  //         shoeid: existingCartItem.shoeid,
  //         shoename: existingCartItem.shoename,
  //         price: existingCartItem.price,
  //         // size: existingCartItem.size,
  //         // image1: existingCartItem.image1,
  //         purchased: existingCartItem.purchased - 1,
  //       ),
  //     );
  //   } else {
  //     _carts.remove(shoeid);
  //   }
  //   setState(ViewState.Idle);
  // }

  void clear() {
    _carts = [];
    setState(ViewState.Idle);
  }
}
