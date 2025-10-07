import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/home/data/models/categories/category_response_model.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(ApiConstants.categoriesUrl)
  Future<CategoryResponseModel> getCategories();

  @GET(ApiConstants.productsUrl)
  Future<ProductResponseModel> getProducts();
}
