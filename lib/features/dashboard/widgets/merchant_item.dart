import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_now/core/constants/color_pallete.dart';

import '../data/model/merchant_model.dart';

class MerchantItem extends StatelessWidget {
  final Merchant merchant;
  final int index;

  const MerchantItem({super.key, required this.merchant, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 60.sp,
              width: 60.sp,
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: merchant.backgroundColor,
              ),
              child: Image.asset(
                merchant.logo,
                // fit: BoxFit.contain,
                height: 20.h,
                width: 20.w,
                color: index == 4 ? Colors.black : white,
              ),
            ),
            if (merchant.isActive)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 12.sp,
                  height: 12.sp,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5.sp),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 72.sp,
          height: 20.sp,
          child: Text(
            merchant.name,
            style: TextStyle(fontSize: 12.sp),
            textAlign: TextAlign.center,
            // maxLines: 2,
            overflow: TextOverflow.visible,
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
