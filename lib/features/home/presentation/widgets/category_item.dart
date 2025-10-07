import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          SvgPicture.network(
            imageUrl,
            width: 20,
            height: 20,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image, size: 20),
          ),
          const SizedBox(width: 5),
          Text(name),
        ],
      ),
    );
  }
}
