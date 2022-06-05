part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogLoadedState extends CatalogState {
  final List<CatlogModel> catalogs;

  CatalogLoadedState({required this.catalogs});
  @override
  List<Object?> get props => [catalogs];
}

class CatalogListErrorState extends CatalogState {
  final error;

  CatalogListErrorState(this.error);
}
