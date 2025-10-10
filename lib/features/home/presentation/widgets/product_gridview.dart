import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_state.dart';
import 'package:ecommerce_app/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_item.dart';
import '../../data/models/categories/category_model.dart';
import '../../data/models/products/product_model.dart';

class ProductGridView extends StatelessWidget {
  final CategoryModel? category;

  const ProductGridView({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is ProductSuccess) {
          List<ProductModel> products = state.products;

          if (category != null && category!.name != 'all') {
            products = products
                .where((p) => p.categories.contains(category!.name))
                .toList();
          }

          return SliverPadding(
            padding: const EdgeInsets.only(bottom: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = products[index];
                return BlocProvider.value(
                  value: getIt<WishlistCubit>(),
                  child: ProductItem(
                    product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.detailsScreen,
                        arguments: product,
                      );
                    },
                  ),
                );
              }, childCount: products.length),
            ),
          );
        } else if (state is ProductFailure) {
          return Center(child: Text('Error: ${state.message}'));
        }

        return SliverToBoxAdapter(child: const SizedBox.shrink());
      },
    );
  }
}
