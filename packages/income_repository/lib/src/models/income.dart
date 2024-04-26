import 'package:income_repository/income_repository.dart';

class Income {
  String incomeId;
  IncomeCategory category;
  DateTime date;
  int amount;

  Income({
    required this.incomeId,
    required this.category,
    required this.date,
    required this.amount,
  });

  static final empty = Income(
    incomeId: '',
category: IncomeCategory.empty,
date: DateTime.now(),
amount: 0,
  )
}
