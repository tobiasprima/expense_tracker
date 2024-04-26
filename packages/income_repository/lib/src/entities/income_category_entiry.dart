class IncomeCategoryEntity {
  String incomeCategoryId;
  String name;
  int totalIncome;
  String icon;
  int color;

  IncomeCategoryEntity({
    required this.incomeCategoryId,
    required this.name,
    required this.totalIncome,
    required this.icon,
    required this.color,
  });

  Map<String, Object?> toDocument() {
    return {
      'incomeCategoryId': incomeCategoryId,
      'name': name,
      'totalIncome': totalIncome,
      'icon': icon,
      'color': color,
    };
  }

  static IncomeCategoryEntity fromDocument(Map<String, dynamic> doc) {
    return IncomeCategoryEntity(
      incomeCategoryId: doc['incomeCategoryId'],
      name: doc['name'],
      totalIncome: doc['totalIncome'],
      icon: doc['icon'],
      color: doc['color'],
    );
  }
}
