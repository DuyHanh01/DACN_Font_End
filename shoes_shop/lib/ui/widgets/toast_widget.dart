import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoes_shop/config/theme.dart';

Future<bool?> buildToast(String msg){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:
      AppColors.red.withOpacity(0.7),
      textColor: AppColors.white,
      fontSize: 14.0);
}