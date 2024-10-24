import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/core/utils/pagination_controller/pagination_controller.dart';
import 'package:product_search/core/utils/pagination_controller/pagination_state/pagination_state.dart';
import 'package:product_search/models/album_image/album_image.dart';
import 'package:product_search/models/pagginated_album/pagginated_album.dart';

final galleryAlbumThumbnailsProvider = StateNotifierProvider.family.autoDispose<
    PaginationController<AlbumImage>,
    PaginationState<AlbumImage>,
    PagginatedAlbum>((ref, album) {
  return PaginationController(
    itemsPerBatch: album.countPerPage,
    initialPage: 1,
    fetchNextItems: (_, offset, page) async {
      final assets = await album.path.getAssetListRange(
        start: offset,
        end: offset + album.countPerPage,
      );

      final images = <AlbumImage>[];
      for (final asset in assets) {
        final thumb =
            await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
        final file = await asset.file;
        if (thumb == null || file == null) continue;
        images.add(
          AlbumImage(
            file: file,
            thumb: thumb,
          ),
        );
      }
      return images;
    },
  );
});
