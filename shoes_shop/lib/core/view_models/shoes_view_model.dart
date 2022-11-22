import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/favorite.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/models/sizetable.dart';
import 'package:shoes_shop/core/services/shoes_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class ShoesViewModel extends BaseViewModel {
  final ShoesService _shoesService = locator<ShoesService>();

  String errorMessage = '';
  int _x = 1;
  int get x => _x;

  Color _color = AppColors.white;
  Color get color => _color;

  int _size = 0;
  int get size => _size;

  int _number = 0;
  int get number => _number;

  int? _currentSelected;
  int? get currentSelected => _currentSelected;

  Shoes? get shoe => _shoesService.shoe;
  List<Shoes?>? get shoes => _shoesService.shoes;
  List<Shoes?>? get shoesPurchasedTogether => _shoesService.shoesPurchasedTogether;
  List<Shoes?>? get saleshoes => _shoesService.saleshoes;
  List<Shoes?>? get brandshoes => _shoesService.brandshoes;

  Future<bool> getAllShoes(int accountid) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var success = await _shoesService.getAllShoes(accountId);
    String message = _shoesService.message;

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

  void listFav(List<Shoes> list, ShoesViewModel model){
    for(var e in model.shoes!){
      if(e!.isfavorite!){
        list.add(e);
      }
    }
  }

  // Shoes? getShoesAi(String shoeName) {
  //   var toRemove = [];
  //   for (var element in shoes!) {
  //     List<String> splitted = element!.shoename.split(' ');
  //     for (var a in splitted) {
  //       if (shoeName.contains(a)) {
  //         continue;
  //       } else {
  //         toRemove.add(element);
  //         break;
  //       }
  //     }
  //   }
  //   List<Shoes?>? list = shoes;
  //   list?.removeWhere((e) => toRemove.contains(e));
  //   if (list!.isNotEmpty) {
  //     return list[0];
  //   } else {
  //     return null;
  //   }
  // }

  Shoes? getShoesAi(String shoeName) {
    for (var element in shoes!) {
      if (shoeName.toLowerCase().contains(element!.shoename.toLowerCase())) {
        return element;
      }
    }
    return null;
  }

  Future<bool> getShoeById(int accountid, int shoeid) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var shoeId = shoeid;
    var success = await _shoesService.getShoeById(accountId, shoeId);
    String message = _shoesService.message;

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

  Future<bool> getAllShoesBySaleId(int accountid, int saleid) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var saleId = saleid;
    var success = await _shoesService.getAllShoesBySaleId(accountId, saleId);
    String message = _shoesService.message;

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

  Future<bool> getShoesPurchasedTogether(int shoeid, int accountid) async {
    setState(ViewState.Busy);

    var success = await _shoesService.getShoesPurchasedTogether(shoeid, accountid);
    String message = _shoesService.message;

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

  Future<bool> getAllShoesByBrandId(int accountid, int brandid) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var brandId = brandid;
    var success = await _shoesService.getAllShoesByBrandId(accountId, brandId);
    String message = _shoesService.message;

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

  void getShoesTopPurchased(List<Shoes> list) async {
    for(var element in shoes!){
      if(element!.purchased !=0 && element.purchased!= null){
        list.add(element);
      }
    }
  }

  Future<bool> addOrDeleteFav(Favorite favorite) async {
    setState(ViewState.Busy);

    var success = await _shoesService.addOrDeleteFav(favorite);
    String message = _shoesService.message;

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

  void sortSales(List<Shoes?>? list, int x) {
    if (x == 0) {
      list!.sort((a, b) => b!.purchased!.compareTo(a!.purchased!));
    } else if (x == 1) {
      list!.sort((a, b) {
        if (a!.saleprice != null && b!.saleprice != null) {
          return b.saleprice!.compareTo(a.saleprice!);
        }
        if (a.saleprice == null && b!.saleprice != null) {
          return b.saleprice!.compareTo(a.price);
        }
        if (a.saleprice != null && b!.saleprice == null) {
          return b.price.compareTo(a.saleprice!);
        }
        return b!.price.compareTo(a.price);
      });
    } else if (x == 2) {
      list!.sort((a, b) {
        if (a!.saleprice != null && b!.saleprice != null) {
          return a.saleprice!.compareTo(b.saleprice!);
        }
        if (a.saleprice == null && b!.saleprice != null) {
          return a.price.compareTo(b.saleprice!);
        }
        if (a.saleprice != null && b!.saleprice == null) {
          return a.saleprice!.compareTo(b.price);
        }
        return a.price.compareTo(b!.price);
      });
    } else {
      list = saleshoes;
    }
  }

  void sortBrand(List<Shoes?>? list, int x) {
    if (x == 0) {
      list!.sort((a, b) => b!.purchased!.compareTo(a!.purchased!));
    } else if (x == 1) {
      list!.sort((a, b) {
        if (a!.saleprice != null && b!.saleprice != null) {
          return b.saleprice!.compareTo(a.saleprice!);
        }
        if (a.saleprice == null && b!.saleprice != null) {
          return b.saleprice!.compareTo(a.price);
        }
        if (a.saleprice != null && b!.saleprice == null) {
          return b.price.compareTo(a.saleprice!);
        }
        return b!.price.compareTo(a.price);
      });
    } else if (x == 2) {
      list!.sort((a, b) {
        if (a!.saleprice != null && b!.saleprice != null) {
          return a.saleprice!.compareTo(b.saleprice!);
        }
        if (a.saleprice == null && b!.saleprice != null) {
          return a.price.compareTo(b.saleprice!);
        }
        if (a.saleprice != null && b!.saleprice == null) {
          return a.saleprice!.compareTo(b.price);
        }
        return a.price.compareTo(b!.price);
      });
    } else {
      list = brandshoes;
    }
  }

  Shoes? getShoes(int shoeid) {
    return shoes?.firstWhere((prod) => prod!.shoeid == shoeid);
  }

  bool checkTimeSale(Shoes? shoes) {
    if (shoes!.endday != null &&
        DateTime.parse(shoes.endday!).compareTo(DateTime.now()) > 0) {
      return true;
    }
    return false;
  }

  bool checkShoeNew(Shoes? shoes) {
    if (shoes!.shoenew == true) {
      return true;
    }
    return false;
  }

  bool checkPurchased(Shoes? shoes) {
    if (shoes!.purchased != null) {
      return true;
    }
    return false;
  }

  bool checkShoeName(Shoes? shoes) {
    if (shoes!.shoename.length > 22) {
      return true;
    }
    return false;
  }

  void addPurchased() {
    _x++;
    setState(ViewState.Idle);
  }

  void subPurchased() {
    _x--;
    setState(ViewState.Idle);
  }

  void checkSize(SizeTable s, String title, int index) {
    switch (title) {
      case "38":
        if (s.s38! > 0) {
          _size = 38;
          _number = s.s38!;
          _currentSelected = index;
        }
        break;
      case "39":
        if (s.s39! > 0) {
          _size = 39;
          _number = s.s39!;
          _currentSelected = index;
        }
        break;
      case "40":
        if (s.s40! > 0) {
          _size = 40;
          _number = s.s40!;
          _currentSelected = index;
        }
        break;
      case "41":
        if (s.s41! > 0) {
          _size = 41;
          _number = s.s41!;
          _currentSelected = index;
        }
        break;
      case "42":
        if (s.s42! > 0) {
          _size = 42;
          _number = s.s42!;
          _currentSelected = index;
        }
        break;
      case "43":
        if (s.s43! > 0) {
          _size = 43;
          _number = s.s43!;
          _currentSelected = index;
        }
        break;
      case "44":
        if (s.s44! > 0) {
          _size = 44;
          _number = s.s44!;
          _currentSelected = index;
        }
        break;
      case "45":
        if (s.s45! > 0) {
          _size = 45;
          _number = s.s45!;
          _currentSelected = index;
        }
        break;
      case "46":
        if (s.s46! > 0) {
          _size = 46;
          _number = s.s46!;
          _currentSelected = index;
        }
        break;
      case "47":
        if (s.s47! > 0) {
          _size = 47;
          _number = s.s47!;
          _currentSelected = index;
        }
        break;
      case "48":
        if (s.s48! > 0) {
          _size = 48;
          _number = s.s48!;
          _currentSelected = index;
        }
        break;
    }
    setState(ViewState.Idle);
  }

  Color? setColor(SizeTable s, String title, int index) {
    if (_currentSelected != index) {
      if (s.s38! <= 0 && title == "38" ||
          s.s39! <= 0 && title == "39" ||
          s.s40! <= 0 && title == "40" ||
          s.s41! <= 0 && title == "41" ||
          s.s42! <= 0 && title == "42" ||
          s.s43! <= 0 && title == "43" ||
          s.s44! <= 0 && title == "44" ||
          s.s45! <= 0 && title == "45" ||
          s.s46! <= 0 && title == "46" ||
          s.s47! <= 0 && title == "47" ||
          s.s48! <= 0 && title == "48") {
        return _color = AppColors.lightGrey;
      } else {
        return _color = AppColors.white;
      }
    } else {
      return _color = AppColors.primaryColor;
    }
  }
}
