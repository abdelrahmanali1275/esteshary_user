import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:naraakom/core/utils/app_colors.dart';


class CustomAppBottom extends StatelessWidget {
  const CustomAppBottom({Key? key, this.onPressed, required this.label})
      : super(key: key);
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary.withOpacity(1),
        fixedSize:const Size(double.maxFinite,50) ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(label,style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),),
    ).animate().moveX(duration: 600.ms);
  }
}
