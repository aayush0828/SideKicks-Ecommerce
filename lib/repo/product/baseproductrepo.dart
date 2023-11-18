
import 'package:walmart/config/models/productmodel.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}