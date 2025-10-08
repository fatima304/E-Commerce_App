import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is! CartLoaded) {
          return const SizedBox.shrink();
        }

        final cartState = state;

        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Info',
                style: AppTextStyle.font17BlackSemiBold.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _PriceRow(
                      label: 'Subtotal',
                      formattedAmount: cartState.formattedSubtotal,
                      isTotal: false,
                    ),
                    const SizedBox(height: 8),
                    _PriceRow(
                      label: 'Shipping cost',
                      formattedAmount: cartState.formattedShippingCost,
                      isTotal: false,
                    ),
                    if (cartState.discount > 0) ...[
                      const SizedBox(height: 8),
                      _PriceRow(
                        label: 'Discount',
                        formattedAmount: '-${cartState.formattedDiscount}',
                        isTotal: false,
                        isDiscount: true,
                      ),
                    ],
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                    _PriceRow(
                      label: 'Total',
                      formattedAmount: cartState.formattedTotal,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String formattedAmount;
  final bool isTotal;
  final bool isDiscount;

  const _PriceRow({
    required this.label,
    required this.formattedAmount,
    required this.isTotal,
    this.isDiscount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyle.font17BlackSemiBold.copyWith(fontSize: 18)
              : AppTextStyle.font13DarkGreyRegular,
        ),
        Text(
          formattedAmount,
          style: isTotal
              ? AppTextStyle.font17BlackSemiBold.copyWith(
                  fontSize: 18,
                  color: AppColors.mainColor,
                )
              : isDiscount
                  ? AppTextStyle.font13DarkGreyRegular.copyWith(color: Colors.green)
                  : AppTextStyle.font17BlackSemiBold,
        ),
      ],
    );
  }
}
