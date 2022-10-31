import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';

class SizeModel {
  String title;
  SizeModel({required this.title});
}

class DetailScreenSelectSize extends StatefulWidget {
  const DetailScreenSelectSize({Key? key}) : super(key: key);

  @override
  State<DetailScreenSelectSize> createState() => _DetailScreenSelectSizeState();
}

class _DetailScreenSelectSizeState extends State<DetailScreenSelectSize> {
  int currentSelected = 2;

  List<SizeModel> sizesList = [
    SizeModel(title: '38'),
    SizeModel(title: '39'),
    SizeModel(title: '40'),
    SizeModel(title: '41'),
    SizeModel(title: '42'),
    SizeModel(title: '43'),
    SizeModel(title: '44'),
    SizeModel(title: '45'),
    SizeModel(title: '46'),
    SizeModel(title: '47'),
    SizeModel(title: '48'),
  ];

  @override
  Widget build(BuildContext context) {
    final shoes = ModalRoute.of(context)!.settings.arguments as Shoes;
    return BaseView<SizeTableViewModel>(
        onModelReady: (model) => model.getSizeTableByShoeId(shoes.shoeid),
        builder: (BuildContext context, SizeTableViewModel model,
                Widget? child) =>
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizesList.length,
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentSelected = i;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: AppColors.grey.withOpacity(0.3)),
                        color: currentSelected == i
                            ? AppColors.primaryColor
                            : AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withOpacity(.7),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        sizesList[i].title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: currentSelected == i
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ));
  }
}
