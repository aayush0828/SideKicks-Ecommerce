import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = 
    Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
      name: 'Sneakers', // Example category name
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/2_6.png?v=1692704382',
    ),
    Category(
      name: 'Crocs', // Example category name
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/1_14.png?v=1692772781',
    ),
    Category(
      name: 'Appreal', // Example category name
      imageUrl: 'https://www.superkicks.in/cdn/shop/files/FORUM_PLATFORM.png?v=1694426763',
    ),
  ];
}
