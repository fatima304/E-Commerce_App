import 'dart:developer';
import 'package:ecommerce_app/core/helper/alert_dialog.dart';
import 'package:ecommerce_app/core/helper/user_service.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/logout/logout_cubit.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/logout/logout_state.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            log('Success');
            // Clear user data on logout
            UserService.clearUserData();
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginScreen,
              (route) => false,
            );
          } else if (state is LogoutFailure) {
            log('Failure');
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return ListTile(
            leading: const Icon(Icons.logout, color: AppColors.red, size: 24),
            title: Text(
              'Logout',
              style: AppTextStyle.font15BlackMedium.copyWith(
                color: AppColors.red,
              ),
            ),
            onTap: state is LogoutLoading
                ? null
                : () async {
                    final confirm = await showConfirmationDialog(
                      context: context,
                      title: 'Logout Confirmation',
                      message: 'Are you sure you want to log out?',
                      confirmText: 'Log Out',
                      confirmColor: Colors.red,
                    );
                    if (confirm == true) {
                      context.read<LogoutCubit>().logout();
                    }
                  },
            trailing: state is LogoutLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : null,
          );
        },
      ),
    );
  }
}
