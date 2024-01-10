import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';

import '../../core/utils/app_colors.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: AppColors.blue50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: AppColors.gray5002,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: AppColors.gray100,
      );
  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: AppColors.gray10001,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: AppColors.gray5001,
      );
  static BoxDecoration get fillGray80001 => BoxDecoration(
        color: AppColors.gray80001,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: AppColors.lightBlue50,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
    borderRadius: BorderRadiusStyle.roundedBorder10
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: AppColors.redA700,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: AppColors.teal20038,
      );
  static BoxDecoration get fillTeal5005 => BoxDecoration(
        color: AppColors.teal5005,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: AppColors.whiteA700,
        borderRadius: BorderRadiusStyle.roundedBorder13
      );

  // Gradient decorations
  static BoxDecoration get gradientOnErrorContainerToOnErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.5),
          end: Alignment(1.27, 0.5),
          colors: [
            theme.colorScheme.onErrorContainer,
            theme.colorScheme.onErrorContainer.withOpacity(0.65),
            theme.colorScheme.onErrorContainer.withOpacity(0.95),
          ],
        ),
      );
  static BoxDecoration get gradientTealToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            AppColors.teal5002,
            AppColors.cyan5075,
            AppColors.gray5000,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: AppColors.whiteA700,
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.22),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              6,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: AppColors.whiteA700,
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.14),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -3,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.17),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -3,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9002 => BoxDecoration(
        color: AppColors.whiteA700,
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.17),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -3,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003 => BoxDecoration(
        color: AppColors.whiteA700,
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              3,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9004 => BoxDecoration(
        color: AppColors.teal20005,
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.13),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9005 => BoxDecoration();
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: AppColors.blueGray20003,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineCyan => BoxDecoration(
        color: AppColors.gray50,
        border: Border.all(
          color: AppColors.cyan10001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: AppColors.gray50,
        border: Border.all(
          color: AppColors.gray200,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black900.withOpacity(0.04),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.15),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.56),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: AppColors.cyan50,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineTeal => BoxDecoration(
        border: Border.all(
          color: AppColors.teal5003,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderBL20 => BorderRadius.vertical(
        bottom: Radius.circular(20.h),
      );
  static BorderRadius get customBorderLR13 => BorderRadius.only(
        topLeft: Radius.circular(4.h),
        topRight: Radius.circular(13.h),
        bottomLeft: Radius.circular(4.h),
        bottomRight: Radius.circular(13.h),
      );
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );
  static BorderRadius get customBorderTL26 => BorderRadius.vertical(
        top: Radius.circular(26.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder13 => BorderRadius.circular(
        13.h,
      );
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder9 => BorderRadius.circular(
        9.h,
      );
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
