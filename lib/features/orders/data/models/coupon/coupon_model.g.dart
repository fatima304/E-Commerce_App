// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
  id: json['id'] as String,
  couponCode: json['couponCode'] as String,
  couponType: json['couponType'] as String,
  expiresAt: json['expiresAt'] as String,
  usagesLeft: (json['usagesLeft'] as num).toInt(),
  timesUsed: (json['timesUsed'] as num).toInt(),
  timesPerUser: (json['timesPerUser'] as num).toInt(),
  discountValue: (json['discountValue'] as num).toDouble(),
  maxDiscount: (json['maxDiscount'] as num).toDouble(),
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'couponCode': instance.couponCode,
      'couponType': instance.couponType,
      'expiresAt': instance.expiresAt,
      'usagesLeft': instance.usagesLeft,
      'timesUsed': instance.timesUsed,
      'timesPerUser': instance.timesPerUser,
      'discountValue': instance.discountValue,
      'maxDiscount': instance.maxDiscount,
    };
