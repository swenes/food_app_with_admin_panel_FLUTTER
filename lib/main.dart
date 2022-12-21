import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app_ytm/providers/product_provider.dart';
import 'package:food_app_ytm/providers/review_cart_provider.dart';
import 'package:food_app_ytm/providers/user_provider.dart';
import 'package:food_app_ytm/providers/wish_list_provider.dart';
import 'package:food_app_ytm/screens/home_screen/home_screen.dart';
import 'package:food_app_ytm/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_app_ytm/utils/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
              primaryColor: Constants.appBarColor,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Constants.appBarColor,
                  iconTheme: IconThemeData(color: Colors.black)),
              scaffoldBackgroundColor: Constants.scaffoldBG),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              }
              return const SignIn();
            },
          )),
    );
  }
}
