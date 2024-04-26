import 'package:income_repository/income_repository.dart';

abstract class IncomeRepository {
  Future<void> createIncomeCategory(IncomeCategory category);

  Future<List<IncomeCategory>> getIncomeCategory();

  Future<void> createIncome(Income income);

  Future<List<Income>> getIncomes();
}
