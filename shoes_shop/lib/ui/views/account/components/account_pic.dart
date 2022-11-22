import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';

// ignore: must_be_immutable
class AccountPic extends StatefulWidget {
  XFile? image;
  AccountPic({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  State<AccountPic> createState() => _AccountPicState();
}
class _AccountPicState extends State<AccountPic> {

  final ImagePicker _picker = ImagePicker();

  Future getImageCamera() async {
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return null;
    setState(() {
      widget.image = image;
    });
  }

  Future getImageGallery() async {
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return null;
    setState(() {
      widget.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: widget.image != null
                  ? Image(image: FileImage(File(widget.image!.path)), fit: BoxFit.cover,)
                  : Image.network(userViewModel.users!.avatar!, fit: BoxFit.cover)),
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
                  // Pick an image
                  getImageCamera();
                },
                child:
                    const Icon(Icons.camera_alt, color: AppColors.primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
