import 'package:ecommerce_project/app/app_theme_data.dart';
import 'package:ecommerce_project/app/controller_binder.dart';
import 'package:ecommerce_project/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_project/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_project/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_project/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/common/ui/screens/main_bottom_nav_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) => const CompleteProfileScreen(),
        MainBottomNavScreen.name: (context) => const MainBottomNavScreen(),
        HomeScreen.name: (context) => const HomeScreen(),
      },
    );
  }
}
