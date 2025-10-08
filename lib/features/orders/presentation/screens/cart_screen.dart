import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/cart_item.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/checkout_button.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/coupon_section.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/delivery_address_section.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/total_price_section.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          'Cart',
          style: AppTextStyle.font17BlackSemiBold.copyWith(fontSize: 20),
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
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
          if (state is CartLoaded && state.cart.cartItems.isEmpty) {
            return Center(
              child: Image.asset(AppImages.emptyCart, width: 700, height: 700),
            );
          }
          return CustomScrollView(
            slivers: [
              _buildCartItemsSliver(context, state),
              const SliverToBoxAdapter(child: DeliveryAddressSection()),
              const SliverToBoxAdapter(child: CouponSection()),
              const SliverToBoxAdapter(child: TotalPriceSection()),
              const SliverToBoxAdapter(child: CheckoutButton()),
              // Bottom padding
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItemsSliver(BuildContext context, CartState state) {
    if (state is CartLoaded) {
      final items = state.cart.cartItems;
      return SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < items.length - 1 ? 16 : 0,
              ),
              child: CartItem(
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
              ),
            );
          }, childCount: items.length),
        ),
      );
    }
    if (state is CartLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (state is CartFailure) {
      return SliverFillRemaining(child: Center(child: Text(state.error)));
    }
    context.read<CartCubit>().getCart();
    return const SliverFillRemaining(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
