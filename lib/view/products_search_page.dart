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
import 'package:product_search/models/product/product.dart';
import 'package:product_search/models/search_input/search_input.dart';
import 'package:product_search/view/components/grid_product_item.dart';
import 'package:product_search/view/components/image_cropper_wrapper.dart';
import 'package:product_search/view/components/list_product_item.dart';
import 'package:product_search/view/provider/search_products_provider.dart';
import 'package:product_search/view/utils/products_search_page_consts.dart';

class ProductsSearchPage extends ConsumerStatefulWidget {
  const ProductsSearchPage({required this.image, super.key});
  final SearchInput image;

  static void navigate(BuildContext context, {required SearchInput image}) =>
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

  late SearchInput _searchImage = widget.image;
  bool _compressingImage = false;

  Color _appBarColor = AppColors.mainLightGrey;

  @override
  void initState() {
    super.initState();

    initialCompressImage();
  }

  Future<void> initialCompressImage() async {
    final input = widget.image;
    if (input is FileSearchInput) {
      _compressingImage = true;
      setState(() {});
      final compressedFile =
          await ImageTransformer().convertImage(input.filePath);
      _searchImage = SearchInput.file(compressedFile.path);
      _compressingImage = false;
      setState(() {});
    }
  }

  bool onScrollChanged(ScrollNotification notification) {
    if (_compressingImage) return false;
    final pixels = notification.metrics.pixels;
    isListView = pixels <= MediaQuery.of(context).size.height * .2;
    _appBarColor = !isListView ? Colors.white : AppColors.mainLightGrey;
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

  Future<void> onImageResize(Future<File> croppedImage) async {
    _compressingImage = true;
    setState(() {});

    final croppedImagePath = (await croppedImage).path;
    _searchImage = SearchInput.file(croppedImagePath);

    _compressingImage = false;
    setState(() {});
    // ignore: unused_result
    ref.refresh(searchProductsProvider(_searchImage));
  }

  Future<void> searchSimilar(Product product) async {
    final searchInput = SearchInput.url(product.image);
    ProductsSearchPage.navigate(context, image: searchInput);
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
            physics: _compressingImage
                ? scrollPriority
                    ? null
                    : const NeverScrollableScrollPhysics()
                : null,
            slivers: [
              SliverAppBar(
                leading: const BackButton(color: Colors.white),
                centerTitle: true,
                pinned: true,
                backgroundColor: _appBarColor,
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
                        image: widget.image.imageSource(),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(12),
                sliver: _compressingImage
                    ? const SliverToBoxAdapter(child: LoadingWidget())
                    : ref.watch(searchProductsProvider(_searchImage)).when(
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
                                    onImageTapped: () =>
                                        searchSimilar(products[index]),
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
