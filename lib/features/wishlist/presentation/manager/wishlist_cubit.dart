import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<List<ProductModel>> {
  WishlistCubit() : super([]);

  void addToWishlist(ProductModel product) {
    if (!state.contains(product)) {
      emit([...state, product]);
    }
  }

  void removeFromWishlist(ProductModel product) {
    emit(state.where((item) => item.id != product.id).toList());
  }

  void toggleWishlist(ProductModel product) {
    if (isInWishlist(product)) {
      removeFromWishlist(product);
    } else {
      addToWishlist(product);
    }
  }

  bool isInWishlist(ProductModel product) {
    return state.any((item) => item.id == product.id);
  }

  void clearWishlist() {
    emit([]);
  }
}
