import 'package:walmart/config/models/productmodel.dart';

class ProductRepository {
  static List<Product> _products = [
    Product(
      name: 'AIR JORDAN 1 RETRO HIGH OG',
      price:168.0,
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/1_5cb925a7-cbf6-4d64-8cf0-765a24082205.jpg?v=1692699212&width=750', category: '', isPopular: true, isRecommended: true,
      
    ),
    Product(
      name: "AIRJORDAN 4 RETRO 'LT IRON ORE",
      price: 100.0,category: '', isPopular: true, isRecommended: true,
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/1_6685e558-656e-483f-a916-246e05f34718.jpg?v=1692698584&width=600',
    ),
    Product(
      name: "New Balance 9060 'GREEN/PURPLE'",
      price: 100.0,category: '', isPopular: true, isRecommended: true,
      imageUrl: 'https://www.superkicks.in/cdn/shop/products/1-22_d338746c-6dee-4f30-87f0-2b1dbc9352f4.jpg?v=1675977684&width=600',
    ),
    Product(
      name: "AIR JORDAN 13 RETRO 'WOLF GREY'",
      price: 100.0,category: '', isPopular: true, isRecommended: true,
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/414571-160.jpg?v=1690877123&width=600',
    ),
    Product(
      name: "AIR JORDAN 1 RETRO LOW OG",
      price: 100.0,category: '', isPopular: true, isRecommended: true,
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/1_45ab4c62-3e3c-4bfc-8aa8-75f7c7949ffe.jpg?v=1687616103&width=600',
    ),
    // Add other products here
  ];

  List<Product> get products => _products;

  Stream<List<Product>> getAllProducts() {
    return Stream.value(_products);
  }
}