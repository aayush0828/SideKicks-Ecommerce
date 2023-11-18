import 'package:cloud_firestore/cloud_firestore.dart';

class Product
 {
  final String name;
  final String imageUrl;
  final String category;
  final bool isRecommended;
  final bool isPopular;
  final double price; // Make sure price is of type double
  bool isFavorite;
  int quantity;

  Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.isPopular,
    required this.isRecommended,
    required this.price, // Make sure to include the price property
    this.isFavorite = false,
    this.quantity = 0,
  });

  factory Product.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Product(
      name: doc['name'],
      imageUrl: doc['imageUrl'],
      category: doc['category'],
      price: doc['price'],
      isRecommended: doc['isRecommended'],
      isPopular: doc['isPopular'],
    );
  }

}