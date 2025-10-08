class ApiConstants {
  static const String baseUrl = 'https://accessories-eshop.runasp.net//api';
  static const String authUrl = '/auth';
  static const String loginUrl = '$authUrl/login';
  static const String registerUrl = '$authUrl/register';
  static const String verifyEmailUrl = '$authUrl/verify-email';
  static const String refreshTokenUrl = '$authUrl/refresh-token';
  static const String forgetPassUrl = '$authUrl/forgot-password';
  static const String categoriesUrl = '/categories';
  static const String productsUrl = '/products';
  static const String getcartUrl = '/cart';
  static const String cartUrl = '/cart/items/{Id}';
  static const String cartItemsUrl = '/cart/items';
  static const String couponsUrl = '/coupons';
  static const String addressesUrl = '/addresses';

}
