import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key, this.height=60, this.text='', this.backgroundColor,
  });
  final double? height;
  final String? text;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor??AppColors.primary.withOpacity(1),
      title: Text(text!,),

      toolbarHeight: height ?? 50.h,

      // actions: [
      //   IconButton(onPressed: (){
      //   }, icon: Icon(Icons.settings),color: Colors.white,),
      //   IconButton(onPressed: (){
      //   }, icon: Icon(Icons.home,),color: Colors.white,),
      // ],
    );
  }

  @override
  Size get preferredSize => Size(
    mediaQueryData.size.width,
    height ?? 32.h,
  );
}
