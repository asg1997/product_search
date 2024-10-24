import 'package:flutter/material.dart';

class AppDecoration {
  static const padding12 = EdgeInsets.symmetric(horizontal: 12);
  static final borderRadius = BorderRadius.circular(16);
  static const tabletBreakpoint = 768.0;

  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;
}
