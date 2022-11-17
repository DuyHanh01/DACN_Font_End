import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/account/components/account_header.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controllerFirstName = TextEditingController();

  final TextEditingController _controllerLastName = TextEditingController();

  final TextEditingController _controllerPhone = TextEditingController();

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerAddress = TextEditingController();

  final TextEditingController _controllerNote = TextEditingController();

  final cloudinary = CloudinaryPublic('dhfovnun8', 'ahvuit', cache: false);

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImageCamera() async {
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return null;
    setState(() {
      _image = image;
    });
  }

  Future getImageGallery() async {
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return null;
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: _image != null
                              ? Image(
                                  image: FileImage(File(_image!.path)),
                                  fit: BoxFit.cover,
                                )
                              : Image.network(userViewModel.users!.avatar!,
                                  fit: BoxFit.cover)),
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
                                side: const BorderSide(
                                    color: AppColors.secondaryColor),
                              ),
                              primary: Colors.white,
                              backgroundColor: AppColors.backgroundLight,
                            ),
                            onPressed: () async {
                              // Pick an image
                              getImageCamera();
                            },
                            child: const Icon(Icons.camera_alt,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AccountHeader(
                  controllerFirstName: _controllerFirstName,
                  controllerLastName: _controllerLastName,
                  controllerAddress: _controllerAddress,
                  controllerMail: _controllerEmail,
                  controllerPhone: _controllerPhone,
                  controllerNote: _controllerNote,
                ),
                UIHelper.verticalSpaceSmall(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: DefaultButton(
                          text: "Save",
                          press: () async {
                            String firstName = "";
                            String lastName = "";
                            String phone = "";
                            String email = "";
                            String address = "";
                            String avatar = "";
                            if (_controllerFirstName.text != "") {
                              firstName = _controllerFirstName.text;
                            } else {
                              firstName = userViewModel.users!.firstName!;
                            }
                            if (_controllerLastName.text != "") {
                              lastName = _controllerLastName.text;
                            } else {
                              lastName = userViewModel.users!.lastName!;
                            }
                            if (_controllerPhone.text != "") {
                              phone = _controllerPhone.text;
                            } else {
                              phone = userViewModel.users!.phone!;
                            }
                            if (_controllerEmail.text != "") {
                              email = _controllerEmail.text;
                            } else {
                              email = userViewModel.users!.email!;
                            }
                            if (_controllerAddress.text != "") {
                              address = _controllerAddress.text;
                            } else {
                              address = userViewModel.users!.address!;
                            }

                            final res = await cloudinary
                                .uploadFile(CloudinaryFile.fromFile(
                              _image!.path,
                              folder: 'ShoeStore',
                              context: {
                                'alt': 'Hello',
                                'caption': 'An example image',
                              },
                            ));

                            if (_image != null) {
                              avatar = res.secureUrl;
                            } else {
                              avatar = userViewModel.users!.avatar!;
                            }
                            var loginSuccess = await userViewModel.updateUser(
                                userViewModel.users!.accountid!,
                                userViewModel.users!.userid!,
                                firstName,
                                lastName,
                                phone,
                                email,
                                address,
                                avatar);
                            buildToast(userViewModel.errorMessage);

                            if (loginSuccess) {
                              Navigator.pushNamed(context, RoutePaths.profile);
                            }
                          },
                          textColor: AppColors.white,
                          backColor: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
