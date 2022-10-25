import 'dart:async';

import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class AuthenticationService {
  final Api _api = locator<Api>();
  String message = "";
  StreamController<Account> accountController = StreamController<Account>();
  Future<bool> login(Account account) async {
    var fetchedAccount = await _api.postUser(account);
    var isSuccessLogin = fetchedAccount.isSuccess;
    message = fetchedAccount.Message!;
    if (isSuccessLogin != null && isSuccessLogin) {
      if (fetchedAccount.data != null) {
        accountController.add(fetchedAccount.data!);
      }
    }
    return isSuccessLogin ?? false;
  }
}
