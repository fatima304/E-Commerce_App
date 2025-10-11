import 'package:ecommerce_app/features/orders/data/models/cart/cart_model.dart';
import 'package:ecommerce_app/features/orders/data/models/cart/cart_response_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:ecommerce_app/features/orders/domain/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
  CouponModel? _appliedCoupon;

  CartCubit(this._cartRepository) : super(const CartInitial());

  Future<void> getCart() async {
    emit(const CartLoading());
    try {
      final cart = await _cartRepository.getCart();
      emit(CartLoaded(cart, appliedCoupon: _appliedCoupon));
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(CartFailure(error.message ?? 'Unknown error'));
    }
  }

  Future<void> addOrUpdateItem(String productId, int quantity) async {
    emit(const CartLoading());
    try {
      final response = await _cartRepository.addOrUpdateItem(
        CartItemRequestModel(productId: productId, quantity: quantity),
      );
      emit(CartSuccess(response.message));
      await getCart();
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(CartFailure(error.message ?? 'Unknown error'));
    }
  }

  Future<void> addItem(String productId, int quantity) async {
    emit(const CartLoading());
    try {
      final response = await _cartRepository.addItem(
        CartItemRequestModel(productId: productId, quantity: quantity),
      );
      emit(CartSuccess(response.message));
      await getCart();
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(CartFailure(error.message ?? 'Unknown error'));
    }
  }

  Future<void> deleteItem(String itemId) async {
     if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCart = _removeItemFromCart(currentState.cart, itemId);
      emit(CartLoaded(updatedCart, appliedCoupon: _appliedCoupon));
    }

    try {
      await _cartRepository.deleteItem(itemId);
       emit(const CartSuccess('Item removed successfully.'));
    } catch (e) {
       if (state is CartLoaded) {
        await getCart(); 
      }
      final error = ApiErrorHandler.handle(e);
      emit(CartFailure(error.message ?? 'Failed to remove item'));
    }
  }

  Future<void> updateItemQuantity(String itemId, String productId, int quantity) async {
     if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCart = _updateItemQuantityInCart(currentState.cart, itemId, quantity);
      emit(CartLoaded(updatedCart, appliedCoupon: _appliedCoupon));
    }

    try {
      final response = await _cartRepository.updateItemQuantity(
        itemId,
        CartItemRequestModel(productId: productId, quantity: quantity),
      );
       emit(CartSuccess(response.message));
    } catch (e) {
       if (state is CartLoaded) {
        await getCart(); 
      }
      final error = ApiErrorHandler.handle(e);
      emit(CartFailure(error.message ?? 'Failed to update quantity'));
    }
  }

  void applyCoupon(CouponModel coupon) {
    _appliedCoupon = coupon;
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      emit(CartLoaded(currentState.cart, appliedCoupon: _appliedCoupon));
    }
  }

  void removeCoupon() {
    _appliedCoupon = null;
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      emit(CartLoaded(currentState.cart, appliedCoupon: _appliedCoupon));
    }
  }

  CouponModel? get appliedCoupon => _appliedCoupon;

   CartResponseModel _removeItemFromCart(CartResponseModel cart, String itemId) {
    final updatedItems = cart.cartItems.where((item) => item.itemId != itemId).toList();
    return CartResponseModel(
      cartId: cart.cartId,
      cartItems: updatedItems,
    );
  }

  CartResponseModel _updateItemQuantityInCart(CartResponseModel cart, String itemId, int newQuantity) {
    final updatedItems = cart.cartItems.map((item) {
      if (item.itemId == itemId) {
         return CartItemModel(
          itemId: item.itemId,
          productId: item.productId,
          productName: item.productName,
          productCoverUrl: item.productCoverUrl,
          productStock: item.productStock,
          weightInGrams: item.weightInGrams,
          quantity: newQuantity,
          discountPercentage: item.discountPercentage,
          basePricePerUnit: item.basePricePerUnit,
          finalPricePerUnit: item.finalPricePerUnit,
          totalPrice: item.finalPricePerUnit * newQuantity,
        );
      }
      return item;
    }).toList();

    return CartResponseModel(
      cartId: cart.cartId,
      cartItems: updatedItems,
    );
  }
}
