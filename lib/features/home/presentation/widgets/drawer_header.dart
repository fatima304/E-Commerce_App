import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/helper/user_service.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.equalizer, color: AppColors.darkGrey),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildProfilePicture(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String?>(
                      future: UserService.getUserName(),
                      builder: (context, snapshot) {
                        final userName = snapshot.data ?? 'User';
                        return Text(
                          userName,
                          style: AppTextStyle.font17BlackSemiBold.copyWith(fontSize: 18),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green, size: 16),
                        const SizedBox(width: 4),
                        Text('Verified Profile', style: AppTextStyle.font13DarkGreyRegular),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(AppImages.profile),
          backgroundColor: AppColors.lightGrey,
        ),
      ),
    );
  }
}
