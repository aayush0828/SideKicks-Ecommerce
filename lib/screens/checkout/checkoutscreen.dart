import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/blocs/checkout/checkout_bloc.dart';
import 'package:walmart/widgets/customappbar.dart';
import 'package:walmart/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>( 
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (state is CheckoutLoaded) {
                    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
                    },
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                  }
                  else {return Text('Something Went Wrong');}
                  
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Customer Information',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 22,
                              )),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(email: value),
                        );
                  }, context, 'Email'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(fullName: value),
                        );
                  }, context, 'Full Name'),
                  Text('Delivery Information',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 22,
                              )),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(address: value),
                        );
                  }, context, 'Address'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(country: value),
                        );
                  }, context, 'Country'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(city: value),
                        );
                  }, context, 'City'),
                  _buildTextFormField((value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckout(zipCode: value),
                        );
                  }, context, 'Zip Code'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            'SELECT A PAYMENT METHOD',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text('Order Summary',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 22,
                              )),
                  OrderSummary()
                ],
              );
            } else {
              return Text('Something Went Wrong');
            }
          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 75,
              child: Text(
                labelText,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
                child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ))
          ],
        ));
  }
}
