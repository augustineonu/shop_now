import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_now/core/constants/assets_manager.dart';
import 'package:shop_now/core/constants/color_pallete.dart';
import 'package:shop_now/core/styles/text_style.dart';
import 'package:shop_now/features/dashboard/data/controller/product_controller.dart';
import 'package:shop_now/features/dashboard/widgets/product_card.dart';
import 'package:shop_now/features/dashboard/widgets/product_details_sheet.dart';
import 'package:shop_now/features/dashboard/widgets/widgets.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160), // 👈 Custom height
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pay later",
                        style: getExtraBoldStyle(
                          fontSize: 28.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "everywhere",
                            style: getExtraBoldStyle(
                              fontSize: 28.sp,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: white),
                            child: SvgPicture.asset(
                              AssetsManager.exclamation,
                              height: 12.sp,
                              width: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Shopping limit: ₦0",
                        style: TextStyle(fontSize: 12.sp, color: textColorDim),
                      ),
                      const SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Text("Activate Credit",
                            style: getBoldStyle(fontSize: 13.sp, color: white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.fromLTRB(20, 18, 20, 24),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5FF),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          onChanged: (value) =>
                              Get.find<ProductController>().search(value),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: InputBorder.none,
                            hintText: "Search for products or stores",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(AssetsManager.scanner),
                        onPressed: () {
                          // Add scan functionality here
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(
              //   height: 14,
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                height: 450,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.normal),
                        shrinkWrap: true,
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedProduct.value =
                                  controller.filteredProducts[
                                      index]; // from your GetX controller
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                sheetAnimationStyle: AnimationStyle(
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 300),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (_) => ProductDetailSheet(
                                    product:
                                        controller.filteredProducts[index]),
                              );
                            },
                            child: ProductCard(
                                product: controller.filteredProducts[index]),
                          );
                        },
                      ),
                    ),
                    // SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.filteredProducts.length,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemBuilder: (_, index) {
                          return ProductCard(
                              product: controller.filteredProducts[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 15, top: 25),
                height: 500.sp,
                decoration: BoxDecoration(color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Merchants",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w900),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to View All
                            },
                            child: Text(
                              "View all",
                              style: getRegularStyle(color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.merchants.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 33,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            final merchant = controller.merchants[index];
                            return MerchantItem(merchant: merchant);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
