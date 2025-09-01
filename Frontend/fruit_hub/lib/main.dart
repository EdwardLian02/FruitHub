import 'package:flutter/material.dart';
import 'package:fruit_hub/basket_screen.dart';
import 'package:fruit_hub/detail_screen.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/home_screen.dart';
import 'package:fruit_hub/order_track_screen.dart';
import 'package:fruit_hub/splash_screen.dart';
import 'package:fruit_hub/splash_screen2.dart';
import 'package:fruit_hub/success_order_screen.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context)
              .textTheme, // Pass the existing text theme for consistent styling
        ),
      ),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/splash2', page: () => SplashScreen2()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/detail', page: () => DetailScreen()),
        GetPage(name: '/basket', page: () => BasketScreen()),
        GetPage(name: '/order-track', page: () => OrderTrackScreen()),
        GetPage(name: '/success-order', page: () => SuccessOrderScreen()),
      ],
    );
  }
}
