import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/shoes_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class ShoesViewModel extends BaseViewModel {
  final ShoesService _shoesService = locator<ShoesService>();

  String errorMessage = '';
  int _x = 1;
  int get x => _x;

  List<Shoes?>? get shoes => _shoesService.shoes;
  List<Shoes?>? get saleshoes => _shoesService.saleshoes;
  List<Shoes?>? get brandshoes => _shoesService.brandshoes;

  Future<bool> getAllShoes(int accountid) async {
    setState(ViewState.Busy);


    var accountId = accountid;
    var success = await _shoesService.getAllShoes(accountId);
    String message = _shoesService.messageShoes;

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

  Future<bool> getAllShoesBySaleId(int accountid, int saleid) async {
    setState(ViewState.Busy);


    var accountId = accountid;
    var saleId = saleid;
    var success = await _shoesService.getAllShoesBySaleId(accountId, saleId);
    String message = _shoesService.messageSale;

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

  Future<bool> getAllShoesByBrandId(int accountid, int brandid) async {
    setState(ViewState.Busy);


    var accountId = accountid;
    var brandId = brandid;
    var success = await _shoesService.getAllShoesByBrandId(accountId, brandId);
    String message = _shoesService.messageBrand;

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

  Shoes? getShoes(int shoeid) {
    return shoes?.firstWhere((prod) => prod!.shoeid == shoeid);
  }

  bool checkTimeSale(Shoes? shoes) {
    if (shoes!.endday != null &&
        DateTime.parse(shoes.endday!).compareTo(DateTime.now()) > 0) {
      return true;
    }
    return false;
  }

  bool checkShoeNew(Shoes? shoes) {
    if (shoes!.shoenew == true) {
      return true;
    }
    return false;
  }

  bool checkPurchased(Shoes? shoes) {
    if (shoes!.purchased != null) {
      return true;
    }
    return false;
  }

  void addPurchased() {
    _x++;
    setState(ViewState.Idle);
  }

  void subPurchased() {
    _x--;
    setState(ViewState.Idle);
  }
}
