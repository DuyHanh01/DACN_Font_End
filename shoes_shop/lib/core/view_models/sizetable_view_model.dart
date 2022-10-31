import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/sizetable.dart';
import 'package:shoes_shop/core/services/sizetable_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class SizeTableViewModel extends BaseViewModel{
  final SizeTableService _sizeTableService = locator<SizeTableService>();

  String errorMessage = '';

  List<SizeTable?>? get sizetables => _sizeTableService.sizetables;

  Future<bool> getSizeTableByShoeId(int shoeid) async {
    setState(ViewState.Busy);
    String message = _sizeTableService.message;

    var shoeId = shoeid;
    var success = await _sizeTableService.getSizeTableByShoeId(shoeId);

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

  Function? changeButton(int currentSelected, int i){
    currentSelected = i;
    setState(ViewState.Idle);
  }
}