import 'dart:async';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class AuthenticationService {
  final Api _api = locator<Api>();

  String _message = "";
  String get message => _message;

  StreamController<Account> accountController = StreamController<Account>();
  StreamController<Register> registerController = StreamController<Register>();

  Future<bool> login(Account account) async {
    var fetchedAccount = await _api.login(account);
    var isSuccessLogin = fetchedAccount.isSuccess;
    _message = fetchedAccount.Message!;
    if (isSuccessLogin != null && isSuccessLogin) {
      if (fetchedAccount.data != null) {
        accountController.add(fetchedAccount.data![0]!);
      }
    }
    return isSuccessLogin ?? false;
  }

  Future<bool> register(Register register) async {
    var fetchedRegister = await _api.register(register);
    var isSuccessRegister= fetchedRegister.isSuccess;
    _message = fetchedRegister.Message!;
    if (isSuccessRegister != null && isSuccessRegister) {
      if (fetchedRegister.data != null) {
        registerController.add(fetchedRegister.data![0]!);
      }
    }
    return isSuccessRegister ?? false;
  }

  Future<bool> changePass(Account account) async {
    var fetchedChangePass = await _api.changePassword(account);
    var isSuccessChangePass= fetchedChangePass.isSuccess;
    _message = fetchedChangePass.Message!;
    if (isSuccessChangePass != null && isSuccessChangePass) {
      if (fetchedChangePass.data != null) {
        accountController.add(fetchedChangePass.data![0]!);
      }
    }
    return isSuccessChangePass ?? false;
  }

  Future<bool> newPassword(Account account) async {
    var fetchedNewPassword = await _api.newPassword(account);
    var isSuccessNewPass= fetchedNewPassword.isSuccess;
    _message = fetchedNewPassword.Message!;
    if (isSuccessNewPass != null && isSuccessNewPass) {
      if (fetchedNewPassword.data != null) {
        accountController.add(fetchedNewPassword.data![0]!);
      }
    }
    return isSuccessNewPass ?? false;
  }

}
