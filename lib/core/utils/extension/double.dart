import '../size_utils.dart';
import 'package:flutter/material.dart';

extension FormatExtension on double? {
  /// Validate given int is not null and returns given value if null.
  double validate({double value = 0}) {
    return this ?? value;
  }

  /// return Responsive height
  double get h => getVerticalSize(this.validate());

  /// return Responsive width
  double get w => getHorizontalSize(this.validate());

  /// Leaves given height of space
  Widget get height => SizedBox(height: getVerticalSize(this!.toDouble()));

  /// Leaves given width of space
  Widget get width => SizedBox(width: getHorizontalSize(this!.toDouble()));

  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.validate().toStringAsFixed(fractionDigits));
  }
}
