import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget buildTextButton(
      String text, String icon, void Function()? tapHandler) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: AppColors.black,
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.secondaryColor,
        ),
        onPressed: tapHandler,
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 50,
              width: 55,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextButton("${S.of(context).phone}: 0369880609", AppUI.mobilePhone, () async {
          FlutterPhoneDirectCaller.callNumber('+84369880609');
        }),
        buildTextButton("Email: trananhvuiato@gmail.com", AppUI.mail, () async {
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
        buildTextButton(
          '${S.of(context).address}: 614/63 Đ79, Phước Long B, Tp Thủ Đức, TpHCM' ,
          AppUI.maps,
          () => Navigator.of(context).pushNamed(
            RoutePaths.googleMap,
          ),
        ),
      ],
    );
  }
}
