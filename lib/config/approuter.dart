import 'package:flutter/material.dart';
import 'package:walmart/config/models/productmodel.dart';
import 'package:walmart/screens/cart/cartscreen.dart';
import 'package:walmart/screens/catalog/catalogscreen.dart';
import 'package:walmart/screens/checkout/checkoutscreen.dart';
import 'package:walmart/screens/homescreen.dart';
import 'package:walmart/screens/product/productscreen.dart';
import 'package:walmart/screens/splash/splashscreen.dart';
import 'package:walmart/screens/wishlist/wishlistscreen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
        case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
        case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
        case WishlistScreen.routeName:
  return WishlistScreen.route();
        case CatalogScreen.routeName:
        return CatalogScreen.route();
        case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}
