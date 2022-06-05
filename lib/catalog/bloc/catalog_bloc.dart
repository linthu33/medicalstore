import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mystore/catalog/models/catalogmodel.dart';
import 'package:mystore/catalog/service/catalogrepository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepository catalogRepository;

  CatalogBloc({required this.catalogRepository}) : super(CatalogInitial()) {
    on<CatalogLoadedApiEvent>((event, emit) async {
      // TODO: implement event handler
      emit(CatalogLoadingState());
      final res = await catalogRepository.getcatlog();
      emit(CatalogLoadedState(catalogs: res));
    });
    on<CatalogLoadIdEvent>(_onLoadIdCatalog);
  }

  void _onLoadIdCatalog(
      CatalogLoadIdEvent event, Emitter<CatalogState> emit) async {
    final state = this.state;
    if (state is CatalogLoadedState) {
      List<CatlogModel> products = state.catalogs.where((product) {
        return product.Id != event.Id;
      }).toList();
    }
  }
}
