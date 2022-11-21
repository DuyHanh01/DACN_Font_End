import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/search_history.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/search_history_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class SearchHistoryViewModel extends BaseViewModel {
  final SearchHistoryService _searchHistoryService =
      locator<SearchHistoryService>();

  String errorMessage = '';

  List<Shoes?>? get shoesSearch => _searchHistoryService.shoesSearch;

  Future<bool> insertSearchHistory(SearchHistory searchHistory) async {
    setState(ViewState.Busy);

    var success = await _searchHistoryService.insertSearchHistory(searchHistory);
    String message = _searchHistoryService.message;

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

  Future<bool> getShoesSearch(int accountid) async {
    setState(ViewState.Busy);

    var success = await _searchHistoryService.getShoesSearch(accountid);
    String message = _searchHistoryService.message;

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

  void sortShoes(List<Shoes?>? list, int x) {
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
      list = shoesSearch;
    }
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


}
