import 'package:flutter/material.dart';
import 'package:walmart/config/models/categorymodel.dart';
import 'package:walmart/config/models/productmodel.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;

  const HeroCarouselCard({
    Key? key,
    this.category,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product == null) {
          Navigator.pushNamed(
            context,
            '/catalog',
            arguments: category,
          );
        } else {
          // Handle the case when product is not null
          // You might want to navigate to a different route here
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
            product == null ? category!.imageUrl : product!.imageUrl,
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
    );
  }
}
