class Product {
  final String idProduct;
  final String descriptionProduct;
  final String totalSelling;
  final String totalSalesValue;

  Product({
    required this.idProduct,
    required this.descriptionProduct,
    required this.totalSelling,
    required this.totalSalesValue,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      idProduct: json['idProduct'],
      descriptionProduct: json['descriptionProduct'],
      totalSelling: json['totalSelling'],
      totalSalesValue: json['totalSalesValue'],
    );
  }
}

class TopSellingProducts {
  final List<Product> topSellingProducts;

  TopSellingProducts({required this.topSellingProducts});

  factory TopSellingProducts.fromJson(Map<String, dynamic> json) {
    return TopSellingProducts(
      topSellingProducts: (json['topProducts'] as List)
          .map((i) => Product.fromJson(i))
          .toList(),
    );
  }
}
