import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

DateTime? currentBackPressTime;

Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) >= const Duration(seconds: 2)) {
    currentBackPressTime = now;
    Fluttertoast.showToast(msg: 'Tap back again to leave');
    return Future.value(false);
  }else{
    exit(0);
  }
}
