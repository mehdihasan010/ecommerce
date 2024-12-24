import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/app/app_colors.dart';
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
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
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
                const SizedBox(height: 16),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    //aspectRatio: 1.0,
                    viewportFraction: 0.95,
                    onPageChanged: (index, reason) {
                      _selectedIndex.value = index;
                    },
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          //margin: EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text('Banner $i'),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                _buildDotsIndicator(),
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

  ValueListenableBuilder<int> _buildDotsIndicator() {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: 10.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: index == value ? AppColors.themeColor : Colors.grey,
              ),
            );
          }),
        );
      },
    );
  }
}
