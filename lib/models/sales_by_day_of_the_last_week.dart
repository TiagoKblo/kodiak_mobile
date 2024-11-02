class SalesByDay {
  final String issueDate;
  final String dayOfWeek;
  final int salesCount;

  SalesByDay({
    required this.issueDate,
    required this.dayOfWeek,
    required this.salesCount,
  });

  factory SalesByDay.fromJson(Map<String, dynamic> json) {
    return SalesByDay(
      issueDate: json['issueDate'],
      dayOfWeek: json['dayOfWeek'],
      salesCount: json['salesCount'],
    );
  }
}

class SalesByDayOfTheLastWeek {
  final List<SalesByDay> salesByDayOfTheLastWeek;

  SalesByDayOfTheLastWeek({required this.salesByDayOfTheLastWeek});

  factory SalesByDayOfTheLastWeek.fromJson(Map<String, dynamic> json) {
    var list = json['salesByDay'] as List;
    List<SalesByDay> salesList =
        list.map((i) => SalesByDay.fromJson(i)).toList();

    return SalesByDayOfTheLastWeek(salesByDayOfTheLastWeek: salesList);
  }
}
