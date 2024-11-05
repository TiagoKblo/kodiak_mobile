class Customer {
  final int idCustomer;
  final String companyName;

  Customer({
    required this.idCustomer,
    required this.companyName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      idCustomer: json['idCustomer'],
      companyName: json['companyName'],
    );
  }
}

class AllCustomers {
  final List<Customer> allCustomers;

  AllCustomers({required this.allCustomers});

  factory AllCustomers.fromJson(Map<String, dynamic> json) {
    return AllCustomers(
      allCustomers: (json['allCustomers'] as List)
          .map((item) => Customer.fromJson(item))
          .toList(),
    );
  }
}
