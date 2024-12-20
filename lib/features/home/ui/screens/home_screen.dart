import 'package:ecommerce_project/app/assets_path.dart';
import 'package:ecommerce_project/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/app_bar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ProductSearchBar(
                  controller: _searchBarController,
                ),
              ],
            ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.iconsLogoNav),
      actions: [
        AppBarIconButton(
          icon: Iconsax.user,
          onTab: () {},
        ),
        AppBarIconButton(
          icon: Iconsax.call,
          onTab: () {},
        ),
        AppBarIconButton(
          icon: Iconsax.notification,
          onTab: () {},
        ),
      ],
    );
  }
}
