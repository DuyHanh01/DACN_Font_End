import 'package:collection/collection.dart';
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

  Cart? getCart(String shoeid, int size) {
    return _carts.firstWhereOrNull(
        (element) => element.shoeid == shoeid && element.size == size);
  }

  void addItem(
    String shoeid,
    double price,
    String shoename,
    String image,
    int purchased,
    int size,
  ) {
    Cart? cart = getCart(shoeid, size);
    if (_carts.contains(cart)) {
       cart!.purchased += purchased;
    } else {
      if (size != 0) {
        _carts.add(
          Cart(
            shoeid: shoeid,
            shoename: shoename,
            price: price,
            size: size,
            image: image,
            purchased: purchased,
          ),
        );
      }
    }
    setState(ViewState.Idle);
  }

  void removeItem(String shoeid, int size) {
    _carts.remove(getCart(shoeid, size));
    setState(ViewState.Idle);
  }

  void addPurchased(Cart cart) {
    cart.purchased += 1;
    setState(ViewState.Idle);
  }

  void subPurchased(Cart cart) {
    if (cart.purchased >= 1) {
      cart.purchased -= 1;
    }
    setState(ViewState.Idle);
  }

  void clear() {
    _carts = [];
    setState(ViewState.Idle);
  }
}
