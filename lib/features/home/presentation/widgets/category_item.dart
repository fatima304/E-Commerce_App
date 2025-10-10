import 'package:ecommerce_app/core/widgets/safe_network_image_universal.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          SafeNetworkImageUniversal(imageUrl: imageUrl, width: 20, height: 20),
          const SizedBox(width: 5),
          Padding(padding: const EdgeInsets.only(left: 10), child: Text(name)),
        ],
      ),
    );
  }
}
