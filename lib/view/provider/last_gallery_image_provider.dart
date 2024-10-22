import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/view/provider/gallery_albums_provider.dart';

final lastgGalleryImageProvider = FutureProvider<File?>((ref) async {
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
