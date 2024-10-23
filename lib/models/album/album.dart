import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'album.freezed.dart';

@freezed
class PagginatedAlbum with _$PagginatedAlbum {
  const factory PagginatedAlbum({
    required AssetPathEntity path,
    required int countPerPage,
  }) = _PagginatedAlbum;
}
