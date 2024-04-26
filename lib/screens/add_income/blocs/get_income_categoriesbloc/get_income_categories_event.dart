part of 'get_income_categories_bloc.dart';

sealed class GetIncomeCategoriesEvent extends Equatable {
  const GetIncomeCategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetIncomeCategories extends GetIncomeCategoriesEvent {}
