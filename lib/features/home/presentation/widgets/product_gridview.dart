import 'package:ecommerce_app/features/home/presentation/manager/products/products_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is ProductSuccess) {
          final products = state.products;
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
                return ProductItem(
                  name: product.name,
                  price: "${product.price} EGP",
                  imageUrl: product.coverPictureUrl,
                );
              }, childCount: products.length),
            ),
          );
        } else if (state is ProductFailure) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
