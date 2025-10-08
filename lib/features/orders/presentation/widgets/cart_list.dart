import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_state.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is CartSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is CartLoaded) {
          final items = state.cart.cartItems;
          if (items.isEmpty) {
            return Center(
              child: Image.asset(AppImages.emptyCart, width: 700, height: 700),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final item = items[index];
              return CartItem(
                productName: item.productName,
                imageUrl: item.productCoverUrl,
                price: item.finalPricePerUnit,
                quantity: item.quantity,
                onRemove: () =>
                    context.read<CartCubit>().deleteItem(item.itemId),
                onIncrement: () => context.read<CartCubit>().updateItemQuantity(
                  item.itemId,
                  item.productId,
                  item.quantity + 1,
                ),
                onDecrement: () {
                  final newQty = item.quantity - 1;
                  if (newQty >= 1) {
                    context.read<CartCubit>().updateItemQuantity(
                      item.itemId,
                      item.productId,
                      newQty,
                    );
                  }
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: items.length,
          );
        }
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CartFailure) {
          return Center(child: Text(state.error));
        }
        context.read<CartCubit>().getCart();
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
