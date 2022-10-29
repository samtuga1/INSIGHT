import 'dart:io';
import 'package:insight/models/category_model.dart';

class PitchModel {
  dynamic id;
  late String title;
  bool isFavorite;
  late String description;
  dynamic imageUrl;
  late CategoryModel category;
  late double estimatedAmount;
  String? howPreviousMoneySpent;

  PitchModel({
    this.isFavorite = false,
    this.id,
    required this.category,
    required this.description,
    required this.estimatedAmount,
    this.howPreviousMoneySpent,
    this.imageUrl,
    required this.title,
  });
}
