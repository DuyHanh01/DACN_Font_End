import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/sales_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/button_style.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';

class SaleNews extends StatefulWidget {
  const SaleNews({Key? key}) : super(key: key);

  @override
  State<SaleNews> createState() => _SaleNewsState();
}

class _SaleNewsState extends State<SaleNews> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<SalesViewModel>(
        onModelReady: (model) => model.getAllSales(),
        builder: (BuildContext context, SalesViewModel model, Widget? child) =>
            SliverToBoxAdapter(
              child:
              // model.state == ViewState.Busy
              //     ? const CircleDelay()
              //     :
              Stack(
                      children: [
                        SizedBox(
                          height: 180,
                          child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (i) {
                              setState(() => currentIndex = i);
                            },
                            itemCount: model.sales!.length,
                            itemBuilder: (ctx, i) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(model.sales![i]!.imgsale),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(.6),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 35,
                                    width: 130,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      color: Colors.white24,
                                    ),
                                    child: Text(
                                      model.sales![i]!.salename,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.sales![i]!.content,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${model.sales![i]!.percent.round()} %',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            AppButton.normalButton(
                                              onPress: () {
                                                Navigator.of(context).pushNamed(
                                                    RoutePaths.saleDetails,
                                                    arguments: model.sales![i]);
                                              },
                                              height: 35,
                                              width: 100,
                                              title: S.of(context).buy,
                                              backgroundColor: Colors.white,
                                              shadow: false,
                                              titleColor: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 30,
                          bottom: 10,
                          child: SizedBox(
                            height: 16,
                            child: Row(
                              children: List.generate(
                                model.sales!.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(right: 3),
                                  height: index == currentIndex ? 16 : 8,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: index == currentIndex
                                        ? Colors.white
                                        : AppColors.darkGrey,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ));
  }
}
