import 'package:flutter/material.dart';
import 'responsive_builder.dart';
enum DeviceScreenType { Mobile, Tablet, Desktop }

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        switch (sizingInformation.deviceType) {
          case DeviceScreenType.Tablet: return tablet;
          case DeviceScreenType.Desktop: return tablet;
          default: return mobile;
        }
      },
    );
  }
}
