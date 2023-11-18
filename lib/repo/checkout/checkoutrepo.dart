import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walmart/config/models/checkoutmodel.dart';
import 'package:walmart/repo/checkout/basecheckoutrepo.dart';

class CheckoutRepository extends BaseCheckoutRepositry {
  final FirebaseFirestore _firebaseFirestore;
  CheckoutRepository({FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}