import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:flutter/material.dart';

class AppliedCouponCard extends StatelessWidget {
  final CouponModel coupon;

  const AppliedCouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildCouponIcon(),
          const SizedBox(width: 12),
          Expanded(child: _buildCouponDetails()),
          _buildSuccessIndicator(),
        ],
      ),
    );
  }

  Widget _buildCouponIcon() {
    return Icon(
      Icons.local_offer,
      color: AppColors.mainColor,
      size: 24,
    );
  }

  Widget _buildCouponDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coupon Applied: ${coupon.couponCode}',
          style: AppTextStyle.font17BlackSemiBold,
        ),
        Text(
          'Discount: ${_formatDiscount(coupon)}',
          style: AppTextStyle.font13DarkGreyRegular,
        ),
      ],
    );
  }

  Widget _buildSuccessIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  String _formatDiscount(CouponModel coupon) {
    return coupon.couponType == 'percentage'
        ? '${coupon.discountValue}%'
        : '\$${coupon.discountValue}';
  }
}
