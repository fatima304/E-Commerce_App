import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/orders/data/models/coupon/coupon_model.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/coupons/coupon_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/coupons/coupon_state.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/applied_coupon_card.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/apply_coupon_button.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/coupon_input_field.dart';
import 'package:ecommerce_app/features/orders/presentation/widgets/coupon_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponSection extends StatefulWidget {
  const CouponSection({super.key});

  @override
  State<CouponSection> createState() => _CouponSectionState();
}

class _CouponSectionState extends State<CouponSection> {
  final TextEditingController _couponController = TextEditingController();
  CouponModel? _selectedCoupon;

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit, CouponState>(
      listener: _handleCouponStateChanges,
      builder: (context, state) => _buildCouponSection(state),
    );
  }

  void _handleCouponStateChanges(BuildContext context, CouponState state) {
    if (state is CouponAddSuccess) {
      setState(() {
        _selectedCoupon = state.coupon;
      });
      context.read<CartCubit>().applyCoupon(state.coupon);
      _showSuccessMessage(context, state.coupon);
    } else if (state is CouponFailure) {
      _showErrorMessage(context, state.error);
    }
  }

  Widget _buildCouponSection(CouponState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 12),
          _selectedCoupon != null
              ? _buildAppliedCouponCard()
              : _buildCouponInputRow(state),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Coupon Code',
          style: AppTextStyle.font17BlackSemiBold.copyWith(fontSize: 18),
        ),
        if (_selectedCoupon != null) _buildRemoveButton(),
      ],
    );
  }

  Widget _buildRemoveButton() {
    return IconButton(
      onPressed: _removeCoupon,
      icon: const Icon(Icons.close),
    );
  }

  Widget _buildAppliedCouponCard() {
    return AppliedCouponCard(coupon: _selectedCoupon!);
  }

  Widget _buildCouponInputRow(CouponState state) {
    return Row(
      children: [
        Expanded(
          child: CouponInputField(controller: _couponController),
        ),
        const SizedBox(width: 12),
        ApplyCouponButton(
          isLoading: state is CouponLoading,
          onApply: () => _applyCoupon(state),
        ),
      ],
    );
  }

  void _applyCoupon(CouponState state) {
    if (_couponController.text.isNotEmpty) {
      final discountPercentage = CouponUtils.parseDiscountFromCode(_couponController.text);
      final coupon = CouponUtils.createMockCoupon(_couponController.text, discountPercentage);
      
      context.read<CartCubit>().applyCoupon(coupon);
      setState(() {
        _selectedCoupon = coupon;
      });
      _showSuccessMessage(context, coupon);
    }
  }

  void _removeCoupon() {
    context.read<CartCubit>().removeCoupon();
    setState(() {
      _selectedCoupon = null;
      _couponController.clear();
    });
  }

  void _showSuccessMessage(BuildContext context, CouponModel coupon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Coupon applied successfully! ${coupon.discountValue.toInt()}% discount',
        ),
      ),
    );
  }

  void _showErrorMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }
}