import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/blocs/cart/cart_bloc.dart';
import 'package:walmart/config/models/productmodel.dart' as Product;
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final Product.Product product;
  final int quantity;
  const CartProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme.of(context).textTheme.headlineMedium!),
                Text('\$${product.price}',
                    style: Theme.of(context).textTheme.headlineMedium!),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    },
                  ),
                  Text('$quantity', style: Theme.of(context).textTheme.headlineMedium!),

                  IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {context.read<CartBloc>().add(CartProductAdded(product));},
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
