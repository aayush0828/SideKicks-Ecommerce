// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walmart/blocs/cart/cart_bloc.dart';
import 'package:walmart/config/models/cartmodel.dart';
import 'package:walmart/config/models/checkoutmodel.dart';
import 'package:walmart/config/models/productmodel.dart';
import 'package:walmart/repo/checkout/checkoutrepo.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  }) :
    _cartBloc = cartBloc,
    _checkoutRepository = checkoutRepository,
    super(
      cartBloc.state is CartLoaded 
      ? CheckoutLoaded(
        products: (cartBloc.state as CartLoaded).cart.products,
        total: (cartBloc.state as CartLoaded).cart.totalString,
        deliveryFee: (cartBloc.state as CartLoaded).cart.deliveryFeeString,
        subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
      ) 
      : CheckoutLoading()) {
      _cartSubscription = cartBloc.stream.listen((state) {
        if (state is CartLoaded) {
          add(UpdateCheckout(cart: state.cart,));
        }
      });
    }

  @override
  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    if (event is UpdateCheckout){
      yield* _mapUpdateCheckoutToState(event, state);
    }
    if (event is ConfirmCheckout) {
      yield* _mapConfirmCheckoutToState(event, state);
    }
  }
  Stream<CheckoutState> _mapUpdateCheckoutToState(
    UpdateCheckout event,
    CheckoutState state,
  ) async*{
    if (state is CheckoutLoaded) {
      yield CheckoutLoaded(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        total: event.cart?.totalString ?? state.total,
        products: event.cart?.products ?? state.products,

      );
    }
  }

  Stream<CheckoutState> _mapConfirmCheckoutToState(
    ConfirmCheckout event,
    CheckoutState state,
  ) async*{
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        yield CheckoutLoading();
      } catch (_) {}
      
    }
  }
}

