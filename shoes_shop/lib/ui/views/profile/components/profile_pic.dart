import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        backgroundImage: NetworkImage(userViewModel.users!.avatar!, scale: 1.0),
      ),
    );
  }
}
