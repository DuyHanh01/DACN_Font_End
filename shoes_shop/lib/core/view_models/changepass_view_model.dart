import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class ChangePassViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage = '';

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,30}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool checkNull(String olPass, String pass, String rePass){
    if(olPass == "" || pass == ""|| rePass == ""){
      return false;
    }
    return true;
  }

  bool checkPassAndRePass(String pass, String rePass){
    if(pass.compareTo(rePass) != 0){
      return false;
    }
    return true;
  }

  Future<bool> changePass(Account account) async {
    setState(ViewState.Busy);

    var oldPass = generateMd5(account.Oldpassword!);
    var passWord = generateMd5(account.password!);
    var rePass = generateMd5(account.Repassword!);

    var acc = Account(account.accountid, account.username, oldPass, passWord,rePass, 0);

    if(!checkNull(account.Oldpassword!, account.password!, account.Repassword!)){
      errorMessage = "Vui lòng điền đầy đủ thông tin";
      setState(ViewState.Idle);
      return false;
    }
    else if(!validateStructure(account.password!)){
      errorMessage = "Mật khẩu từ 8 -> 30 ký tự bao gồm chữ, số và in hoa chữ cái đầu";
      setState(ViewState.Idle);
      return false;
    }else if(!checkPassAndRePass(account.password!, account.Repassword!)){
      errorMessage = "Mật khẩu không khớp";
      setState(ViewState.Idle);
      return false;
    }else{
      var success = await _authenticationService.changePass(acc);
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

  Future<bool> newPassword(Account account) async {
    setState(ViewState.Busy);

    var passWord = generateMd5(account.password!);
    var rePass = generateMd5(account.Repassword!);

    var acc = Account(0, account.username, null, passWord,rePass, 0);

    var success = await _authenticationService.newPassword(acc);
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
