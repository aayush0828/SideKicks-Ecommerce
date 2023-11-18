import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walmart/config/models/favorite_provider.dart';
import 'package:walmart/config/models/productmodel.dart' as Product;
import 'package:walmart/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    List<Product.Product> favoriteProducts = favoriteProvider.favoriteProducts;

    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavbar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the number of columns here
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Add your onTap functionality here
            },
            child: GridTile(
              child: Image.network(favoriteProducts[index].imageUrl), // Display the image
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(favoriteProducts[index].name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    favoriteProducts.removeAt(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }
}

// Your existing classes and imports...
