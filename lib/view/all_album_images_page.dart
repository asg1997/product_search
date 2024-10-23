import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/models/album/album.dart';
import 'package:product_search/view/components/album_image_thumbnail.dart';
import 'package:product_search/view/provider/gallery_album_thumbnails_provider.dart';

class AllAlbumImagesPage extends ConsumerWidget {
  const AllAlbumImagesPage({required this.albumPath, super.key});
  final AssetPathEntity albumPath;
  static Future<Uint8List?> navigate(
    BuildContext context, {
    required AssetPathEntity albumPath,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute<Uint8List>(
          builder: (_) => AllAlbumImagesPage(albumPath: albumPath),
        ),
      );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagginatedAlbum = PagginatedAlbum(
      path: albumPath,
      countPerPage: 100,
    );

    Timer? pagginnationTime;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(),
        centerTitle: true,
        elevation: 0,

        // НАЗВАНИЕ
        title: Text(
          albumPath.name,
          style: AppFonts.linksButtonSmall.copyWith(color: AppColors.mainBlack),
        ),
      ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (scrollUpdate) {
          if (pagginnationTime?.isActive == true) return true;
          pagginnationTime = Timer(Durations.extralong1, () {});
          final shouldLoadDataPixels = scrollUpdate.metrics.maxScrollExtent;
          final currentPixels = scrollUpdate.metrics.pixels;
          if (currentPixels >= shouldLoadDataPixels) {
            ref
                .read(galleryAlbumThumbnailsProvider(pagginatedAlbum).notifier)
                .fetchNextBatch();
          }
          return true;
        },
        child: ref.watch(galleryAlbumThumbnailsProvider(pagginatedAlbum)).when(
              data: (files) => _GridView(items: files),
              onGoingLoading: (items) => _GridView(
                items: items,
                loadingMore: true,
              ),
              error: (err, _) => Text(err.toString()),
              loading: LoadingWidget.new,
            ),
      ),
    );
  }
}

class _GridView extends ConsumerWidget {
  const _GridView({
    required this.items,
    this.loadingMore = false,
  });
  final List<Uint8List> items;
  final bool loadingMore;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (_, index) {
            final item = items[index];
            return AlbumImageThumbnail(
              image: item,
              onTap: () {
                Navigator.pop(context, item);
              },
            );
          },
        ),
        if (loadingMore)
          const Positioned(
            bottom: 40,
            child: LoadingWidget(),
          ),
      ],
    );
  }
}
