import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:income_repository/income_repository.dart';

part 'get_income_categories_event.dart';
part 'get_income_categories_state.dart';

class GetIncomeCategoriesBloc
    extends Bloc<GetIncomeCategoriesEvent, GetIncomeCategoriesState> {
  final IncomeRepository incomeRepository;
  GetIncomeCategoriesBloc(this.incomeRepository)
      : super(GetIncomeCategoriesInitial()) {
    on<GetIncomeCategories>((event, emit) async {
      emit(GetIncomeCategoriesLoading());
      try {
        List<IncomeCategory> incomeCategories =
            await incomeRepository.getIncomeCategory();
        emit(GetIncomeCategoriesSuccess(incomeCategories));
      } catch (e) {
        emit(GetIncomeCategoriesFailure());
      }
    });
  }
}
