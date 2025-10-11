import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class WishlistEmptyView extends StatelessWidget {
  const WishlistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: AppTextStyle.font22WhiteMedium.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items you love to see them here',
            style: AppTextStyle.font15BlackMedium.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
