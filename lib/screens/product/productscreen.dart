import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:walmart/blocs/cart/cart_bloc.dart';
import 'package:walmart/config/models/models.dart';
import 'package:walmart/config/models/productmodel.dart' as Product;
import 'package:walmart/screens/wishlist/wishlistscreen.dart';
import 'package:walmart/widgets/customappbar.dart';
import 'package:walmart/widgets/herocarouselcard.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  final Product.Product product;

  ProductScreen({required this.product});

  static Route route({required Product.Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context); // Use the FavoriteProvider

    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.share),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  favoriteProvider.isFavorite(product)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  favoriteProvider.toggleFavoriteStatus(product);

                  // Navigate to the WishlistScreen
                  Navigator.pushNamed(context, WishlistScreen.routeName);
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      // You can specify other button properties here
                    ),
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Text(
                      'Add To Cart',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [HeroCarouselCard(product: product)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Product Information',
                  style: Theme.of(context).textTheme.headlineMedium),
              children: [
                ListTile(
                  title: Text(''),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Delivery Information',
                  style: Theme.of(context).textTheme.headlineMedium),
              children: [
                ListTile(
                  title: Text(''),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
