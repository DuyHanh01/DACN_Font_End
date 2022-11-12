import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';

class AccountPic extends StatelessWidget {
  const AccountPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    final userViewModel = Provider.of<UserViewModel>(context);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: userViewModel.users !=null ? NetworkImage(userViewModel.users!.avatar!, scale: 1.0) : const NetworkImage('https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: AppColors.secondaryColor),
                    ),
                    primary: Colors.white,
                    backgroundColor: AppColors.backgroundLight,
                  ),
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    // Pick an image
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    // Capture a photo
                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                  },
                  child: const Icon(Icons.camera_alt, color: AppColors.primaryColor),),
            ),
          )
        ],
      ),
    );
  }
}
