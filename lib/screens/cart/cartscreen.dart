import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/blocs/cart/cart_bloc.dart';
import 'package:walmart/screens/checkout/checkoutscreen.dart';
import 'package:walmart/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CheckoutScreen.routeName,
                  ); // Navigate to the CheckoutScreen
                },
                child: Text(
                  'Go To Checkout',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/home',
                              ); // Navigate to the desired screen
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(),
                              elevation: 0,
                            ),
                            child: Text(
                              'Add More Items',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: state.cart
                              .ProductQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart
                                  .ProductQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .ProductQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            );
                          },
                        ),
                      ),
                      OrderSummary(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text('Something Went Wrong');
          }
        },
      ),
    );
  }
}
