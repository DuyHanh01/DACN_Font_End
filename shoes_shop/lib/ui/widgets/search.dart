import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_shop/config/theme.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  color: AppColors.primaryColor.withOpacity(0.3))
            ]),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      fontSize: 16),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/search.svg',
                      height: 20,
                      width: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
