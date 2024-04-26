import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:income_repository/income_repository.dart';

class FirebaseIncomeRepo implements IncomeRepository {
  final incomeCategoryCollection =
      FirebaseFirestore.instance.collection('incomeCategories');

  final incomeCollection = FirebaseFirestore.instance.collection('income ');

  @override
  Future<void> createIncomeCategory(IncomeCategory category) async {
    try {
      await incomeCategoryCollection
          .doc(category.incomeCategoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<IncomeCategory>> getIncomeCategory() async {
    try {
      return await incomeCategoryCollection.get().then((value) => value.docs
          .map((e) => IncomeCategory.fromEntity(
              IncomeCategoryEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createIncome(Income income) async {
    try {
      await incomeCollection
          .doc(income.incomeId)
          .set(income.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    @override
    Future<List<Income>> getIncomes() async {
      try {
        return await incomeCollection.get().then((value) => value.docs
            .map((e) => Income.fromEntity(IncomeEntity.fromDocument(e.data())))
            .toList());
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }
  }
}
