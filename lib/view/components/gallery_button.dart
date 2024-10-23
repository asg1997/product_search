import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/provider/gallery_albums_provider.dart';

final lastGalleryImageProvider = FutureProvider.autoDispose<File?>((ref) async {
  final file = await ref.watch(galleryAlbumsPathsProvider).whenOrNull(
    data: (paths) async {
      if (paths.isEmpty) return null;
      final allImagesAlbum = paths.first;
      final images = await allImagesAlbum.getAssetListPaged(page: 1, size: 1);
      if (images.isEmpty) return null;
      final file = await images.first.file;
      return file;
    },
  );
  return file;
});

class GalleryButton extends ConsumerWidget {
  const GalleryButton({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.gallery),
              Align(
                alignment: const Alignment(0.6, -0.4),
                child: Transform.rotate(
                  angle:
                      20 * (3.1415926535897932 / 180), // Поворот на 30 градусов
                  child: ref.watch(lastGalleryImageProvider).when(
                        data: (lastImage) {
                          if (lastImage == null) return Container();

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              lastImage,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        error: (_, __) => Container(),
                        loading: Container.new,
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
