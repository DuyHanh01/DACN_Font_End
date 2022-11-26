import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/widgets/profile_menu.dart';
import 'package:shoes_shop/ui/widgets/toggle_language.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Body extends StatelessWidget {
  final LocaleProvider provider;
  Body({Key? key, required this.provider}) : super(key: key);

  Color colorEN = AppColors.blackGrey;

  Color colorVN = AppColors.blackGrey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenu(
          text: S.of(context).language,
          icon: Icons.language,
          widget: ToggleLanguage(provider: provider),
          press: () {},
        ),
        ProfileMenu(
          text: S.of(context).screenMode,
          icon: Icons.mode_night,
          widget: ToggleSwitch(
            minWidth: 50.0,
            initialLabelIndex: 1,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            icons: const [
              Icons.mode_night,
              Icons.sunny,
            ],
            iconSize: 30.0,
            activeBgColors: const [
              [Colors.black87, Colors.black26],
              [Colors.yellow, Colors.orange]
            ],
            animate:
                true, // with just animate set to true, default curve = Curves.easeIn
            curve: Curves
                .bounceInOut, // animate must be set to true when using custom curve
            onToggle: (index) {},
          ),
          press: () {},
        ),
        ProfileMenu(
          text: S.of(context).changePassword,
          icon: Icons.change_circle,
          widget: const Icon(Icons.arrow_forward_ios),
          press: () => {Navigator.pushNamed(context, RoutePaths.changePass)},
        ),
      ],
    );
  }
}
