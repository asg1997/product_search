import 'package:flutter/material.dart';

class ProductsSearchPageConsts {
  const ProductsSearchPageConsts._();
  static double sliverAppBarHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * .6;

  static Rect defaultImageClip(BuildContext context) => Rect.fromCenter(
        center: Offset(
          MediaQuery.of(context).size.width / 2,
          ProductsSearchPageConsts.sliverAppBarHeight(context) / 2 * 1.3,
        ),
        width: MediaQuery.of(context).size.width - 40,
        height: ProductsSearchPageConsts.sliverAppBarHeight(context) * .8,
      );
}