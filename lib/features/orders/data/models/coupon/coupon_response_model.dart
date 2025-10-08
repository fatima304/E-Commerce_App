import 'package:json_annotation/json_annotation.dart';
import 'coupon_model.dart';

part 'coupon_response_model.g.dart';

@JsonSerializable()
class CouponResponseModel {
  final List<CouponModel> coupons;

  CouponResponseModel({required this.coupons});

  factory CouponResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponResponseModelToJson(this);
}
