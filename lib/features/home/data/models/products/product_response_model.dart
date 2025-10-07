import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  final List<ProductModel> items;

  ProductResponseModel({required this.items});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}
