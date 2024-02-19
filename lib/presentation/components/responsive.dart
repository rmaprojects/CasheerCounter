import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  static const double mobileMaxWidth = 650.0;
  static const double tabletMaxWidth = 1100.0;

  final Widget mobileView;
  final Widget tabletView;
  final Widget? desktopView;

  const ResponsiveLayout({
    super.key,
    required this.mobileView,
    required this.tabletView,
    this.desktopView,
  });

  static bool isScreenTablet(final BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileMaxWidth;
  static bool isScreenMobile(final BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileMaxWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > tabletMaxWidth) {
        return desktopView ?? tabletView;
      } else if (constraints.maxWidth > mobileMaxWidth) {
        return tabletView;
      } else {
        return mobileView;
      }
    }));
  }
}
