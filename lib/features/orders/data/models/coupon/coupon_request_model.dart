import 'package:json_annotation/json_annotation.dart';

part 'coupon_request_model.g.dart';

@JsonSerializable()
class CouponRequestModel {
  final String couponCode;
  final String couponType;
  final String expirationDate;
  final int usageTimes;
  final int timesPerUser;
  final double discountValue;
  final double maxDiscount;

  CouponRequestModel({
    required this.couponCode,
    required this.couponType,
    required this.expirationDate,
    required this.usageTimes,
    required this.timesPerUser,
    required this.discountValue,
    required this.maxDiscount,
  });

  Map<String, dynamic> toJson() => _$CouponRequestModelToJson(this);
}
