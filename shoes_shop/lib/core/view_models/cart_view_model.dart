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
}
