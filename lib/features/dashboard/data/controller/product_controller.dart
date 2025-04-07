import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_now/features/dashboard/data/model/models.dart';

class ProductController extends GetxController {
  var allProducts = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var merchants = <Merchant>[].obs;

  var selectedProduct = Product().obs;

  @override
  void onInit() {
    loadProducts();
    loadMerchants();
    super.onInit();
  }

  void loadProducts() {
    allProducts.value = [
      Product(
        store: 'agadabassey',
        name: 'iPhone XS Max 4GB',
        image: 'assets/images/nokia_phone.png',
        price: 295999,
        originalPrice: 315000,
        hasDiscount: true,
        merchantLogo: 'assets/images/ogabassey.png',
      ),
      Product(
        store: 'okayfones',
        name: 'Anker Soundcore',
        image: 'assets/images/nokia_phone.png',
        price: 39780,
        originalPrice: 88000,
        merchantLogo: 'assets/images/ogabassey.png',
        hasDiscount: true,
      ),
      Product(
        store: 'iMate Stores',
        name: 'iPhone 12 Pro',
        image: 'assets/images/nokia_phone.png',
        price: 490500,
        originalPrice: 515000,
        hasDiscount: true,
        merchantLogo: 'assets/images/ogabassey.png',
      ),
      Product(
        store: 'Nokia',
        name: 'Nokia G20',
        image: 'assets/images/nokia_phone.png',
        price: 39780,
        originalPrice: 88000,
        hasDiscount: false,
        merchantLogo: 'assets/images/ogabassey.png',
      ),
    ];

    filteredProducts.value = allProducts;
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredProducts.value = allProducts;
    } else {
      filteredProducts.value = allProducts.where((product) {
        return (product.name != null && product.name!.toLowerCase().contains(query.toLowerCase())) ||
            (product.store != null && product.store!.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    }
  }

  void loadMerchants() {
    merchants.value = [
      Merchant(
        name: "Justrite",
        logo: "assets/images/icons8-store.png",
        backgroundColor: const Color(0xFF1D297E),
      ),
      Merchant(
        name: "Orile Restaurant",
        logo: "assets/images/icons8-store.png",
        backgroundColor: Colors.black,
      ),
      Merchant(
        name: "Slot",
        logo: "assets/images/slot-nigeria-logo.png",
        backgroundColor: const Color(0xFFE53935),
      ),
      Merchant(
        name: "Pointek",
        logo: "assets/images/icons8-store.png",
        backgroundColor: const Color(0xFF0078D4),
      ),
      Merchant(
        name: "ogabassey",
        logo: "assets/images/ogabassey.png",
        backgroundColor: const Color(0xFFF2F2F2),
      ),
      Merchant(
        name: "Casper Stores",
        logo: "assets/images/icons8-store.png",
        backgroundColor: const Color(0xFFFF487E),
      ),
      Merchant(
        name: "Dreamworks",
        logo: "assets/images/icons8-store.png",
        backgroundColor: const Color(0xFF393B9C),
      ),
      Merchant(
        name: "Hubmart",
        logo: "assets/images/icons8-store.png",
        backgroundColor: Colors.black,
      ),
      Merchant(
        name: "Just Used",
        logo: "assets/images/icons8-store.png",
        backgroundColor: const Color(0xFF00B8E2),
      ),
      Merchant(
        name: "Just fones",
        logo: "assets/images/icons8-store.png",
        backgroundColor: Colors.black,
      ),
    ];
  }
}
