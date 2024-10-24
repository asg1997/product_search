import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final productImageSenderProvider =
    Provider<ProductImageSender>(_ProductImageSenderImpl.new);
typedef ProductId = String;

/// Сохраняет фото на сервере
abstract class ProductImageSender {
  /// Отправляет фотографю на сервер.
  /// Сервер в ответ выдает id фотографии, по которому можно делать запрос
  Future<ProductId> saveImageToServer(Uint8List image);
}

class _ProductImageSenderImpl implements ProductImageSender {
  _ProductImageSenderImpl(this.ref);

  final Ref ref;

  @override
  Future<ProductId> saveImageToServer(Uint8List image) async {
    // TODO: implement saveImageToServer
    throw UnimplementedError();
  }
}
