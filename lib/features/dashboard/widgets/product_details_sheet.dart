import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_now/core/constants/color_pallete.dart';
import 'package:shop_now/core/styles/text_style.dart';
import 'package:shop_now/features/dashboard/data/model/product_model.dart';

class ProductDetailSheet extends StatefulWidget {
  final Product product;

  const ProductDetailSheet({required this.product});

  @override
  State<ProductDetailSheet> createState() => _ProductDetailSheetState();
}

class _ProductDetailSheetState extends State<ProductDetailSheet> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.65,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: product.price ?? '',
                    child: Image.asset(product.image!, height: 200),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.name ?? '',
                  style: getExtraBoldStyle(fontSize: 28.sp),
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "₦${product.price?.toStringAsFixed(0)}",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: primaryColor,
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(width: 8),
                    if (product.hasDiscount ?? false)
                      Text(
                        "₦${product.originalPrice?.toStringAsFixed(0)}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: oldPalleteColor,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 24),

                // Quantity Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: decrement,
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: increment,
                          icon: Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your cart logic here
                      Navigator.pop(context);
                      Get.snackbar(
                        "Added to Cart",
                        "${product.name} x$quantity added.",
                        backgroundColor:
                            Colors.greenAccent.shade100, // This should work
                        colorText: Colors.black,
                        snackPosition: SnackPosition.TOP,
                        borderRadius: 12,
                        margin: EdgeInsets.all(10),
                      );
                    },
                    icon: Icon(Icons.shopping_cart_outlined, color: white),
                    label: Text(
                      "Add to Cart",
                      style: getSemiBoldStyle(
                        color: white,
                        fontSize: 16.sp,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: primaryColor,
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
