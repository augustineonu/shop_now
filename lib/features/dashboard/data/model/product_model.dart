class Product {
  final String? store;
  final String ?name;
  final String ?image;
  final String ?merchantLogo;
  final double ?price;
  final double? originalPrice;
  final bool ?hasDiscount;

  Product({
     this.store,
     this.name,
     this.image,
     this.price,
     this.merchantLogo,
    this.originalPrice,
    this.hasDiscount = false,
  });
}
