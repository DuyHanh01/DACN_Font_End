import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return SizedBox(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: userViewModel.users !=null ? NetworkImage(userViewModel.users!.avatar!, scale: 1.0) : const NetworkImage('https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
      ),
    );
  }
}
