// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponRequestModel _$CouponRequestModelFromJson(Map<String, dynamic> json) =>
    CouponRequestModel(
      couponCode: json['couponCode'] as String,
      couponType: json['couponType'] as String,
      expirationDate: json['expirationDate'] as String,
      usageTimes: (json['usageTimes'] as num).toInt(),
      timesPerUser: (json['timesPerUser'] as num).toInt(),
      discountValue: (json['discountValue'] as num).toDouble(),
      maxDiscount: (json['maxDiscount'] as num).toDouble(),
    );

Map<String, dynamic> _$CouponRequestModelToJson(CouponRequestModel instance) =>
    <String, dynamic>{
      'couponCode': instance.couponCode,
      'couponType': instance.couponType,
      'expirationDate': instance.expirationDate,
      'usageTimes': instance.usageTimes,
      'timesPerUser': instance.timesPerUser,
      'discountValue': instance.discountValue,
      'maxDiscount': instance.maxDiscount,
    };
