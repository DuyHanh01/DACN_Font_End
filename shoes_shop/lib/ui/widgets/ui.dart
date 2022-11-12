import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:tflite/tflite.dart';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  List? _outputs;
  XFile? _image;
  bool _loading = false;

  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/tflite/model_unquant.tflite",
        labels: "assets/tflite/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future getImageCamera() async {
    var image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(File(_image!.path));
  }

  Future getImageGallery() async {
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(File(_image!.path));
  }

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

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context, listen: false);
    return BaseView<ShoesViewModel>(
        onModelReady: (model) => model.getAllShoes(account.accountId),
        builder: (BuildContext context, ShoesViewModel model, Widget? child) =>
            Scaffold(
              appBar: buildAppBar(context, 'Sneaker Search'),
              backgroundColor: AppColors.backgroundLight,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: _image == null
                          ? Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0)),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.all(20),
                                  child: const Text(
                                    "Upload an image",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 300,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(File(_image!.path)),
                                        fit: BoxFit.cover),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25.0)),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: const EdgeInsets.all(30),
                                      child: Text(
                                        _outputs?[0]["label"] ?? "",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                model.getShoesAi(_outputs?[0]["label"]??"") != null
                                    ? Column(
                                        children: <Widget>[
                                           Text(
                                              "Sản phẩm đang có sẵn trong shop",
                                              style: shoesTextStyle.copyWith(fontSize: 16)),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Card(
                                              color: AppColors.white,
                                              margin: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Image.network(model.getShoesAi(_outputs?[0]["label"])!.image1,
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(model.getShoesAi(_outputs?[0]["label"])!.shoename, style: orderTextStyle.copyWith(color: AppColors.primaryColor, fontSize: 15)),
                                                      UIHelper.verticalSpaceVerySmall(),
                                                      model.checkTimeSale(model.getShoesAi(_outputs?[0]["label"]))
                                                          ? Text.rich(
                                                        TextSpan(
                                                          text: '',
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: '\$${model.getShoesAi(_outputs?[0]["label"])!.saleprice}  ',
                                                              style: shoesSalePrice.copyWith(fontSize: 15),
                                                            ),
                                                            TextSpan(
                                                                text: '\$${model.getShoesAi(_outputs?[0]["label"])!.price}',
                                                                style: shoesPriceOld.copyWith(fontSize: 15)),
                                                          ],
                                                        ),
                                                      )
                                                          : Text(
                                                        '\$${model.getShoesAi(_outputs?[0]["label"])!.price}',
                                                        style: shoesTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Mặt hàng này chưa có sẵn ở shop",
                                          style: shoesTextStyle.copyWith(fontSize: 16)),
                                    ),
                              ],
                            ),
                    ),
                    SizedBox(
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
                    )
                  ],
                ),
              ),
            ));
  }
}
