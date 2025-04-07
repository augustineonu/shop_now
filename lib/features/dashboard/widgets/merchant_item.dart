import 'package:flutter/material.dart';

import '../data/model/merchant_model.dart';

class MerchantItem extends StatelessWidget {
  final Merchant merchant;

  const MerchantItem({super.key, required this.merchant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: merchant.backgroundColor,
              ),
              child: Image.asset(
                merchant.logo,
                fit: BoxFit.contain,
                height: 25,
                width: 25,
              ),
            ),
            if (merchant.isActive)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 72,
          height: 20,
          child: Text(
            merchant.name,
            style: const TextStyle(fontSize: 12),
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
