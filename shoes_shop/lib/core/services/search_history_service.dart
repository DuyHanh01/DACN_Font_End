import 'package:shoes_shop/core/models/search_history.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class SearchHistoryService {
  final Api _api = locator<Api>();

  String message = "";

  List<Shoes?>? _shoesSearch = <Shoes>[];
  List<Shoes?>? get shoesSearch => _shoesSearch;

  Future<bool> insertSearchHistory(SearchHistory searchHistory) async {
    var fetchedSearchHistory = await _api.insertSearchHistory(searchHistory);
    var isSuccessSearchHistory = fetchedSearchHistory.isSuccess;

    message = fetchedSearchHistory.Message!;
    if (isSuccessSearchHistory != null && isSuccessSearchHistory) {
      if (fetchedSearchHistory.data != null) {
        _shoesSearch = fetchedSearchHistory.data;
      }
    }
    return isSuccessSearchHistory ?? false;
  }

  Future<bool> getShoesSearch(int accountid) async {
    var fetchedSearchHistory = await _api.getShoesSearch(accountid);
    var isSuccessSearchHistory = fetchedSearchHistory.isSuccess;

    message = fetchedSearchHistory.Message!;
    if (isSuccessSearchHistory != null && isSuccessSearchHistory) {
      if (fetchedSearchHistory.data != null) {
        _shoesSearch = fetchedSearchHistory.data;
      }
    } else {
      _shoesSearch = [];
    }
    return isSuccessSearchHistory ?? false;
  }

}
