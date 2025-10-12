import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class DrawerMenuItems extends StatelessWidget {
  DrawerMenuItems({super.key});

  final List<_MenuItemData> menuItems = [
    _MenuItemData(Icons.dark_mode, 'Dark Mode', true),
    _MenuItemData(Icons.info_outline, 'Account Information', false),
    _MenuItemData(Icons.lock_outline, 'Password', false),
    _MenuItemData(Icons.shopping_bag_outlined, 'Order', false),
    _MenuItemData(Icons.wallet_outlined, 'My Cards', false),
    _MenuItemData(Icons.favorite_outline, 'Wishlist', false),
    _MenuItemData(Icons.settings_outlined, 'Settings', false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuItem(item, context);
      },
    );
  }

  Widget _buildMenuItem(_MenuItemData item, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(item.icon, color: AppColors.black, size: 24),
        title: Text(item.title, style: AppTextStyle.font15BlackMedium),
        trailing: item.hasToggle
            ? Switch(
                value: false,
                onChanged: (value) {},
                activeThumbColor: AppColors.mainColor,
              )
            : const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.darkGrey,
              ),
        onTap: () {
          if (item.title == 'Wishlist') {
            Navigator.pushNamed(context, Routes.wishlistScreen);
          }
          // Add other navigation logic here as needed
        },
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String title;
  final bool hasToggle;

  _MenuItemData(this.icon, this.title, this.hasToggle);
}
