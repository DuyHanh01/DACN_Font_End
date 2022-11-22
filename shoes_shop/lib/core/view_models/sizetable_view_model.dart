import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/cart.dart';
import 'package:shoes_shop/core/models/sizetable.dart';
import 'package:shoes_shop/core/services/sizetable_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class SizeTableViewModel extends BaseViewModel {
  final SizeTableService _sizeTableService = locator<SizeTableService>();

  String errorMessage = '';

  List<SizeTable?>? get sizetables => _sizeTableService.sizetables;

  Future<bool> getSizeTableByShoeId(int shoeid) async {
    setState(ViewState.Busy);

    var shoeId = shoeid;
    var success = await _sizeTableService.getSizeTableByShoeId(shoeId);
    String message = _sizeTableService.message;

    if (!success) {
      errorMessage = message;
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessage = message;
      setState(ViewState.Idle);
      return success;
    }
  }

  bool checkAmountSize(SizeTable s, Cart cart) {
    switch (cart.size.toString()) {
      case "38":
        if(s.s38! <= cart.quantity){
          return false;
        }
          break;
      case "39":
        if(s.s39! <= cart.quantity){
          return false;
        }
        break;
      case "40":
        if(s.s40! <= cart.quantity){
          return false;
        }
        break;
      case "41":
        if(s.s41! <= cart.quantity){
          return false;
        }
        break;
      case "42":
        if(s.s42! <= cart.quantity){
          break;
        }
        return true;
      case "43":
        if(s.s43! <= cart.quantity){
          return false;
        }
        break;
      case "44":
        if(s.s44! <= cart.quantity){
          return false;
        }
        break;
      case "45":
        if(s.s45! <= cart.quantity){
          return false;
        }
        break;
      case "46":
        if(s.s46! <= cart.quantity){
          return false;
        }
        break;
      case "47":
        if(s.s47! <= cart.quantity){
          return false;
        }
        break;
      case "48":
        if(s.s48! <= cart.quantity){
          return false;
        }
        break;
    }
    setState(ViewState.Idle);
    return true;
  }



}
