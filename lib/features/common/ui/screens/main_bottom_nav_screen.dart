import 'package:ecommerce_project/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../home/ui/screens/home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main_bottom_nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -4),
            )
          ]),
          child: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: bottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.category),
                label: 'Category',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: 'Wishlist',
              ),
            ],
          ),
        ),
      );
    });
  }
}
