import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/extensions.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/core/widgets/logo_widget.dart';
import 'package:product_search/data/image_transformer.dart';
import 'package:product_search/view/components/grid_product_item.dart';
import 'package:product_search/view/components/image_cropper_wrapper.dart';
import 'package:product_search/view/components/list_product_item.dart';
import 'package:product_search/view/provider/search_products_provider.dart';
import 'package:product_search/view/utils/products_search_page_consts.dart';

class ProductsSearchPage extends ConsumerStatefulWidget {
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
  ConsumerState<ProductsSearchPage> createState() => _ProductsSearchPageState();
}

class _ProductsSearchPageState extends ConsumerState<ProductsSearchPage> {
  bool isListView = true;
  bool scrollPriority = false;

  File? searchImage;
  bool _compressingImage = true;

  @override
  void initState() {
    super.initState();

    initialCompressImage();
  }

  Future<void> initialCompressImage() async {
    searchImage = await ImageTransformer().convertImage(widget.image);
    _compressingImage = false;
    setState(() {});
  }

  bool onScrollChanged(ScrollNotification notification) {
    if (searchImage == null || _compressingImage) return false;
    final pixels = notification.metrics.pixels;
    // FIXME: убрать маджик число
    isListView = pixels <= 170;
    setState(() {});
    return true;
  }

  void prioritizeScroll() {
    scrollPriority = true;
    setState(() {});
  }

  void onTapDown(TapDownDetails details) {
    final yPoint = details.globalPosition.dy;
    final appBarHeight = ProductsSearchPageConsts.sliverAppBarHeight(context);
    final onAppBarTapped = yPoint <= appBarHeight;
    scrollPriority = !onAppBarTapped;

    setState(() {});
  }

  Future<void> onImageResize(Rect rect, Offset position) async {
    _compressingImage = true;
    setState(() {});
    searchImage = await ImageTransformer().convertImage(
      widget.image,
      rect: rect,
    );
    _compressingImage = false;
    setState(() {});
    // ignore: unused_result
    ref.refresh(searchProductsProvider(searchImage!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightGrey,
      body: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: (_) => prioritizeScroll(),
        onTapCancel: prioritizeScroll,
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollChanged,
          child: CustomScrollView(
            physics: searchImage != null
                ? scrollPriority
                    ? null
                    : const NeverScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: const BackButton(color: Colors.white),
                centerTitle: true,
                pinned: true,
                backgroundColor: Colors.white,
                title: const LogoWidget(),
                expandedHeight:
                    ProductsSearchPageConsts.sliverAppBarHeight(context),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child: ImageCropperWrapper(
                        onImageResize: onImageResize,
                        image: widget.image,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(12),
                sliver: _compressingImage || searchImage == null
                    ? const SliverToBoxAdapter(child: LoadingWidget())
                    : ref.watch(searchProductsProvider(searchImage!)).when(
                          skipLoadingOnRefresh: false,
                          error: (err, _) =>
                              SliverToBoxAdapter(child: Text(err.toString())),
                          loading: () => const SliverToBoxAdapter(
                            child: LoadingWidget(),
                          ),
                          data: (products) => isListView
                              ? SliverList.separated(
                                  itemCount: products.length,
                                  separatorBuilder: (_, __) => const Gap(8),
                                  itemBuilder: (_, index) => ListProductItem(
                                    product: products[index],
                                  ),
                                )
                              : SliverGrid.builder(
                                  itemCount: products.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: context.isTablet ? 3 : 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: context.isTablet
                                        ? 216 / 330
                                        : 172 / 250,
                                  ),
                                  itemBuilder: (_, index) => GridProductItem(
                                    product: products[index],
                                  ),
                                ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
