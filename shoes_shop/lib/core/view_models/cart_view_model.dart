import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.purchased;
    });
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
    if (_items.containsKey(shoeid)) {
      // change quantity...
      _items.update(
        shoeid,
        (existingCartItem) => Cart(
          shoeid: existingCartItem.shoeid,
          shoename: existingCartItem.shoename,
          price: existingCartItem.price,
          // size: existingCartItem.size,
          // image1: existingCartItem.image1,
          purchased: existingCartItem.purchased + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        shoeid,
        () => Cart(
          shoeid: 1,
          shoename: shoename,
          price: price,
          // size: size,
          // image1: image1!,
          purchased: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String shoeid) {
    _items.remove(shoeid);
    notifyListeners();
  }

  void removeSingleItem(String shoeid) {
    if (!_items.containsKey(shoeid)) {
      return;
    }
    if (_items[shoeid]!.purchased > 1) {
      _items.update(
        shoeid,
        (existingCartItem) => Cart(
          shoeid: existingCartItem.shoeid,
          shoename: existingCartItem.shoename,
          price: existingCartItem.price,
          // size: existingCartItem.size,
          // image1: existingCartItem.image1,
          purchased: existingCartItem.purchased - 1,
        ),
      );
    } else {
      _items.remove(shoeid);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
