import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';

class ProfilePic extends StatelessWidget {
  final UserViewModel userViewModel;
  const ProfilePic({
    Key? key,
    required this.userViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: userViewModel.state == ViewState.Busy
          ? const CircleAvatar(
              backgroundImage: AssetImage(AppUI.profilePic),
            )
          : CircleAvatar(
              backgroundImage:
                  NetworkImage(userViewModel.users!.avatar!, scale: 1.0),
            ),
    );
  }
}
