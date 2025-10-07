import 'package:ecommerce_app/features/home/domain/repo/home_repo.dart';
import 'package:ecommerce_app/features/home/presentation/manager/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRepository homeRepository;

  CategoryCubit(this.homeRepository) : super(const CategoryInitial());

  Future<void> fetchCategories() async {
    emit(const CategoryLoading());
    try {
      final response = await homeRepository.getCategories();
      emit(CategorySuccess(response));
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
