import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';

import '../utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: SizedBox(
          height: height ?? 0,
          width: width ?? 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              padding: padding ?? EdgeInsets.zero,
              decoration: decoration ??
                  BoxDecoration(
                    color: AppColors.gray100,
                    borderRadius: BorderRadius.circular(6.h),
                  ),
              child: child,
            ),
            onPressed: onTap,
          ),
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: AppColors.whiteA700,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(
          color: AppColors.blueGray90002,
          width: 1.w,
        ),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
        borderRadius: BorderRadius.circular(6.h),
      );

  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: AppColors.blueGray50,
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(
          color: AppColors.whiteA700,
          width: 2.w,
        ),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: AppColors.whiteA700,
        borderRadius: BorderRadius.circular(6.h),
      );
}
