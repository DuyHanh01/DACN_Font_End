import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage = '';

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<bool> register(
      String username, String password, String rePassword) async {
    setState(ViewState.Busy);

    var userName = username;
    var passWord = generateMd5(password);
    var rePassWord = generateMd5(rePassword);

    var register = Register(null,userName, passWord, rePassWord);
    var success = await _authenticationService.register(register);
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
