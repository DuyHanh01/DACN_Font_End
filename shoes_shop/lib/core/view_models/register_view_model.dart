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

  bool isEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,30}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool checkNull(String email, String password, String repassword){
    if(email == "" || password == ""|| repassword == ""){
      return false;
    }
    return true;
  }

  bool checkPassAndRePass(String password, String repassword){
    if(password.compareTo(repassword) != 0){
      return false;
    }
    return true;
  }

  Future<bool> register(
      String username, String password, String rePassword) async {
    setState(ViewState.Busy);

    if(!checkNull(username,password, rePassword)){
      errorMessage = "Vui lòng điền đầy đủ thông tin";
      setState(ViewState.Idle);
      return false;
    }
    else if(!isEmail(username)){
      errorMessage = "Email không hợp lệ";
      setState(ViewState.Idle);
      return false;
    }
    else if(!validateStructure(password)){
      errorMessage = "Mật khẩu từ 8 -> 30 ký tự bao gồm chữ, số và in hoa chữ cái đầu";
      setState(ViewState.Idle);
      return false;
    }
    else if(!checkPassAndRePass(password,rePassword)){
      errorMessage = "Mật khẩu không khớp";
      setState(ViewState.Idle);
      return false;
    }else{
      var passWord = generateMd5(password);
      var rePassWord = generateMd5(rePassword);

      var register = Register(null,username, passWord, rePassWord);
      var success = await _authenticationService.register(register);
      String message = _authenticationService.message;

      if (!success) {
        errorMessage = message;
        //"Tài khoản hoặc mật khẩu không chính xác";
        setState(ViewState.Idle);
        return false;
      }
      else{
        errorMessage = message;
        setState(ViewState.Idle);
        return success;
      }
    }
  }
}
