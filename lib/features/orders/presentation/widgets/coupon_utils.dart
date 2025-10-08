import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';

class CouponUtils {

  static double parseDiscountFromCode(String couponCode) {
    final regex = RegExp(r'\d+');
    final match = regex.firstMatch(couponCode);

    if (match != null) {
      final discountValue = double.tryParse(match.group(0)!) ?? 10.0;
       return discountValue.clamp(1.0, 99.0);
    }

     return 10.0;
  }

   static CouponModel createMockCoupon(String couponCode, double discountPercentage) {
    return CouponModel(
      id: '1',
      couponCode: couponCode,
      couponType: 'percentage',
      expiresAt: '2024-12-31',
      usagesLeft: 100,
      timesUsed: 0,
      timesPerUser: 1,
      discountValue: discountPercentage,
      maxDiscount: 100.0, // Max $100 discount
    );
  }
}
