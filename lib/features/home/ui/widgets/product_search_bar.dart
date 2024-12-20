import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Search',
          prefixIcon: const Icon(
            Iconsax.search_normal_1,
            color: Colors.grey,
            size: 22,
          )),
    );
  }
}
