import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:ecommerce_app/features/details/presentation/widgets/product_description_section.dart';
import 'package:ecommerce_app/features/details/presentation/widgets/product_image_section.dart';
import 'package:ecommerce_app/features/details/presentation/widgets/product_info_section.dart';
import 'package:ecommerce_app/features/details/presentation/widgets/quantity_selector.dart';
import 'package:ecommerce_app/features/details/presentation/widgets/total_price_row.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.product,
    required this.quantityController,
  });
  final ProductModel product;
  final ValueNotifier<int> quantityController;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  void _increment() {
    setState(() => quantity++);
    widget.quantityController.value = quantity;
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() => quantity--);
      widget.quantityController.value = quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.product.price * quantity;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          ProductImage(imageUrl: widget.product.coverPictureUrl),
          ProductTitleAndPrice(
            name: widget.product.name,
            price: widget.product.price,
          ),
          ProductInfo(
            productCode: widget.product.productCode,
            color: widget.product.color,
          ),
          ProductDescription(description: widget.product.description),
          const SizedBox(height: 20),
          QuantitySelector(
            quantity: quantity,
            onIncrement: _increment,
            onDecrement: _decrement,
          ),
          const SizedBox(height: 20),
          TotalPrice(totalPrice: totalPrice),
        ],
      ),
    );
  }
}

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({
    super.key,
    required this.name,
    required this.price,
  });
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            name,
            style: AppTextStyle.font28BlackSemiBold.copyWith(fontSize: 24),
            softWrap: true,
          ),
        ),
        Text(
          '${price.toStringAsFixed(1)} EGP',
          style: AppTextStyle.font28BlackSemiBold.copyWith(fontSize: 24),
        ),
      ],
    );
  }
}
