part of 'create_income_category_bloc.dart';

sealed class CreateIncomeCategoryEvent extends Equatable {
  const CreateIncomeCategoryEvent();

  @override
  List<Object> get props => [];
}

class CreateIncomeCategory extends CreateIncomeCategoryEvent {
  final IncomeCategory category;

  const CreateIncomeCategory(this.category);

  @override
  List<Object> get props => [category];
}
