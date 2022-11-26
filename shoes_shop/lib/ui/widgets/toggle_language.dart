import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:toggle_switch/toggle_switch.dart';
class ToggleLanguage extends StatelessWidget {
  final LocaleProvider provider;
  const ToggleLanguage({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 50.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [AppColors.primaryColor],
        [AppColors.primaryColor]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      initialLabelIndex: Intl.defaultLocale == "en" ? 0 : 1,
      totalSwitches: 2,
      labels: const ['EN', 'VN'],
      radiusStyle: true,
      onToggle: (index) async {
        if (index == 0) {
          await S.load(const Locale('en'));
          provider.setLocale(const Locale('en'));
        } else {
          await S.load(const Locale('vn'));
          provider.setLocale(const Locale('vn'));
        }
      },
    );
  }
}
