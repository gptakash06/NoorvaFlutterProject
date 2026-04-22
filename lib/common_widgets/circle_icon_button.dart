import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;

  const CircleIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.card,
        border: Border.all(color: Colors.white10),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}