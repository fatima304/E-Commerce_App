import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.color,
    required this.name,
    required this.img,
  });
  final Color color;
  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 335,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 7,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img),
          Text(name, style: AppTextStyle.font17WhiteMedium),
        ],
      ),
    );
  }
}
