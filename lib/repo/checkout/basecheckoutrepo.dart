import 'package:walmart/config/models/checkoutmodel.dart';

abstract class BaseCheckoutRepositry {
  Future<void> addCheckout(Checkout checkout);
}