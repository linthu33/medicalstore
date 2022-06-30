import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/services/productrepository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
  ProductsBloc({required this.productRepository}) : super(ProductsInitial()) {
    on<Productloaded>(_onLoadProduct);
    on<ProductAdd>(_onAddProduct);
    on<ProductUpdate>(_onUpdateProduct);
    on<ProductDelete>(_onDeleteProduct);
  }
  void _onLoadProduct(Productloaded event, Emitter<ProductsState> emit) async {
    final res = await productRepository.getProducts();
    emit(ProductsLoadedState(products: res));
  }

  void _onAddProduct(ProductAdd event, Emitter<ProductsState> emit) {
    print('-------------------');
    //print(event.product.toJson());
    print('-------------------');
    final state = this.state;
    final addproduct = productRepository.AddProducts(event.product);
    // ignore: unrelated_type_equality_checks
    if (addproduct == 200) {
      if (state is ProductsLoadedState) {
        print(state.products);
        emit(ProductsLoadedState(
            products: List.from(state.products)..add(event.product)));
      }
    } else {
      emit(ProductErrorState("errors"));
    }
  }

  void _onUpdateProduct(ProductUpdate event, Emitter<ProductsState> emit) {}
  void _onDeleteProduct(ProductDelete event, Emitter<ProductsState> emit) {}
}
