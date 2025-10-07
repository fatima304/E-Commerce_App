import 'package:ecommerce_app/features/home/data/models/categories/category_model.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:ecommerce_app/features/home/data/network/api_service.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getCategories();
    Future<List<ProductModel>> getProducts();

}

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepositoryImpl(this._homeApiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _homeApiService.getCategories();
    return response.categories;
  }
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _homeApiService.getProducts();
    return response.items;
  }
}
