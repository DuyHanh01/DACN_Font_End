import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/review.dart';
import 'package:shoes_shop/core/models/brands.dart';

class Product {
  final String name;
  final double price;
  final double totalRating;
  final List<Color> avaliableColors;
  final List<String> images;
  final String logoUrl;
  final List<Review> reviews;
  bool isFavorite;
  final Brands brand;

  Product({
    required this.name,
    required this.price,
    required this.totalRating,
    required this.avaliableColors,
    required this.images,
    required this.logoUrl,
    required this.reviews,
    required this.isFavorite,
    required this.brand,
  });
}
