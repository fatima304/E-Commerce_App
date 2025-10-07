import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.name, required this.price, required this.imageUrl});

  final String name;
  final String price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                // 'https://tse3.mm.bing.net/th/id/OIP._Vb1AK23aukUzfM3F8Yv5AHaHa?pid=Api&P=0&h=220',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.font15BlackMedium.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 4),
                Text(
                 price,
                  style: AppTextStyle.font15BlackMedium.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
