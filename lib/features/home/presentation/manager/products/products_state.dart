import 'package:meta/meta.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';

@sealed
abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  const ProductSuccess(this.products);
}

class ProductFailure extends ProductState {
  final String message;
  const ProductFailure(this.message);
}
