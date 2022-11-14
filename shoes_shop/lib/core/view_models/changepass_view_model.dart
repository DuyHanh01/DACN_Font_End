import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class ChangePassViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage = '';

  // String generateMd5(String input) {
  //   return md5.convert(utf8.encode(input)).toString();
  // }

  Future<bool> changePass(Account account) async {
    setState(ViewState.Busy);

    var success = await _authenticationService.changePass(account);
    String message = _authenticationService.message;

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
