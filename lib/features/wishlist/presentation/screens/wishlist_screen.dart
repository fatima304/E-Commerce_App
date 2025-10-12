import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:ecommerce_app/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:ecommerce_app/features/wishlist/presentation/widgets/wishlist_empty_view.dart';
import 'package:ecommerce_app/features/wishlist/presentation/widgets/wishlist_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wishlist',
                    style: AppTextStyle.font22WhiteMedium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: BlocBuilder<WishlistCubit, List<ProductModel>>(
                builder: (context, wishlistItems) {
                  if (wishlistItems.isEmpty) {
                    return const WishlistEmptyView();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomScrollView(
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.75,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final product = wishlistItems[index];
                            return WishlistProductItem(product: product);
                          }, childCount: wishlistItems.length),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 20)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
