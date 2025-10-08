import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_request_model.dart';
import 'package:ecommerce_app/features/orders/domain/repo/cart_repo.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/coupons/coupon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CouponCubit extends Cubit<CouponState> {
  final CartRepository cartRepo;

  CouponCubit(this.cartRepo) : super(const CouponInitial());

  Future<void> getCoupons() async {
    emit(const CouponLoading());
    try {
      final response = await cartRepo.getCoupons();
      emit(CouponGetSuccess(response));
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(CouponFailure(errorModel.message ?? "Unknown error"));
    }
  }

  Future<void> addCoupon(CouponRequestModel request) async {
    emit(const CouponLoading());
    try {
      final response = await cartRepo.addCoupon(request);
      emit(CouponAddSuccess(response));
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(CouponFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
