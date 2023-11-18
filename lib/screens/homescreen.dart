import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/blocs/category/bloc/category_bloc.dart';
import 'package:walmart/screens/wishlist/wishlistscreen.dart';
import 'package:walmart/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:walmart/widgets/productcarousel.dart';
import 'package:walmart/screens/product/productrepo.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  // Create an instance of ProductRepository
  final ProductRepository productRepository = ProductRepository();

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SuperKicks'),
      bottomNavigationBar: CustomNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.85,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: state.categories
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList(),
                    );
                  } else {
                    return Text('Something Went Wrong.');
                  }
                },
              ),
            ),
            sectiontitle(title: 'RECOMMENDED'),
            ProductCarousel(
              products: productRepository.products
                  .where((product) => product.isRecommended)
                  .toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, WishlistScreen.routeName);
              },
              child: Text('Go to Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}
