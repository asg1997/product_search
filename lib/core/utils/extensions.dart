import 'package:flutter/material.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';

extension IsTablet on BuildContext {
  bool get isTablet =>
      MediaQuery.of(this).size.width >= AppDecoration.tabletBreakpoint;
}
