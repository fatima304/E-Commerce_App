import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/address/address_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/address/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Address', style: AppTextStyle.font17BlackSemiBold),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.addressScreen),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppImages.map),
                      const SizedBox(width: 16),
                      Expanded(child: _buildAddressContent(context, state)),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.darkGrey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressContent(BuildContext context, AddressState state) {
    if (state is AddressLoaded && state.addresses.isNotEmpty) {
      final primaryAddress = state.addresses.first;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${primaryAddress.street}, ${primaryAddress.apartment}',
            style: AppTextStyle.font15BlackMedium,
          ),
          Text(primaryAddress.city, style: AppTextStyle.font13DarkGreyRegular),
        ],
      );
    } else if (state is AddressError) {
      return Text(
        'Error loading address',
        style: AppTextStyle.font13DarkGreyRegular,
      );
    } else {
      return Text(
        'Add delivery address',
        style: AppTextStyle.font15BlackMedium,
      );
    }
  }
}
