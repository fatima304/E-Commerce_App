import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/category/category_state.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategorySuccess) {
          final categories = state.categories;
          return SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                   onTap: () {
                     Navigator.pushNamed(
                      context,
                      Routes.categoryScreen,
                      arguments: category,
                    );
                  },
                  child: CategoryItem(
                    name: category.name,
                    imageUrl: category.coverPictureUrl,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          );
        } else if (state is CategoryFailure) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
