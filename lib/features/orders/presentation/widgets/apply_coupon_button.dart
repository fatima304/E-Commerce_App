import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

/// Widget for the apply coupon button
class ApplyCouponButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onApply;

  const ApplyCouponButton({
    super.key,
    required this.isLoading,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onApply,
      style: _buildButtonStyle(),
      child: _buildButtonChild(),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildButtonChild() {
    if (isLoading) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    return const Text('Apply');
  }
}
