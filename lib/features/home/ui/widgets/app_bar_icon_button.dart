import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onTab,
  });

  final IconData icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 16,
          child: Icon(
            icon,
            size: 18,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
