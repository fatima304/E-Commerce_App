import 'package:ecommerce_app/features/orders/data/models/cart/cart_model.dart';
import 'package:ecommerce_app/features/orders/data/models/cart/cart_response_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_request_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_response_model.dart';
import 'package:ecommerce_app/features/orders/data/models/address/address_model.dart';
import 'package:ecommerce_app/features/orders/data/models/address/address_request_model.dart';
import 'package:ecommerce_app/features/orders/data/network/cart_api_service.dart';

abstract class CartRepository {
  Future<CartResponseModel> getCart();
  Future<MessageResponseModel> addOrUpdateItem(CartItemRequestModel body);
  Future<MessageResponseModel> addItem(CartItemRequestModel body);
  Future<void> deleteItem(String itemId);
  Future<MessageResponseModel> updateItemQuantity(String itemId, CartItemRequestModel body);
  Future<CouponResponseModel> getCoupons();
  Future<CouponModel> addCoupon(CouponRequestModel request);
  Future<List<AddressModel>> getAddresses();
  Future<AddressModel> addAddress(AddressRequestModel request);
  Future<void> deleteAddress(String id);
  Future<AddressModel> updateAddress(String id, AddressRequestModel request);
}

class CartRepositoryImpl implements CartRepository {
  final CartApiService _cartApiService;

  CartRepositoryImpl(this._cartApiService);

  @override
  Future<CartResponseModel> getCart() {
    return _cartApiService.getCartItems();
  }

  @override
  Future<MessageResponseModel> addOrUpdateItem(CartItemRequestModel body) {
    return _cartApiService.addOrUpdateCartItem(body.productId, body);
  }

  @override
  Future<MessageResponseModel> addItem(CartItemRequestModel body) {
    return _cartApiService.addCartItem(body);
  }

  @override
  Future<void> deleteItem(String itemId) {
    return _cartApiService.deleteCartItem(itemId);
  }

  @override
  Future<MessageResponseModel> updateItemQuantity(String itemId, CartItemRequestModel body) {
    return _cartApiService.addOrUpdateCartItem(itemId, body);
  }

  @override
  Future<CouponResponseModel> getCoupons() {
    return _cartApiService.getCoupons();
  }

  @override
  Future<CouponModel> addCoupon(CouponRequestModel request) {
    return _cartApiService.addCoupon(request);
  }

  @override
  Future<List<AddressModel>> getAddresses() {
    return _cartApiService.getAddresses();
  }

  @override
  Future<AddressModel> addAddress(AddressRequestModel request) {
    return _cartApiService.addAddress(request);
  }

  @override
  Future<void> deleteAddress(String id) {
    return _cartApiService.deleteAddress(id);
  }

  @override
  Future<AddressModel> updateAddress(String id, AddressRequestModel request) {
    return _cartApiService.updateAddress(id, request);
  }
}
