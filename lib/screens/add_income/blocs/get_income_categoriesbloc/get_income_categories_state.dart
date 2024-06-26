part of 'get_income_categories_bloc.dart';

sealed class GetIncomeCategoriesState extends Equatable {
  const GetIncomeCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetIncomeCategoriesInitial extends GetIncomeCategoriesState {}

final class GetIncomeCategoriesFailure extends GetIncomeCategoriesState {}

final class GetIncomeCategoriesLoading extends GetIncomeCategoriesState {}

final class GetIncomeCategoriesSuccess extends GetIncomeCategoriesState {
  final List<IncomeCategory> incomeCategories;

  const GetIncomeCategoriesSuccess(this.incomeCategories);

  @override
  List<Object> get props => [incomeCategories];
}
