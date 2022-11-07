import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget buildListTile(String title, String icon, void Function()? tapHandler) {
    return ListTile(
      leading: Image.asset(icon),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15, color: AppColors.black, fontWeight: FontWeight.w500),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildListTile("Phone: 0369880609", AppUI.mobilePhone, () {
          FlutterPhoneDirectCaller.callNumber('+84369880609');
        }),
        const Divider(color: AppColors.primaryColor),
        buildListTile("Email: trananhvuiato@gmail.com", AppUI.mail, () async {
          String recipient = "trananhvuiato@gmail.com";
          final Uri email = Uri(
            scheme: 'mailto',
            path: recipient,
          );
          if (await canLaunchUrl(email)) {
            await launchUrl(email);
          } else {
            debugPrint('error');
          }
        }),
        const Divider(color: AppColors.primaryColor),
        buildListTile(
          "Address",
          AppUI.maps,
          () => Navigator.of(context).pushNamed(
            RoutePaths.googleMap,
          ),
        ),
        const Divider(color: AppColors.primaryColor, height: 10),
      ],
    );
  }
}
