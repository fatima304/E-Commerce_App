// import 'package:bloc/bloc.dart';
// import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';

// class WishlistCubit extends Cubit<List<ProductModel>> {
//   WishlistCubit() : super([]);

//   void toggleWishlist(ProductModel product) {
//     final newList = List<ProductModel>.from(state);
//     if (newList.contains(product)) {
//       newList.remove(product);
//     } else {
//       newList.add(product);
//     }
//     emit(newList);
//   }
// }
