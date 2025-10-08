import 'package:json_annotation/json_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class CouponModel {
  final String id;
  final String couponCode;
  final String couponType;
  final String expiresAt;
  final int usagesLeft;
  final int timesUsed;
  final int timesPerUser;
  final double discountValue;
  final double maxDiscount;

  CouponModel({
    required this.id,
    required this.couponCode,
    required this.couponType,
    required this.expiresAt,
    required this.usagesLeft,
    required this.timesUsed,
    required this.timesPerUser,
    required this.discountValue,
    required this.maxDiscount,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);
}
