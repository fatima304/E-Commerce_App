import 'package:ecommerce_app/features/home/domain/repo/home_repo.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCubit extends Cubit<ProductState> {
  final HomeRepository homeRepository;

  ProductCubit(this.homeRepository) : super(const ProductInitial());

  Future<void> fetchProducts() async {
    emit(const ProductLoading());
    try {
      final products = await homeRepository.getProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
