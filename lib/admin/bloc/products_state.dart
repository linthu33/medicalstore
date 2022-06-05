part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable{
   @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductsModel> products;
  ProductsLoadedState({required this.products});
  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductsState {
  final errors;

  ProductErrorState(this.errors);
}

