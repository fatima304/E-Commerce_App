import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartItemRequestModel {
  final String productId;
  final int quantity;

  CartItemRequestModel({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$CartItemRequestModelToJson(this);
}
