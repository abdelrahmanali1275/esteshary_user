import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/utils/app_colors.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static const TextStyle fontSize33 = TextStyle(fontSize: 33);

  static const TextStyle fontSize28 = TextStyle(fontSize: 28);
  static const TextStyle fontSize24 = TextStyle(fontSize: 24);
  static const TextStyle fontSize20 = TextStyle(fontSize: 20);
  static const TextStyle fontSize18 = TextStyle(fontSize: 18);
  static const TextStyle fontSize16 = TextStyle(fontSize: 16);
  static const TextStyle fontSize17 = TextStyle(fontSize: 17);
  static const TextStyle fontSize14 = TextStyle(fontSize: 14);
  static const TextStyle fontSize12 = TextStyle(fontSize: 12);
  static const TextStyle fontSize11 = TextStyle(fontSize: 11);
  static const TextStyle fontSize10 = TextStyle(fontSize: 10);

  ///FontWeight
  static const TextStyle fontWeight700 = TextStyle(fontWeight: FontWeight.w700);
  static const TextStyle fontWeight600 = TextStyle(fontWeight: FontWeight.w600);
  static const TextStyle fontWeight500 = TextStyle(fontWeight: FontWeight.w500);
  static const TextStyle fontWeight400 = TextStyle(fontWeight: FontWeight.w400);

  ///Font Family
  static const TextStyle fontCairo = TextStyle(fontFamily: "Cairo");

  ///FontStyle

  static TextStyle get font17whiteA700gESSTwo400 => fontSize17
      .merge(fontWeight700)
      .gESSTwo
      .copyWith(color: AppColors.whiteA700);

  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18,
      );

  static get bodyLarge18_1 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18,
      );

  static get bodyLargeBluegray20005 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.blueGray20005,
      );

  static get bodyLargeBluegray20007 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.blueGray20007,
      );

  static get bodyLargeBluegray300 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.blueGray300,
      );

  static get bodyLargeBluegray30001 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.blueGray30001,
      );

  static get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.blueGray400,
        fontSize: 18,
      );

  static get bodyLargeBluegray700 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.blueGray700,
        fontSize: 18,
      );

  static get bodyLargeErrorContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray500,
      );

  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray50001,
      );

  static get bodyLargeGray500_1 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray500,
      );

  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray600,
        fontSize: 18,
      );

  static get bodyLargeGray60002 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray60002,
      );

  static get bodyLargeGray60003 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray60003,
      );

  static get bodyLargeGray600_1 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray600,
      );

  static get bodyLargeGray600_2 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray600,
      );

  static get bodyLargeGray700 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray700,
      );

  static get bodyLargeGray80003 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.gray80003,
    fontSize: 16
      );

  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.black900,
        fontSize: 20,
      );
  static get bodyLargeBlack900Bold25 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.black900,
        fontSize: 25,
      fontWeight: FontWeight.bold

  );
  static get bodyLargeBlack900Bold20 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.black900,
        fontSize: 20,
      fontWeight: FontWeight.bold

  );

  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static get bodyLargePoppins => theme.textTheme.bodyLarge!.poppins.copyWith(
        fontSize: 18,
      );

  static get bodyLargeSFProTextGray600 =>
      theme.textTheme.bodyLarge!.sFProText.copyWith(
        color: AppColors.gray600,
      );

  static get bodyLargeTeal30001 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.teal30001,
      );

  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.whiteA700,
      );static get bodyLargeBlackFont40 => theme.textTheme.bodyLarge!.copyWith(
        color: AppColors.black900,
    fontSize: 40,
      );

  static get bodyMediumBluegray20001 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.blueGray20001,
      );
  static get bodyMediumBlack20001 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.black900,
      );
  static get bodyMediumGrey600 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.gray600,
      );

  static get bodyMediumBluegray20004 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.blueGray20004,
      );

  static get bodyMediumBluegray30002 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.blueGray30002,
      );

  static get bodyMediumBluegray700 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.blueGray700,
        fontSize: 15,
      );

  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.gray600,
        fontSize: 13,
      );

  static get bodyMediumGray600_1 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.gray600,
      );

  static get bodyMediumGray80001 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.gray80001,
        fontSize: 13,
      );

  static get bodyMediumGray8000113 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.gray80001,
        fontSize: 13,
      );

  static get bodyMediumGray80001_1 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.gray80001,
      );

  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static get bodyMediumPoppinsBluegray40001 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: AppColors.blueGray40001,
      );

  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get bodyMediumPrimary13 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
    fontSize: 13
      );

  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );

  static get bodyMediumRedA700 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.redA700,
        fontSize: 13,
      );

  static get bodyMediumSFProTextGray600 =>
      theme.textTheme.bodyMedium!.sFProText.copyWith(
        color: AppColors.gray600,
      );

  static get bodyMediumSFProTextGray60013 =>
      theme.textTheme.bodyMedium!.sFProText.copyWith(
        color: AppColors.gray600,
        fontSize: 13,
      );

  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.whiteA700,
        fontSize: 15,
      );

  static get bodyMediumWhiteA700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.whiteA700,
      );

  static get bodyMediumWhiteA700_2 => theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.whiteA700,
      );

  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: AppColors.gray600,
      );

  static get bodySmallGray60011 => theme.textTheme.bodySmall!.copyWith(
        color: AppColors.gray600,
        fontSize: 11,
      );

  static get bodySmallGray600_1 => theme.textTheme.bodySmall!.copyWith(
        color: AppColors.gray600,
      );

  static get bodySmallGray80001 => theme.textTheme.bodySmall!.copyWith(
        color: AppColors.gray80001,
      );

  static get bodySmallGreenA70001 => theme.textTheme.bodySmall!.copyWith(
        color: AppColors.greenA70001,
      );

  static get bodySmallRedA700 => theme.textTheme.bodySmall!.copyWith(
        color: AppColors.redA700,
      );

  // Headline text style
  static get headlineMediumGray80001 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: AppColors.gray80001,
      );

  // Label text style
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  // S text style
  static get sFProDisplayBluegray10001 => TextStyle(
        color: AppColors.blueGray10001,
        fontSize: 7,
        fontWeight: FontWeight.w400,
      ).sFProDisplay;

  // Title text style
  static get titleLargeBluegray90001 => theme.textTheme.titleLarge!.copyWith(
        color: AppColors.blueGray90001,
        fontSize: 22,
      );

  static get titleLargeBluegray90001SemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: AppColors.blueGray90001,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeBluegray90001SemiBold22 =>
      theme.textTheme.titleLarge!.copyWith(
        color: AppColors.blueGray90001,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeGray80001 => theme.textTheme.titleLarge!.copyWith(
        color: AppColors.gray80001,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeGrey500W400 => theme.textTheme.titleLarge!.copyWith(
        color: AppColors.gray500,
    fontWeight: FontWeight.w400,
      );

  static get titleLargeGray80001SemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: AppColors.gray80001,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeRedA700 => theme.textTheme.titleLarge!.copyWith(
        color: AppColors.redA700,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get titleMediumAmber500 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.amber500,
        fontSize: 18,
      );

  static get titleMediumBluegray70001 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.blueGray70001,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumBluegray90001 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.blueGray90001,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumBluegray9000118 =>
      theme.textTheme.titleMedium!.copyWith(
        color: AppColors.blueGray90001,
        fontSize: 18,
      );

  static get titleMediumGESSTwoWhiteA700 =>
      theme.textTheme.titleMedium!.gESSTwo.copyWith(
        color: AppColors.whiteA700,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumGray60001 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.gray60001,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumGray80001 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.gray80001,
      );

  static get titleMediumGray8000118 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.gray80001,
        fontSize: 18,
      );

  static get titleMediumGreenA70002 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.greenA70002,
        fontSize: 18,
      );

  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );

  static get titleMediumPrimary18 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 18,
      );

  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );

  static get titleMediumRedA400 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.redA400,
        fontSize: 18,
      );

  static get titleMediumSFProTextWhiteA700 =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: AppColors.whiteA700,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
      );

  static get titleMediumWhiteA70018 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
        fontSize: 18,
      );

  static get titleMediumWhiteA700Bold => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumWhiteA700Bold18 =>
      theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumWhiteA700Bold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumWhiteA700ExtraBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      );

  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: AppColors.whiteA700,
      );

  static get titleSmallGray80001 => theme.textTheme.titleSmall!.copyWith(
        color: AppColors.gray80001,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: AppColors.whiteA700,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallWhiteA70015 => theme.textTheme.titleSmall!.copyWith(
        color: AppColors.whiteA700,
        fontSize: 15,
      );

  static get titleSmallWhiteA700SemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: AppColors.whiteA700,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get nunitoSans {
    return copyWith(
      fontFamily: 'Nunito Sans',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get gESSTwo {
    return copyWith(
      fontFamily: 'GE SS Two',
    );
  }
}
