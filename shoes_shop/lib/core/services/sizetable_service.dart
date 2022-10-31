import 'package:shoes_shop/core/models/sizetable.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class SizeTableService {
  final Api _api = locator<Api>();

  String message = "";

  List<SizeTable?>? _sizetable = <SizeTable>[];
  List<SizeTable?>? get sizetables => _sizetable;

  Future<bool> getSizeTableByShoeId(int shoeid) async {
    var fetchedSize = await _api.getSizeTableByShoeId(shoeid);
    var isSuccessShoes = fetchedSize.isSuccess;

    message = fetchedSize.Message!;
    if (isSuccessShoes != null && isSuccessShoes) {
      if (fetchedSize.data != null) {
        _sizetable = fetchedSize.data;
      }
    }
    return isSuccessShoes ?? false;
  }
}