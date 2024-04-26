import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_income_category_event.dart';
part 'create_income_category_state.dart';

class CreateIncomeCategoryBloc extends Bloc<CreateIncomeCategoryEvent, CreateIncomeCategoryState> {
  CreateIncomeCategoryBloc() : super(CreateIncomeCategoryInitial()) {
    on<CreateIncomeCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
