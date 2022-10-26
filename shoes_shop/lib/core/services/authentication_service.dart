import 'dart:async';

import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class AuthenticationService {
  final Api _api = locator<Api>();
  String message = "";
  StreamController<Account> accountController = StreamController<Account>();
  StreamController<Register> registerController = StreamController<Register>();

  Future<bool> login(Account account) async {
    var fetchedAccount = await _api.login(account);
    var isSuccessLogin = fetchedAccount.isSuccess;
    message = fetchedAccount.Message!;
    if (isSuccessLogin != null && isSuccessLogin) {
      if (fetchedAccount.data != null) {
        accountController.add(fetchedAccount.data[0]!);
      }
    }
    return isSuccessLogin ?? false;
  }

  Future<bool> register(Register register) async {
    var fetchedRegister = await _api.register(register);
    var isSuccessRegister= fetchedRegister.isSuccess;
    message = fetchedRegister.Message!;
    return isSuccessRegister ?? false;
  }

}
