import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  final String cartId;
  final List<CartItemModel> cartItems;

  CartResponseModel({
    required this.cartId,
    required this.cartItems,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable()
class CartItemModel {
  final String itemId;
  final String productId;
  final String productName;
  final String productCoverUrl;
  final int productStock;
  final int weightInGrams;
  final int quantity;
  final double discountPercentage;
  final double basePricePerUnit;
  final double finalPricePerUnit;
  final double totalPrice;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productCoverUrl,
    required this.productStock,
    required this.weightInGrams,
    required this.quantity,
    required this.discountPercentage,
    required this.basePricePerUnit,
    required this.finalPricePerUnit,
    required this.totalPrice,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}

@JsonSerializable()
class MessageResponseModel {
  final String message;
  final String? id;
  final String? productId;
  final int? quantity;

  MessageResponseModel({
    required this.message,
    this.id,
    this.productId,
    this.quantity,
  });

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseModelToJson(this);
}
