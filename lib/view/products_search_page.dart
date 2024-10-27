import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/extensions.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/core/widgets/logo_widget.dart';
import 'package:product_search/view/components/grid_product_item.dart';
import 'package:product_search/view/components/list_product_item.dart';
import 'package:product_search/view/provider/get_product_provider.dart';

class ProductsSearchPage extends StatefulWidget {
  const ProductsSearchPage({required this.image, super.key});
  final File image;

  static void navigate(BuildContext context, {required File image}) =>
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => ProductsSearchPage(image: image),
        ),
      );

  @override
  State<ProductsSearchPage> createState() => _ProductsSearchPageState();
}

class _ProductsSearchPageState extends State<ProductsSearchPage> {
  bool isListView = true;

  void onScrollChanged(ScrollNotification notification) {
    final pixels = notification.metrics.pixels;
    if (pixels > 170) {
      isListView = false;
      setState(() {});
    } else {
      isListView = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightGrey,
      body: Consumer(
        builder: (_, ref, __) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              onScrollChanged(notification);
              return true;
            },
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverAppBar(
                  leading: const BackButton(color: Colors.white),
                  centerTitle: true,
                  pinned: true,
                  backgroundColor: Colors.white,
                  title: const LogoWidget(),
                  expandedHeight: MediaQuery.of(context).size.height * .6,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: Image.file(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: ref.watch(searchProductsProvider(widget.image)).when(
                        error: (err, _) =>
                            SliverToBoxAdapter(child: Text(err.toString())),
                        loading: () =>
                            const SliverToBoxAdapter(child: LoadingWidget()),
                        data: (products) => isListView
                            ? SliverList.separated(
                                itemCount: products.length,
                                separatorBuilder: (_, __) => const Gap(8),
                                itemBuilder: (_, index) =>
                                    ListProductItem(product: products[index]),
                              )
                            : SliverGrid.builder(
                                itemCount: products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio:
                                      context.isTablet ? 216 / 330 : 172 / 250,
                                ),
                                itemBuilder: (_, index) =>
                                    GridProductItem(product: products[index]),
                              ),
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
