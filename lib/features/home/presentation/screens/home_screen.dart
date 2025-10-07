import 'package:ecommerce_app/features/home/presentation/widgets/category_section.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_header.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product_gridview.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
