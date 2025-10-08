import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is! CartLoaded) {
          return const SizedBox.shrink();
        }

        final cartState = state;
        return MainButton(
          text: 'Checkout',
          onTap: () {
            _handleCheckout(context, cartState.formattedTotal);
          },
        );
      },
    );
  }

  void _handleCheckout(BuildContext context, String formattedTotal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Checkout'),
          content: Text(
            'Proceed to checkout with total amount: $formattedTotal?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to order confirmation screen
                Navigator.pushNamed(context, Routes.orderConfirmationScreen);
              },
              child: const Text('Proceed'),
            ),
          ],
        );
      },
    );
  }
}
