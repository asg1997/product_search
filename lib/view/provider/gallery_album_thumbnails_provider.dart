import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/core/utils/pagination_controller/pagination_controller.dart';
import 'package:product_search/core/utils/pagination_controller/pagination_state/pagination_state.dart';
import 'package:product_search/models/pagginated_album/pagginated_album.dart';

final galleryAlbumThumbnailsProvider = StateNotifierProvider.family.autoDispose<
    PaginationController<Uint8List>,
    PaginationState<Uint8List>,
    PagginatedAlbum>((ref, album) {
  return PaginationController(
    itemsPerBatch: album.countPerPage,
    initialPage: 1,
    fetchNextItems: (_, offset, page) async {
      final images = await album.path.getAssetListRange(
        start: offset,
        end: offset + album.countPerPage,
      );

      final files = <Uint8List>[];
      for (final image in images) {
        final file =
            await image.thumbnailDataWithSize(const ThumbnailSize(200, 200));
        if (file == null) continue;
        files.add(file);
      }
      return files;
    },
  );
});
