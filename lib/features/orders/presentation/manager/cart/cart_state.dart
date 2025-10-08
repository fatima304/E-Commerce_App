import 'package:ecommerce_app/features/orders/data/models/cart/cart_response_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_calculations.dart';
import 'package:meta/meta.dart';

@sealed
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final CartResponseModel cart;
  final CouponModel? appliedCoupon;
  const CartLoaded(this.cart, {this.appliedCoupon});
  
  /// Get subtotal calculated from cart items
  double get subtotal => CartCalculations.calculateSubtotal(cart);
  
  /// Get fixed shipping cost
  double get shippingCost => CartCalculations.getShippingCost();
  
  /// Get discount amount based on applied coupon
  double get discount => CartCalculations.calculateDiscount(cart, appliedCoupon);
  
  /// Get total amount (subtotal + shipping - discount)
  double get total => CartCalculations.calculateTotal(cart, appliedCoupon);
  
  /// Get formatted total for display
  String get formattedTotal => CartCalculations.formatCurrency(total);
  
  /// Get formatted subtotal for display
  String get formattedSubtotal => CartCalculations.formatCurrency(subtotal);
  
  /// Get formatted discount for display
  String get formattedDiscount => CartCalculations.formatCurrency(discount);
  
  /// Get formatted shipping cost for display
  String get formattedShippingCost => CartCalculations.formatCurrency(shippingCost);
  
  /// Check if cart has items
  bool get hasItems => CartCalculations.hasItems(cart);
  
  /// Get total number of items in cart
  int get totalItemCount => CartCalculations.getTotalItemCount(cart);
}

class CartSuccess extends CartState {
  final String message;
  const CartSuccess(this.message);
}

class CartFailure extends CartState {
  final String error;
  const CartFailure(this.error);
}
