import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'app_consts.dart';


// This functions are responsible to make UI responsive across all the mobile devices.

MediaQueryData mediaQueryData = MediaQueryData.fromView(ui.window);

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 393;
const num FIGMA_DESIGN_HEIGHT = 852;
const num FIGMA_DESIGN_STATUS_BAR = 27;

///This method is used to get device viewport width.
get _width {
  return AppConsts.appWidth;
}

///This method is used to get device viewport height.
get _height {
  num statusBar = mediaQueryData.viewPadding.top;
  num bottomBar = mediaQueryData.viewPadding.bottom;
  num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
  return AppConsts.appHeight;
}

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return ((px * _width) / FIGMA_DESIGN_WIDTH);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  return ((px * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));
}





///This method is used to set padding responsively
EdgeInsetsDirectional getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}

///This method is used to set margin responsively
EdgeInsetsDirectional getMargin({
  double? all,
  double? end,
  double? top,
  double? start,
  double? bottom,
}) {
  return getMarginOrPadding(
    all: all,
    left: end,
    top: top,
    right: start,
    bottom: bottom,
  );
}

///This method is used to get padding or margin responsively
EdgeInsetsDirectional getMarginOrPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsetsDirectional.only(
    end: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    start: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}

