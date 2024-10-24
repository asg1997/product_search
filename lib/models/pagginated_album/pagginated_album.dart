import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'pagginated_album.freezed.dart';

/// Альбом с информацией, необходимой для пагинации
@freezed
class PagginatedAlbum with _$PagginatedAlbum {
  const factory PagginatedAlbum({
    required AssetPathEntity path,
    required int countPerPage,
  }) = _PagginatedAlbum;
}
