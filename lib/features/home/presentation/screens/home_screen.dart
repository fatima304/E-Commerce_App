import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/logout/logout_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/category_section.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/drawer_menu.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_header.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product_gridview.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product_section.dart';
import 'package:ecommerce_app/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CategoryCubit>()..fetchCategories(),
              ),
              BlocProvider(
                create: (context) => getIt<ProductCubit>()..fetchProducts(),
              ),
               BlocProvider(
                create: (context) => getIt<LogoutCubit>(),
              ),
              BlocProvider.value(
                value: getIt<WishlistCubit>(),
              ),
            ],
            child: Scaffold(
        drawer: const DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeHeader()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: CategorySection()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const ProductSection(),
              const ProductGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
