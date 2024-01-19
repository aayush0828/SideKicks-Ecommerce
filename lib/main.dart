import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:walmart/blocs/cart/cart_bloc.dart';
import 'package:walmart/blocs/category/bloc/category_bloc.dart';
import 'package:walmart/blocs/checkout/checkout_bloc.dart';
import 'package:walmart/blocs/product/bloc/product_bloc.dart';
import 'package:walmart/config/approuter.dart';
import 'package:walmart/config/models/favorite_provider.dart';
import 'package:walmart/config/theme.dart';
import 'package:walmart/repo/category/categoryrepo.dart';
import 'package:walmart/repo/checkout/checkoutrepo.dart';
import 'package:walmart/repo/product/productrepo.dart';     
import 'package:walmart/screens/splash/splashscreen.dart';    
import 'screens/homescreen.dart';
      
Future<void> main() async{
   
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
    BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProducts())),
    BlocProvider(create: (_) => CheckoutBloc(cartBloc: context.read<CartBloc>(),checkoutRepository: CheckoutRepository(),)),
    BlocProvider(create: (_) => CartBloc()), 

      ],
      child: MaterialApp(
        title: 'SideKicks',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
