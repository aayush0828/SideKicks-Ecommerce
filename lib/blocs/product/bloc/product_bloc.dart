import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walmart/config/models/productmodel.dart'; // Import the Product model
import 'package:walmart/repo/product/productrepo.dart'; // Import the ProductRepository

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState();
    }
    if (event is UpdateProducts) {
      yield* _mapUpdateProductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductsToState() async* {
  _productSubscription?.cancel();
  _productSubscription =
      _productRepository.getAllProducts().listen((products) {
    print('Products loaded successfully');
    add(UpdateProducts(products));
  });
}

  Stream<ProductState> _mapUpdateProductsToState(
      UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }
}
