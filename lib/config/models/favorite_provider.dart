import 'package:flutter/material.dart';
import 'package:walmart/config/models/productmodel.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  bool isFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }

  void toggleFavoriteStatus(Product product) {
    if (isFavorite(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  void addToFavorites(Product product) {
    _favoriteProducts.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }
}
