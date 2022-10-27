import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/shoes_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class ShoesViewModel extends BaseViewModel{
  final ShoesService _shoesService = locator<ShoesService>();

  String errorMessage = '';
  List<Shoes?>? get shoes => _shoesService.shoes;

  Future<bool> getAllShoes(int accountid) async {
    setState(ViewState.Busy);
    String message = _shoesService.message;

    var accountId = accountid;
    var success = await _shoesService.getAllShoes(accountId);

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
}