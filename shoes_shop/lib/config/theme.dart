import 'package:flutter/material.dart';

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const apBarSize = 56.0;
  static const appBarExpandedSize = 180.0;
  static const tileWidth = 148.0;
  static const tileHeight = 276.0;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const grey = Color.fromRGBO(97, 97, 97, 1);
  static const blackGray = Color(0xFF393939);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const darkWhite = Color.fromRGBO(246, 246, 246, 1);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xEEF5F1F1);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const blueAvatar = Color(0xFF01579B);
  static const secondaryColor = Color(0xffFFDCBA);
  static const primaryColor = Color(0xff4281C8);
}

class AppConsts {
  static const pageSize = 20;
}

class AppUI {
  static const String imagePath = 'assets/images/';
  static const String svgPath = 'assets/svg/';

  static const String imgGetStarted1 = '${imagePath}shoes_background.jpg';
  static const String imgGetStarted2 = '${imagePath}shoes_background_1.jpg';
  static const String imgGetStarted3 = '${imagePath}shoes_background_2.png';
  static const String imgTopLogin = '${imagePath}top_login.png';
  static const String jordanDior = '${imagePath}jordan_dior.jpg';
  static const String newTag = '${imagePath}new_tag.png';
  static const String saleTag = '${imagePath}sale_tag.png';
  static const String img = '${imagePath}img.jpg';
  static const String search = '${svgPath}search.svg';
  static const String favorite = '${svgPath}favorite.svg';
  static const String home = '${svgPath}home.svg';
  static const String notification = '${svgPath}notification.svg';
  static const String profile = '${svgPath}profile.svg';
}

class CustomAppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      colorScheme: theme.colorScheme.copyWith(secondary: AppColors.red),
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
        color: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.black),
        toolbarTextStyle: theme.textTheme
            .copyWith(
              caption: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            )
            .bodyText2,
        titleTextStyle: theme.textTheme
            .copyWith(
              caption: const TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            )
            .headline6,
      ),
      textTheme: theme.textTheme
          .copyWith(
            headline1: theme.textTheme.headline1?.copyWith(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
            //product price
            headline2: theme.textTheme.headline2?.copyWith(
              color: AppColors.lightGray,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
            headline3: theme.textTheme.headline3?.copyWith(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
            //product title
            headline4: theme.textTheme.headline4?.copyWith(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
            ),
            headline5: theme.textTheme.headline5?.copyWith(
              fontSize: 48,
              color: AppColors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w900,
            ),
            headline6: theme.textTheme.headline6?.copyWith(
              fontSize: 24,
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontFamily: 'Montserrat',
            ),
            subtitle1: theme.textTheme.headline5?.copyWith(
              fontSize: 24,
              color: AppColors.darkGray,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
            subtitle2: theme.textTheme.headline5?.copyWith(
              fontSize: 18,
              color: AppColors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
            button: theme.textTheme.button?.copyWith(
              fontSize: 14,
              color: AppColors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
            caption: theme.textTheme.caption?.copyWith(
              fontSize: 34,
              color: AppColors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
            bodyText1: theme.textTheme.bodyText1?.copyWith(
              color: AppColors.lightGray,
              fontSize: 11,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
            bodyText2: theme.textTheme.bodyText2?.copyWith(
              color: AppColors.black,
              fontSize: 11,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          )
          .apply(fontFamily: 'Montserrat'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}
