class TopProducts {
  final String productId;
  final String productDescription;
  final String productCount;
  final String total;

  TopProducts({
    required this.productId,
    required this.productDescription,
    required this.productCount,
    required this.total,
  });

  factory TopProducts.fromJson(Map<String, dynamic> json) {
    return TopProducts(
      productId: json['productId'],
      productDescription: json['productDescription'],
      productCount: json['productCount'],
      total: json['total'],
    );
  }
}

class LastPurchase {
  final String issueDate;
  final String productId;
  final String productDescription;
  final String quantity;
  final String total;

  LastPurchase({
    required this.issueDate,
    required this.productId,
    required this.productDescription,
    required this.quantity,
    required this.total,
  });

  factory LastPurchase.fromJson(Map<String, dynamic> json) {
    return LastPurchase(
      issueDate: json['issueDate'],
      productId: json['productId'],
      productDescription: json['productDescription'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }
}

class CustomerHistory {
  final int idCustomer;
  final String companyName;
  final List<TopProducts> topProducts;
  final List<LastPurchase> lastPurchase;
  final String totalLastPurchase;

  CustomerHistory({
    required this.idCustomer,
    required this.companyName,
    required this.topProducts,
    required this.lastPurchase,
    required this.totalLastPurchase,
  });

  factory CustomerHistory.fromJson(Map<String, dynamic> json) {
    return CustomerHistory(
      idCustomer: json['idCustomer'],
      companyName: json['companyName'],
      topProducts: (json['topProducts'] as List)
          .map((item) => TopProducts.fromJson(item))
          .toList(),
      lastPurchase: (json['lastPurchase'] as List)
          .map((item) => LastPurchase.fromJson(item))
          .toList(),
      totalLastPurchase: json['totalLastPurchase'],
    );
  }
}
