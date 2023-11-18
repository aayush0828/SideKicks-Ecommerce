import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walmart/config/models/favorite_provider.dart'; // Import your FavoriteProvider
import 'package:walmart/config/models/productmodel.dart' as Product;
class ProductCard extends StatefulWidget {
  final Product.Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: widget.product,
        );
      },
      onTapDown: (_) {
        setState(() {
          _isFavorite = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isFavorite = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: _isFavorite
              ? Border.all(color: Colors.blue.shade500, width: 3)
              : null,
          boxShadow: _isFavorite
              ? [
                  BoxShadow(
                      color: Colors.blue.shade100,
                      blurRadius: 30,
                      offset: Offset(0, 10)),
                ]
              : [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 20,
                      offset: Offset(0, 5)),
                ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 320,
                margin: EdgeInsets.only(top: 10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(widget.product.imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                    widget.product.isFavorite = _isFavorite;

                    // Update the favorite status using the provider
                    if (_isFavorite) {
                      favoriteProvider.addToFavorites(widget.product);
                    } else {
                      favoriteProvider.removeFromFavorites(widget.product);
                    }
                  });
                },
              ),
              // ... rest of your code ...
            ],
          ),
        ),
      ),
    );
  }
}
