import '../entities/entities.dart';

class IncomeCategory {
  String incomeCategoryId;
  String name;
  int totalIncome;
  String icon;
  int color;

  IncomeCategory({
    required this.incomeCategoryId,
    required this.name,
    required this.totalIncome,
    required this.icon,
    required this.color,
  });

  static final empty = IncomeCategory(
    incomeCategoryId: '',
    name: '',
    totalIncome: 0,
    icon: '',
    color: 0,
  );

  IncomeCategoryEntity toEntity() {
    return IncomeCategoryEntity(
      incomeCategoryId: incomeCategoryId,
      name: name,
      totalIncome: totalIncome,
      icon: icon,
      color: color,
    );
  }

  static IncomeCategory fromEntity(IncomeCategoryEntity entity) {
    return IncomeCategory(
      incomeCategoryId: entity.incomeCategoryId,
      name: entity.name,
      totalIncome: entity.totalIncome,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
