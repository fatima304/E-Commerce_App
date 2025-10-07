import 'package:ecommerce_app/features/home/presentation/widgets/product_gridview.dart';
import 'package:flutter/material.dart';
import '../../data/models/categories/category_model.dart';

class CategoryProductScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryProductScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: CustomScrollView(
        slivers: [
          ProductGridView(category: category),
        ],
      ),
    );
  }
}
