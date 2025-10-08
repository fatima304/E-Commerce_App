import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/orders/data/models/cart/cart_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_request_model.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_response_model.dart';
import 'package:ecommerce_app/features/orders/data/models/address/address_model.dart';
import 'package:ecommerce_app/features/orders/data/models/address/address_request_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_constants.dart';
import '../models/cart/cart_response_model.dart';
part 'cart_api_service.g.dart';


@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String? baseUrl}) = _CartApiService;

  // GET cart items
  @GET(ApiConstants.getcartUrl)
  Future<CartResponseModel> getCartItems();

  // PUT add/update cart item
  @PUT(ApiConstants.cartUrl)
  Future<MessageResponseModel> addOrUpdateCartItem(
    @Path('Id') String productId,
    @Body() CartItemRequestModel body,
  );

  // POST add new cart item
  @POST(ApiConstants.cartItemsUrl)
  Future<MessageResponseModel> addCartItem(
    @Body() CartItemRequestModel body,
  );

  // DELETE cart item
  @DELETE(ApiConstants.cartUrl)
  Future<void> deleteCartItem(
    @Path('Id') String itemId,
  );

  @GET(ApiConstants.couponsUrl)
  Future<CouponResponseModel> getCoupons();

  @POST(ApiConstants.couponsUrl)
  Future<CouponModel> addCoupon(@Body() CouponRequestModel body);

  @GET(ApiConstants.addressesUrl)
  Future<List<AddressModel>> getAddresses();

  @POST(ApiConstants.addressesUrl)
  Future<AddressModel> addAddress(@Body() AddressRequestModel body);

  @DELETE('${ApiConstants.addressesUrl}/{id}')
  Future<void> deleteAddress(@Path('id') String id);

  @PUT('${ApiConstants.addressesUrl}/{id}')
  Future<AddressModel> updateAddress(
    @Path('id') String id,
    @Body() AddressRequestModel body,
  );
}
