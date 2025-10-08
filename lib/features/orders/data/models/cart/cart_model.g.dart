// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemRequestModel _$CartItemRequestModelFromJson(
  Map<String, dynamic> json,
) => CartItemRequestModel(
  productId: json['productId'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartItemRequestModelToJson(
  CartItemRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
