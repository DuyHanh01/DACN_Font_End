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

  bool isEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }

  bool checkPassLength(String password){
    if(password.length>=8&&password.length<=30){
      return true;
    }
    return false;
  }

  bool checkEmailPassNull(String email, String password){
    if(email=="" || password==""){
      return false;
    }
    return true;
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }


  Future<bool> login(String username, String password) async {
    setState(ViewState.Busy);

    var passWord = generateMd5(password);
    var account = Account(0, username, null, passWord,null, 0);
    var success = await _authenticationService.login(account);
    String message = _authenticationService.message;

    if(!checkEmailPassNull(username,password)){
      errorMessage = "Vui lòng điền đầy đủ thông tin";
      setState(ViewState.Idle);
      return false;
    }
    if(!isEmail(username)){
      errorMessage = "Email không hợp lệ";
      setState(ViewState.Idle);
      return false;
    }
    if(checkPassLength(password)){
      errorMessage = "Mật khẩu từ 8->30 ký tự";
      setState(ViewState.Idle);
      return false;
    }if (!success) {
      errorMessage = message;
      //"Tài khoản hoặc mật khẩu không chính xác";
      setState(ViewState.Idle);
      return false;
    }
    if(success){
      errorMessage = message;
    }
    setState(ViewState.Idle);
    return success;
  }
}
