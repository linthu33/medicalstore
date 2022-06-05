import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mystore/catalog/service/catalogrepository.dart';
import 'package:mystore/category/model/CategoryModel.dart';
import 'package:mystore/category/service/CategoryRepository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<CategoryLoadedEvent>(_onLoadCategory);
  }

  void _onLoadCategory(
      CategoryLoadedEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoadingState());

      final resdata = await categoryRepository.getCategory();

      emit(CategoryLoadedState(categorys: resdata));
    } catch (e) {
      emit(CategoryListErrorState(e));
    }
  }
}
