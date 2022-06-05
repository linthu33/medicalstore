part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categorys;

  CategoryLoadedState({required this.categorys});
  @override
  List<Object?> get props => [categorys];
}

class CategoryListErrorState extends CategoryState {
  final errormessage;

  CategoryListErrorState(this.errormessage);
}

class CategoryLoadedIdState extends CategoryState {
  final List<CategoryModel> categorys;

  CategoryLoadedIdState({required this.categorys});
  @override
  List<Object?> get props => [categorys];
}
