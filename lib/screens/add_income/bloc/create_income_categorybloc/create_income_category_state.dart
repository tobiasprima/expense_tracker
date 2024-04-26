part of 'create_income_category_bloc.dart';

sealed class CreateIncomeCategoryState extends Equatable {
  const CreateIncomeCategoryState();
  
  @override
  List<Object> get props => [];
}

final class CreateIncomeCategoryInitial extends CreateIncomeCategoryState {}
