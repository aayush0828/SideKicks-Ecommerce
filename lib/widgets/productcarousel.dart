import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:walmart/config/models/productmodel.dart';
import 'package:walmart/widgets/productcard.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  ProductCarousel({required this.products});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 450.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.70,
        enlargeCenterPage: true,
        pageSnapping: true,
        onPageChanged: (index, reason) {
          // Add your logic here if needed
        },
      ),
      items: products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return ProductCard(product: product);
          },
        );
      }).toList(),
    );
  }
}
