import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

const headerStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.w900);
const subHeaderStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

const wellComeStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.blackGray,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0, 5.0),
        blurRadius: 30.0,
        color: AppColors.blackGray,
      )
    ]);

const dialogStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor);

const dialogDescriptionStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: AppColors.blackGray);