import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walmart/config/models/productmodel.dart';
import 'package:walmart/repo/product/baseproductrepo.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance {
  }

  @override
  Stream<List<Product>> getAllProducts() {
  return _firebaseFirestore.collection('products').snapshots().map((snapshot) {
    final products = snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    print('Loaded ${products.length} products');
    return products;
  });
}}