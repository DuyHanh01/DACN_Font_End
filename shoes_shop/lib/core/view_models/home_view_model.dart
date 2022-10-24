
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/token.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';

class HomeViewModel extends BaseViewModel {

  logout() {
    Account.initial();
    Token.initial();
    setState(ViewState.Idle);
  }
}
