import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(child: _buildMenuItems(context)),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                    Text(
                      'Mrh Raju',
                      style: AppTextStyle.font17BlackSemiBold.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Verified Profile',
                          style: AppTextStyle.font13DarkGreyRegular,
                        ),
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

  Widget _buildMenuItems(BuildContext context) {
    final menuItems = [
      _MenuItemData(Icons.dark_mode, 'Dark Mode', true),
      _MenuItemData(Icons.info_outline, 'Account Information', false),
      _MenuItemData(Icons.lock_outline, 'Password', false),
      _MenuItemData(Icons.shopping_bag_outlined, 'Order', false),
      _MenuItemData(Icons.wallet_outlined, 'My Cards', false),
      _MenuItemData(Icons.favorite_outline, 'Wishlist', false),
      _MenuItemData(Icons.settings_outlined, 'Settings', false),
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuItem(item);
      },
    );
  }

  Widget _buildMenuItem(_MenuItemData item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(item.icon, color: AppColors.black, size: 24),
        title: Text(item.title, style: AppTextStyle.font15BlackMedium),
        trailing: item.hasToggle
            ? Switch(
                value: false, // TODO: Connect to theme state
                onChanged: (value) {
                  // TODO: Handle dark mode toggle
                },
                activeThumbColor: AppColors.mainColor,
              )
            : const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.darkGrey,
              ),
        onTap: () {
          // TODO: Handle menu item navigation
        },
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
          // TODO: Handle logout
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

class _MenuItemData {
  final IconData icon;
  final String title;
  final bool hasToggle;

  _MenuItemData(this.icon, this.title, this.hasToggle);
}
