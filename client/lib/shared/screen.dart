import 'package:flutter/material.dart';

enum ScreenSize { Small, Normal, Large, ExtraLarge }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 1300) return ScreenSize.ExtraLarge;
  if (deviceWidth > 900) return ScreenSize.Large;
  if (deviceWidth > 600) return ScreenSize.Normal;
  return ScreenSize.Small;
}
