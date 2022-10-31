import 'dart:async';

import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class ShoesService {
  final Api _api = locator<Api>();

  String message = "";

  List<Shoes?>? _shoes = <Shoes>[];
  List<Shoes?>? get shoes => _shoes;

  Future<bool> getAllShoes(int accountid) async {
    var fetchedShoes = await _api.getAllShoes(accountid);
    var isSuccessShoes = fetchedShoes.isSuccess;

    message = fetchedShoes.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedShoes.data != null) {
        _shoes = fetchedShoes.data;
      }
    }
    return isSuccessShoes ?? false;
  }
}
