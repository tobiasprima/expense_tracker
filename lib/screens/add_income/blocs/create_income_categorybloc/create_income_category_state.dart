part of 'create_income_category_bloc.dart';

sealed class CreateIncomeCategoryState extends Equatable {
  const CreateIncomeCategoryState();

  @override
  List<Object> get props => [];
}

final class CreateIncomeCategoryInitial extends CreateIncomeCategoryState {}

final class CreateIncomeCategoryLoading extends CreateIncomeCategoryState {}

final class CreateIncomeCategoryFailure extends CreateIncomeCategoryState {}

final class CreateIncomeCategorySuccess extends CreateIncomeCategoryState {}
