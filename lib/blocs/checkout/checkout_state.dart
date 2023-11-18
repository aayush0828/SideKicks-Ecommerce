part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable{
@override
List<Object?> get props => [];}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.deliveryFee,
      this.subtotal,
      this.total,
      this.zipCode,
      this.products})
      : checkout = Checkout(
            fullName: fullName,
            email: email,
            zipCode: zipCode,
            address: address,
            city: city,
            country: country,
            deliveryFee: deliveryFee,
            subtotal: subtotal,
            total: total,
            products: products);
             @override
  List<Object?> get props => [
    fullName, email, address, city, country, zipCode, products, subtotal, deliveryFee, total,
  ];
}
