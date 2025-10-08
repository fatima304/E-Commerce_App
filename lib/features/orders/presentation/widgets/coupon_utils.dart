import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';

/// Utility class for coupon-related operations
class CouponUtils {
  /// Parse discount percentage from coupon code
  /// Examples: "SAVE50" -> 50%, "DISCOUNT30" -> 30%, "OFF25" -> 25%
  /// If no number found, defaults to 10%
  static double parseDiscountFromCode(String couponCode) {
    final regex = RegExp(r'\d+');
    final match = regex.firstMatch(couponCode);

    if (match != null) {
      final discountValue = double.tryParse(match.group(0)!) ?? 10.0;
      // Ensure discount is between 1% and 99%
      return discountValue.clamp(1.0, 99.0);
    }

    // Default discount if no number found in coupon code
    return 10.0;
  }

  /// Creates a mock coupon with the given code and discount percentage
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
