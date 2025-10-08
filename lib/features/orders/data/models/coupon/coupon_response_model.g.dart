// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResponseModel _$CouponResponseModelFromJson(Map<String, dynamic> json) =>
    CouponResponseModel(
      coupons: (json['coupons'] as List<dynamic>)
          .map((e) => CouponModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CouponResponseModelToJson(
  CouponResponseModel instance,
) => <String, dynamic>{'coupons': instance.coupons};
