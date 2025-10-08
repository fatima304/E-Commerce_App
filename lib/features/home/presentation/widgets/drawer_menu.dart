import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/drawer_items.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeaderWidget(),
          Expanded(child: DrawerMenuItems()),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: ListTile(
        leading: const Icon(Icons.logout, color: AppColors.red, size: 24),
        title: Text(
          'Logout',
          style: AppTextStyle.font15BlackMedium.copyWith(color: AppColors.red),
        ),
        onTap: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logout functionality would be implemented here'),
            ),
          );
        },
      ),
    );
  }
}
