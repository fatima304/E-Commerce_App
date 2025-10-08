import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Price',
          style: AppTextStyle.font28BlackSemiBold.copyWith(fontSize: 22),
        ),
        Text(
          '${totalPrice.toStringAsFixed(0)} EGP',
          style: AppTextStyle.font28BlackSemiBold.copyWith(fontSize: 22),
        ),
      ],
    );
  }
}
