import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/image_search/components/camera_image_buton.dart';
import 'package:shoes_shop/ui/views/image_search/components/image_path.dart';
import 'package:shoes_shop/ui/views/image_search/components/shoe_item.dart';
import 'package:shoes_shop/ui/views/image_search/components/upload_an_image.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:tflite/tflite.dart';

class ImageSearch extends StatefulWidget {
  const ImageSearch({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UIState createState() => _UIState();
}

class _UIState extends State<ImageSearch> {
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

  @override
  Widget build(BuildContext context) {
    return BaseView<ShoesViewModel>(
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
                          ? const UploadAnImage()
                          : Column(
                              children: [
                                ImagePath(_outputs, _image),
                                const SizedBox(height: 20),
                                model.getShoesAi(_outputs?[0]["label"] ?? "") != null
                                        ? Column(
                                            children: <Widget>[
                                              Text(
                                                  S.of(context).productIsAvailable,
                                                  style: shoesTextStyle
                                                      .copyWith(fontSize: 16)),
                                              ShoeItem(model, model.getShoesAi(_outputs?[0]["label"])!),
                                            ],
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                S.of(context).productIsNotAvailable,
                                                style: shoesTextStyle.copyWith(
                                                    fontSize: 16)),
                                          ),
                              ],
                            ),
                    ),
                    CameraImageButton(
                        getImageCamera: getImageCamera,
                        getImageGallery: getImageGallery)
                  ],
                ),
              ),
            ));
  }
}
