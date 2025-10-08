import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_response_model.dart';
import 'package:meta/meta.dart';


@sealed
abstract class CouponState {
  const CouponState();
}

class CouponInitial extends CouponState {
  const CouponInitial();
}

class CouponLoading extends CouponState {
  const CouponLoading();
}

class CouponGetSuccess extends CouponState {
  final CouponResponseModel response;
  const CouponGetSuccess(this.response);
}

class CouponAddSuccess extends CouponState {
  final CouponModel coupon;
  const CouponAddSuccess(this.coupon);
}

class CouponFailure extends CouponState {
  final String error;
  const CouponFailure(this.error);
}
