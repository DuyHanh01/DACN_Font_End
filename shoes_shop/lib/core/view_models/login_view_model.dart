import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage = '';

  // String generateMd5(String input) {
  //   return md5.convert(utf8.encode(input)).toString();
  // }


  Future<bool> login(String username, String password) async {
    setState(ViewState.Busy);

    var account = Account(0, username, null, password,null, 0);
    var success = await _authenticationService.login(account);
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
