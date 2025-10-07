import 'package:ecommerce_app/features/home/data/models/categories/category_model.dart';
import 'package:meta/meta.dart';

@sealed
abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  const CategorySuccess(this.categories);
}

class CategoryFailure extends CategoryState {
  final String message;
  const CategoryFailure(this.message);
}
