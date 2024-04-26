import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:income_repository/income_repository.dart';

part 'create_income_category_event.dart';
part 'create_income_category_state.dart';

class CreateIncomeCategoryBloc
    extends Bloc<CreateIncomeCategoryEvent, CreateIncomeCategoryState> {
  IncomeRepository incomeRepository;
  CreateIncomeCategoryBloc(this.incomeRepository)
      : super(CreateIncomeCategoryInitial()) {
    on<CreateIncomeCategory>((event, emit) async {
      emit(CreateIncomeCategoryLoading());
      try {
        await incomeRepository.createIncomeCategory(event.category);
        emit(CreateIncomeCategorySuccess());
      } catch (e) {
        emit(CreateIncomeCategoryFailure());
      }
    });
  }
}
