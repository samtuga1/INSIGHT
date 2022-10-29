import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> categories = [
    CategoryModel(
      title: 'Agriculture & Food',
      imageUrl: 'assets/images/food.png',
    ),
    CategoryModel(
      title: 'Sports',
      imageUrl: 'assets/images/sports.png',
    ),
    CategoryModel(
      title: 'Arts',
      imageUrl: 'assets/images/art.png',
    ),
    CategoryModel(
      title: 'Electronics',
      imageUrl: 'assets/images/electronics.png',
    ),
    CategoryModel(
      title: 'Fintech',
      imageUrl: 'assets/images/fintech.png',
    ),
    CategoryModel(
      title: 'Health',
      imageUrl: 'assets/images/health.png',
    ),
    CategoryModel(
      title: 'Real estate',
      imageUrl: 'assets/images/houses.png',
    ),
    CategoryModel(
      title: 'Music',
      imageUrl: 'assets/images/music.png',
    ),
  ];

  CategoryModel? _category;
  CategoryModel? get category => _category;
  void setCategory(CategoryModel cat) {
    _category = cat;
    notifyListeners();
  }
}
