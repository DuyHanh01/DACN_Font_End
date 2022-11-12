import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
class CameraImageButton extends StatelessWidget {
  final Function? getImageCamera, getImageGallery;
  const CameraImageButton({Key? key, this.getImageCamera, this.getImageGallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildButtonIcon(Function? press, IconData icon) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF65708F),
          shape: BoxShape.circle,
        ),
        child: IconButton(
            onPressed: press as void Function()?,
            icon: Icon(
              icon,
              color: Colors.white,
            )),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        color: AppColors.white,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButtonIcon(
                    getImageCamera, Icons.camera_alt),
                buildButtonIcon(getImageGallery, Icons.image),
              ],
            )),
      ),
    );
  }
}
