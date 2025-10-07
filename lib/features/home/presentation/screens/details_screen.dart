import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      product.coverPictureUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            product.name,
                            style: AppTextStyle.font28BlackSemiBold.copyWith(
                              fontSize: 24,
                            ),
                            softWrap: true,
                          ),
                        ),
                        Text(
                          '${product.price.toStringAsFixed(0)} EGP',
                          style: AppTextStyle.font28BlackSemiBold.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Product Code: ${product.productCode}',
                      style: AppTextStyle.font17WhiteMedium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'Product Color: ${product.color}',
                      style: AppTextStyle.font17WhiteMedium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'Description',
                      style: AppTextStyle.font22WhiteMedium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      product.description,
                      style: AppTextStyle.font17WhiteMedium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 400),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget buildSliverAppBar(BuildContext context) {
  return SliverAppBar(
    expandedHeight: 20,
    stretch: true,
    leading: CustomBackButton(),
    backgroundColor: Colors.transparent,
    flexibleSpace: FlexibleSpaceBar(centerTitle: true),
  );
}
