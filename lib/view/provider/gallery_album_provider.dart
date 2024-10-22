import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/models/album/album.dart';

final galleryAlbumProvider = FutureProvider.family<List<File>, PagginatedAlbum>(
    (ref, pagginatedAlbum) async {
  final album = pagginatedAlbum.path;

  final images = await album.getAssetListPaged(
    page: pagginatedAlbum.page,
    size: 1,
  );

  final files = <File>[];
  for (final image in images) {
    final file = await image.file;
    if (file == null) continue;
    files.add(file);
  }
  return files;
});
