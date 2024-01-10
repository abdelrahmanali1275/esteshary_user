import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_export.dart';
import '../../core/utils/app_colors.dart';


/// Helper class for managing themes and colors.
class ThemeHelper {


  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
         ColorSchemes.primaryColorScheme;
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.whiteA700,
          backgroundColor: colorScheme.primary.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.h),
          ),
          shadowColor: colorScheme.primary,
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary.withOpacity(1),
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.primary.withOpacity(1))
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: AppColors.teal5001,
      ),
    );
  }

  /// Returns the primary colors for the current theme.

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X4C30B9CC),
    primaryContainer: Color(0XFF2D2D2D),
    secondary: Color(0XFF2D2D2D),
    secondaryContainer: Color(0XFFF7931E),
    tertiary: Color(0XFF2D2D2D),
    tertiaryContainer: Color(0XFFF7931E),

    // Background colors
    background: Color(0XFF2D2D2D),

    // Surface colors
    surface: Color(0XFF2D2D2D),
    surfaceTint: Color(0XFF202020),
    surfaceVariant: Color(0XFFF7931E),

    // Error colors
    error: Color(0XFF202020),
    errorContainer: Color(0XFF677F82),
    onError: Color(0XFF94C4CC),
    onErrorContainer: Color(0X00130C0E),

    // On colors(text colors)
    onBackground: Color(0XFFEFFAFB),
    onInverseSurface: Color(0XFF94C4CC),
    onPrimary: Color(0XFF202020),
    onPrimaryContainer: Color(0XFFEFFAFB),
    onSecondary: Color(0XFFEFFAFB),
    onSecondaryContainer: Color(0XFF202020),
    onTertiary: Color(0XFFEFFAFB),
    onTertiaryContainer: Color(0XFF202020),

    // Other colors
    outline: Color(0XFF202020),
    outlineVariant: Color(0XFF2D2D2D),
    scrim: Color(0XFF2D2D2D),
    shadow: Color(0XFF202020),

    // Inverse colors
    inversePrimary: Color(0XFF2D2D2D),
    inverseSurface: Color(0XFF202020),

    // Pending colors
    onSurface: Color(0XFFEFFAFB),
    onSurfaceVariant: Color(0XFF202020),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
   Color get amber500 => Color(0XFFFFC107);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue50 => Color(0XFFEAF8FA);

  // BlueGray
  Color get blueGray100 => Color(0XFFC8D7D9);
  Color get blueGray10001 => Color(0XFFD8D8D8);
  Color get blueGray10002 => Color(0XFFC8E6EA);
  Color get blueGray10003 => Color(0XFFD9D9D8);
  Color get blueGray10004 => Color(0XFFC5DCDF);
  Color get blueGray10005 => Color(0XFFCCDADB);
  Color get blueGray200 => Color(0XFFA8CDD2);
  Color get blueGray20001 => Color(0XFFA8BBBE);
  Color get blueGray20002 => Color(0XFF98C0C5);
  Color get blueGray20003 => Color(0XFFBBCACD);
  Color get blueGray20004 => Color(0XFFA9BCBE);
  Color get blueGray20005 => Color(0XFFB1CBCF);
  Color get blueGray20006 => Color(0XFFA7CDD1);
  Color get blueGray20007 => Color(0XFFB4CACD);
  Color get blueGray300 => Color(0XFF899DA0);
  Color get blueGray30001 => Color(0XFF78AFB6);
  Color get blueGray30002 => Color(0XFF93B8BD);
  Color get blueGray400 => Color(0XFF6C959B);
  Color get blueGray40001 => Color(0XFF8E8E8E);
  Color get blueGray40002 => Color(0XFF888888);
  Color get blueGray50 => Color(0XFFEEF4F5);
  Color get blueGray700 => Color(0XFF525252);
  Color get blueGray70001 => Color(0XFF3D585C);
  Color get blueGray900 => Color(0XFF2C3033);
  Color get blueGray90001 => Color(0XFF1F1B55);
  Color get blueGray90002 => Color(0XFF2A3244);
  Color get blueGray90003 => Color(0XFF132F3B);

  // Cyan
  Color get cyan100 => Color(0XFFB7ECF3);
  Color get cyan10001 => Color(0XFFBFEAF0);
  Color get cyan10002 => Color(0XFFACE6EE);
  Color get cyan300 => Color(0XFF59CCDC);
  Color get cyan50 => Color(0XFFDBF8FB);
  Color get cyan5001 => Color(0XFFDDF6F9);
  Color get cyan5002 => Color(0XFFE6F5F7);
  Color get cyan5003 => Color(0XFFDFFAFE);
  Color get cyan5075 => Color(0X75E3F8FA);

  // DeepOrange
  Color get deepOrangeA400 => Color(0XFFF03800);

  // Gray
  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray10001 => Color(0XFFF4F7F7);
  Color get gray200 => Color(0XFFEDEDED);
  Color get gray20001 => Color(0XFFEBEBEB);
  Color get gray20002 => Color(0XFFF0F0F0);
  Color get gray300 => Color(0XFFE5E5E5);
  Color get gray50 => Color(0XFFF5FDFF);
  Color get gray500 => Color(0XFFABABAB);
  Color get gray50001 => Color(0XFFA4A4A4);
  Color get gray5000 => Color(0X00EFFDFF);
  Color get gray5001 => Color(0XFFFAFAFA);
  Color get gray5002 => Color(0XFFF3FDFF);
  Color get gray600 => Color(0XFF808080);
  Color get gray60001 => Color(0XFF787878);
  Color get gray60002 => Color(0XFF7C7C7C);
  Color get gray60003 => Color(0XFF7E7E7E);
  Color get gray700 => Color(0XFF5A5A5A);
  Color get gray70001 => Color(0XFF696969);
  Color get gray800 => Color(0XFF414141);
  Color get gray80001 => Color(0XFF3E3E3E);
  Color get gray80002 => Color(0XFF474747);
  Color get gray80003 => Color(0XFF3A3A3A);
  Color get gray900 => Color(0XFF272727);

  // Green
  Color get green600 => Color(0XFF40B436);
  Color get greenA700 => Color(0XFF00C950);
  Color get greenA70001 => Color(0XFF05B70C);
  Color get greenA70002 => Color(0XFF02B214);
  Color get greenA70003 => Color(0XFF01CF09);

  // LightBlueB
  Color get lightBlue100B9 => Color(0XB9C3F7FF);

  // LightBlue
  Color get lightBlue50 => Color(0XFFEAFCFF);

  // Red
  Color get redA400 => Color(0XFFFF2727);
  Color get redA700 => Color(0XFFFF0000);

  // Teal
  Color get teal100 => Color(0XFFA8D5DC);
  Color get teal200 => Color(0XFF6FB1BB);
  Color get teal20001 => Color(0XFF6FAFB7);
  Color get teal20002 => Color(0XFF75B5BF);
  Color get teal20003 => Color(0XFF6CB6C0);
  Color get teal20004 => Color(0XFF8AC4CC);
  Color get teal20005 => Color(0XFF73CBD7);
  Color get teal20038 => Color(0X387FC8D2);
  Color get teal300 => Color(0XFF61ACB6);
  Color get teal30001 => Color(0XFF68AEB7);
  Color get teal30002 => Color(0XFF479EA0);
  Color get teal50 => Color(0XFFE4EDEF);
  Color get teal5001 => Color(0XFFD8EAEC);
  Color get teal5002 => Color(0XFFD8F2F5);
  Color get teal5003 => Color(0XFFD8EBED);
  Color get teal5004 => Color(0XFFDBEBED);
  Color get teal5005 => Color(0XFFE3F3F5);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

ThemeData get theme => ThemeHelper().themeData();
