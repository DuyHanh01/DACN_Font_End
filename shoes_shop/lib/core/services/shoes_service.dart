import 'dart:async';

import 'package:shoes_shop/core/models/favorite.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class ShoesService {
  final Api _api = locator<Api>();

  String message = "";


  late Shoes shoe;

  List<Shoes?>? _shoes = <Shoes>[];
  List<Shoes?>? get shoes => _shoes;

  List<Shoes?>? _shoesPurchasedTogether = <Shoes>[];
  List<Shoes?>? get shoesPurchasedTogether => _shoesPurchasedTogether;

  List<Shoes?>? _saleshoes = <Shoes>[];
  List<Shoes?>? get saleshoes => _saleshoes;

  List<Shoes?>? _brandshoes = <Shoes>[];
  List<Shoes?>? get brandshoes => _brandshoes;

  Future<bool> getAllShoes(int accountid) async {
    var fetchedShoes = await _api.getAllShoes(accountid);
    var isSuccessShoes = fetchedShoes.isSuccess;

    message = fetchedShoes.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedShoes.data != null) {
        _shoes = fetchedShoes.data;
      }
    }else{
      _shoes = [];
    }
    return isSuccessShoes ?? false;
  }

  Future<bool> getShoeById(int accountid, int shoeid) async {
    var fetchedShoes = await _api.getShoeById(accountid, shoeid);
    var isSuccessShoes = fetchedShoes.isSuccess;

    message = fetchedShoes.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedShoes.data != null) {
        shoe = fetchedShoes.data![0]!;
      }
    }
    return isSuccessShoes ?? false;
  }

  Future<bool> getAllShoesBySaleId(int accountid, int saleid) async {
    var fetchedShoes = await _api.getAllShoesBySaleId(accountid, saleid);
    var isSuccessShoes = fetchedShoes.isSuccess;

    message = fetchedShoes.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedShoes.data != null) {
        _saleshoes = fetchedShoes.data;
      }
    }else{
      _saleshoes = [];
    }

    return isSuccessShoes ?? false;
  }

  Future<bool> getShoesPurchasedTogether(int shoeid, int accountid) async {
    var fetchedShoes = await _api.getShoesPurchasedTogether(shoeid, accountid);
    var isSuccessShoes = fetchedShoes.isSuccess;

    message = fetchedShoes.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedShoes.data != null) {
        _shoesPurchasedTogether = fetchedShoes.data;
      }
    }else{
      _shoesPurchasedTogether = [];
    }

    return isSuccessShoes ?? false;
  }

  Future<bool> getAllShoesByBrandId(int accountid, int brandid) async {
    var fetchedShoes = await _api.getAllShoesByBrandId(accountid, brandid);
    var isSuccessShoes = fetchedShoes.isSuccess;

    message = fetchedShoes.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedShoes.data != null) {
        _brandshoes = fetchedShoes.data;
      }
    }else{
      _brandshoes = [];
    }

    return isSuccessShoes ?? false;
  }

  Future<bool> addOrDeleteFav(Favorite favorite) async {
    var fetchedShoes = await _api.addOrDeleteFav(favorite);
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
