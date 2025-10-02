import 'package:flutter/material.dart';
import 'package:fruit_hub/address_screen.dart';
import 'package:fruit_hub/auth_screen.dart';
import 'package:fruit_hub/basket_screen.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/controller/basket_controller.dart';
import 'package:fruit_hub/favourite_screen.dart';
import 'package:fruit_hub/home_screen.dart';
import 'package:fruit_hub/login_screen.dart';
import 'package:fruit_hub/order_list_screen.dart';
import 'package:fruit_hub/profile_screen.dart';
import 'package:fruit_hub/register_screen.dart';
import 'package:fruit_hub/screen_mode_screen.dart';
import 'package:fruit_hub/search_screen.dart';
import 'package:fruit_hub/splash_screen.dart';
import 'package:fruit_hub/splash_screen2.dart';
import 'package:fruit_hub/order_success_screen.dart';
import 'package:fruit_hub/test_screen.dart';
import 'package:fruit_hub/widget_helper/address_card.dart';
import 'package:fruit_hub/widget_helper/manage_info_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(BasketController(), permanent: true);
  Get.put(AuthenticationController(), permanent: true);

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
        GetPage(name: '/auth', page: () => AuthScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/basket', page: () => BasketScreen()),
        GetPage(name: '/search', page: () => SearchScreen()),
        GetPage(name: '/order', page: () => OrderListScreen()),
        GetPage(name: '/order-success', page: () => OrderSuccessScreen()),
        GetPage(name: '/favorite', page: () => FavouriteScreen()),
        GetPage(name: '/manage-info', page: () => ManageInfoScreen()),
        GetPage(name: '/screen-mode', page: () => ScreenModeScreen()),
        GetPage(name: '/address', page: () => AddressScreen()),
        GetPage(name: '/test-screen', page: () => TestScreen()),
      ],
    );
  }
}
