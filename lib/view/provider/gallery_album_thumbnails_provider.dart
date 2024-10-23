import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/models/album/album.dart';

final galleryAlbumThumbnaimsProvider =
    FutureProvider.family<List<Uint8List>, PagginatedAlbum>(
        (ref, pagginatedAlbum) async {
  final album = pagginatedAlbum.path;

  final images = await album.getAssetListPaged(
    page: pagginatedAlbum.page,
    size: 10,
  );

  final files = <Uint8List>[];
  for (final image in images) {
    final file =
        await image.thumbnailDataWithSize(const ThumbnailSize(200, 200));
    if (file == null) continue;
    files.add(file);
  }
  return files;
});
