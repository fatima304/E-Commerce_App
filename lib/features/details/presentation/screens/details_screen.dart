import 'package:ecommerce_app/features/details/presentation/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_state.dart';
import 'package:ecommerce_app/core/routes/routes.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final ProductModel product;
  static final ValueNotifier<int> _quantityController = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              buildSliverAppBar(context),
              SliverToBoxAdapter(child: ProductDetails(product: product, quantityController: _quantityController)),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartSuccess) {
                  Navigator.pushNamed(context, Routes.cartScreen);
                } else if (state is CartFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                final quantity = _quantityController.value;
                final isLoading = state is CartLoading;
                return MainButton(
                  onTap: isLoading
                      ? null
                      : () {
                          // For adding new product to cart, use POST
                          context.read<CartCubit>().addItem(product.id, quantity);
                        },
                  text: isLoading ? 'Adding...' : 'Add to Cart',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSliverAppBar(BuildContext context) {
  return SliverAppBar(
    expandedHeight: 20,
    stretch: true,
    leading: const CustomBackButton(),
    backgroundColor: Colors.transparent,
    flexibleSpace: const FlexibleSpaceBar(centerTitle: true),
  );
}

