import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class SizeModel {
  String title;
  SizeModel(this.title);
}

List<SizeModel> sizesList = [
  SizeModel('38'),
  SizeModel('39'),
  SizeModel('40'),
  SizeModel('41'),
  SizeModel('42'),
  SizeModel('43'),
  SizeModel('44'),
  SizeModel('45'),
  SizeModel('46'),
  SizeModel('47'),
  SizeModel('48'),
];

class SelectSize extends StatelessWidget {
  final ShoesViewModel shoesViewModel;
  final Shoes shoes;
  const SelectSize(
      {Key? key, required this.shoes, required this.shoesViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SizeTableViewModel>(
        onModelReady: (model) => model.getSizeTableByShoeId(shoes.shoeid),
        builder: (BuildContext context, SizeTableViewModel model,
                Widget? child) =>
            model.state == ViewState.Busy
                ? const CircleDelay()
                : Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizesList.length,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () {
                            shoesViewModel.checkSize(model.sizetables![0]!, sizesList[i].title, i);
                          },
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.grey.withOpacity(0.3)),
                                color: shoesViewModel.setColor(
                                    model.sizetables![0]!,
                                    sizesList[i].title,
                                    i),
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
                                  color: shoesViewModel.currentSelected == i
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: shoesViewModel.currentSelected == i
                                    ? Text(
                                        'amount: ${shoesViewModel.number}',
                                        style: shoesSalePrice.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : null),
                          ]),
                        );
                      },
                    ),
                  ));
  }
}
