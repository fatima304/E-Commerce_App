import 'package:ecommerce_app/features/orders/data/models/cart/cart_response_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';

/// Utility class for cart-related calculations
class CartCalculations {
  /// Fixed shipping cost as shown in the design
  static const double shippingCost = 10.0;

  /// Calculate subtotal from cart items
  static double calculateSubtotal(CartResponseModel cart) {
    return cart.cartItems.fold(
      0.0,
      (sum, item) => sum + (item.finalPricePerUnit * item.quantity),
    );
  }

  /// Calculate discount amount based on applied coupon
  static double calculateDiscount(CartResponseModel cart, CouponModel? appliedCoupon) {
    if (appliedCoupon == null) return 0.0;

    final subtotal = calculateSubtotal(cart);

    if (appliedCoupon.couponType == 'percentage') {
      final discountAmount = subtotal * (appliedCoupon.discountValue / 100);
      return discountAmount > appliedCoupon.maxDiscount 
          ? appliedCoupon.maxDiscount 
          : discountAmount;
    } else {
      // Fixed amount discount
      return appliedCoupon.discountValue > appliedCoupon.maxDiscount 
          ? appliedCoupon.maxDiscount 
          : appliedCoupon.discountValue;
    }
  }

  /// Calculate total amount (subtotal + shipping - discount)
  static double calculateTotal(CartResponseModel cart, CouponModel? appliedCoupon) {
    final subtotal = calculateSubtotal(cart);
    final discount = calculateDiscount(cart, appliedCoupon);
    
    return subtotal + shippingCost - discount;
  }

  /// Get shipping cost
  static double getShippingCost() => shippingCost;

  /// Format currency amount for display
  static String formatCurrency(double amount) {
    return '${amount.toStringAsFixed(2)} EGP';
  }

  /// Calculate individual item total (price * quantity)
  static double calculateItemTotal(double pricePerUnit, int quantity) {
    return pricePerUnit * quantity;
  }

  /// Check if cart has items
  static bool hasItems(CartResponseModel cart) {
    return cart.cartItems.isNotEmpty;
  }

  /// Get total number of items in cart
  static int getTotalItemCount(CartResponseModel cart) {
    return cart.cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
}
