import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:income_repository/income_repository.dart';

class IncomeEntity {
  String incomeId;
  IncomeCategory category;
  DateTime date;
  int amount;

  IncomeEntity({
    required this.incomeId,
    required this.category,
    required this.date,
    required this.amount,
  });

  Map<String, Object?> toDocument() {
    return {
      'incomeId': incomeId,
      'category': category.toEntity().toDocument(),
      'date': date,
      'amount': amount,
    };
  }

  static IncomeEntity fromDocument(Map<String, dynamic> doc) {
    return IncomeEntity(
      incomeId: doc['incomeId'],
      category: IncomeCategory.fromEntity(
          IncomeCategoryEntity.fromDocument(doc['category'])),
      date: (doc['date'] as Timestamp).toDate(),
      amount: doc['amount'],
    );
  }
}
