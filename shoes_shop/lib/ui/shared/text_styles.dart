import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

const headerStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.w900);
const subHeaderStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

const wellComeStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.blackGrey,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0, 5.0),
        blurRadius: 30.0,
        color: AppColors.blackGrey,
      )
    ]);

const shoesTextStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);

const styleToggleSwitch = TextStyle(fontSize: 13.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white);

const appBarTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.blackGrey,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0, 5.0),
        blurRadius: 80.0,
        color: AppColors.primaryColor,
      )
    ]);

const appBarTextStyleDark = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0, 5.0),
        blurRadius: 80.0,
        color: AppColors.primaryColor,
      )
    ]);

const hinTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

const orderTextStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
const orderTextSpanStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

const shoesPriceOld = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2.85,
    decorationColor: AppColors.black);

const shoesSalePrice =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.red);

const signInSignUpStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

const numberSoppingCart = TextStyle(
    color: AppColors.white, fontSize: 10, fontWeight: FontWeight.bold);

const dialogStyle = TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.w500, color: AppColors.primaryColor);

const dialogDescriptionStyle = TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w500, color: AppColors.blackGrey);
