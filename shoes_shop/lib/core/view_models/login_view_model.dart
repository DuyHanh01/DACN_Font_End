import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage = '';

  Future<bool> login(String username, String password) async {
    setState(ViewState.Busy);
    String message = _authenticationService.message;
    var userName = username;
    var passWord = password;

    var account = Account(0, userName, passWord, 0);
    var success = await _authenticationService.login(account);
    if (!success) {
      errorMessage = message;
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessage = message;
      setState(ViewState.Idle);
      return success;
    }

    // if (userName.isEmpty || passWord.isEmpty) {
    //   errorMessage = message;
    //   setState(ViewState.Idle);
    //   return false;
    // } else {
    //   var success = await _authenticationService.login(account);
    //   if (!success) {
    //     errorMessage = message;
    //     setState(ViewState.Idle);
    //     return false;
    //   } else {
    //     errorMessage = 'aaaaaa';
    //     setState(ViewState.Idle);
    //     return success;
    //   }
    // }
  }
}
