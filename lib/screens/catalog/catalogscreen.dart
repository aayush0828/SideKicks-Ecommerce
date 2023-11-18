import 'package:flutter/material.dart';
import 'package:walmart/config/models/categorymodel.dart';
import 'package:walmart/widgets/widgets.dart';


class CatalogScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Catalog'),
      bottomNavigationBar: CustomNavbar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 16.0, // Spacing between rows
          crossAxisSpacing: 16.0, // Spacing between columns
          childAspectRatio: 2.2, // Adjust the aspect ratio as needed
        ),
        itemCount: Category.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            
          );
        },
      ),
    );
  }
}
