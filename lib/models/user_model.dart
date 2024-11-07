class User {
  final String name;
  final String email;
  final String position;
  final String idCompany;
  final String tradeName;

  User({
    required this.name,
    required this.email,
    required this.position,
    required this.idCompany,
    required this.tradeName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      position: json['position'],
      idCompany: json['idCompany'],
      tradeName: json['tradeName'],
    );
  }
}
