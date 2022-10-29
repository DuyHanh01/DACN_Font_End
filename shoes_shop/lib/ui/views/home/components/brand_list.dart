import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/brand_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';

class HomeBrandList extends StatefulWidget {
  const HomeBrandList({Key? key}) : super(key: key);

  @override
  State<HomeBrandList> createState() => _HomeBrandListState();
}

class _HomeBrandListState extends State<HomeBrandList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<BrandViewModel>(
        onModelReady: (model) => model.getAllBrands(),
        builder: (BuildContext context, BrandViewModel model, Widget? child) =>
            SliverToBoxAdapter(
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: model.brands?.length,
                  itemBuilder: (ctx, i) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSelected = i;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                color: currentSelected == i
                                    ? AppColors.darkGray
                                    : AppColors.lightGray,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: const AssetImage(
                                    AppUI.imgGetStarted2,
                                  ),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    currentSelected == i
                                        ? Colors.black.withOpacity(.5)
                                        : Colors.black.withOpacity(.85),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(AppUI.nikeBrand,
                                  height: 24,
                                  width: 24,
                                  color: currentSelected == i
                                      ? Colors.white
                                      : AppColors.lightGray),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              model.brands![i]!.brandname!,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: currentSelected == i
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
  }
}
