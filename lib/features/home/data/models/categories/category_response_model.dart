import 'package:json_annotation/json_annotation.dart';
import 'category_model.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  final List<CategoryModel> categories;

  CategoryResponseModel({required this.categories});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}
