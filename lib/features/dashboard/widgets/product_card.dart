import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_now/core/constants/color_pallete.dart';
import 'package:shop_now/features/dashboard/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Hero(
                  tag: product.price ?? '',
                  child: Image.asset(product.image!,
                      height: 100, fit: BoxFit.contain)),
              if (product.hasDiscount ?? false)
                Positioned(
                  top: 3,
                  left: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Pay ",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: oldPalleteColor),
                        ),
                        Text(
                          "${(100 - (product.price! / (product.originalPrice ?? product.price!) * 100)).toInt()}%",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: 2,
                right: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    product.merchantLogo!,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            product.name ??'',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "₦ ${product.price?.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: primaryColor,
                ),
              ),
              if (product.hasDiscount ?? false)
                Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      "₦ ${product.originalPrice?.toStringAsFixed(0)}",
                      style: TextStyle(
                        decorationColor: oldPalleteColor,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: oldPalleteColor,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
