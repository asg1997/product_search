import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/models/album_image/album_image.dart';
import 'package:product_search/models/pagginated_album/pagginated_album.dart';

final galleryAlbumThumbnailsProvider = StreamProvider.family
    .autoDispose<List<AlbumImage>, PagginatedAlbum>((ref, album) async* {
  final assets = await album.path.getAssetListRange(
    start: 0,
    end: album.countPerPage,
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
    yield images;
  }
});
