import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/widgets/background.dart';

class WellComeView extends StatefulWidget {
  const WellComeView({Key? key}) : super(key: key);

  @override
  State<WellComeView> createState() => _WellComeViewState();
}

class _WellComeViewState extends State<WellComeView> {
  int currentPage = 0;

  static Widget buildText(String text) {
    return Text(text,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 13),
        textAlign: TextAlign.center);
  }

  List<Widget> textList = [
    buildText(
        "The best shoes for the best people.\nYou will be able to go anywhere."),
    buildText(
        "Bring power to your steps.\nGo faster, go stronger, never stop."),
    buildText(
        "The journey begins with the perfect pair.\nNew ways to style shoes."),
  ];

  List<Widget> picturesList = [
    Image.asset(
      AppUI.imgGetStarted1,
      key: UniqueKey(),
    ),
    Image.asset(
      AppUI.imgGetStarted2,
      key: UniqueKey(),
    ),
    Image.asset(
      AppUI.imgGetStarted3,
      key: UniqueKey(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            const SizedBox(height: 120),
            SizedBox(
                height: 250,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 25,
                      bottom: 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: picturesList[currentPage],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 200,
              child: PageView.builder(
                onPageChanged: (i) {
                  setState(() => currentPage = i);
                },
                itemCount: 3,
                itemBuilder: (ctx, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Give your best shoes and\n look great',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: AppColors.blackGray,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: textList[currentPage],
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedContainer(
                    height: 10,
                    width: currentPage == index ? 25 : 12,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.secondaryColor
                          : AppColors.lightGray,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
                height: 55,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    onPrimary: AppColors.white,
                    shape: const StadiumBorder(),
                    maximumSize: const Size(double.infinity, 55),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )),
          ],
        ),
      )),
    );
  }
}
