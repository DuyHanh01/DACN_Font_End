import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/brand_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

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
                child:
                // model.state == ViewState.Busy
                //     ? const CircleDelay()
                //     :
                ListView.builder(
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
                                  Navigator.of(context).pushNamed(
                                    RoutePaths.brandShoes,
                                    arguments: model.brands![i],
                                  );
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
                                          ? AppColors.darkGrey
                                          : AppColors.lightGrey,
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
                                    child: Image.network(
                                        model.brands![i]!.logo!,
                                        height: 24,
                                        width: 24,
                                        color: currentSelected == i
                                            ? Colors.white
                                            : AppColors.lightGrey),
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
