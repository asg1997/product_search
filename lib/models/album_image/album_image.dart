import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_image.freezed.dart';

@freezed
class AlbumImage with _$AlbumImage {
  const factory AlbumImage({
    required File file,
    required Uint8List thumb,
  }) = _AlbumImage;
  const AlbumImage._();
}
