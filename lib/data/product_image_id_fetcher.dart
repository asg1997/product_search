// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:product_search/core/utils/services/graph_ql_config.dart';
import 'package:product_search/models/search_input/search_input.dart';

final productImageSenderProvider =
    Provider<ProductImageIdFetcher>(_ProductImageSenderImpl.new);
typedef ImageUrl = String;

/// Сохраняет фото на сервере
abstract class ProductImageIdFetcher {
  /// Отправляет фотографию на сервер.
  /// Сервер в ответ выдает id фотографии, по которому можно делать запрос
  Future<ImageUrl> getImageId(SearchInput input);
}

class _ProductImageSenderImpl implements ProductImageIdFetcher {
  _ProductImageSenderImpl(this.ref);

  final Ref ref;

  @override
  Future<ImageUrl> getImageId(SearchInput input) async {
    final resp = await switch (input) {
      FileSearchInput(filePath: final filePath) =>
        _getIdByFileInput(File(filePath)),
      UrlSearchInput(url: final url) => _getIdByUrl(url),
    };

    final error = resp.exception;
    if (error != null) throw error;

    final data = resp.data!;
    final json = data['uploadImage'] as Map<String, dynamic>;
    final imageId = json['imageId'] as String;

    return imageId;
  }

  Future<QueryResult<Object?>> _getIdByFileInput(File file) async {
    final fileBytes = file.readAsBytesSync();
    final mimeType = lookupMimeType(file.path, headerBytes: fileBytes) ?? '';

    final fileExt = mimeType.replaceAll('image/', '');
    final filename = '${DateTime.now().millisecondsSinceEpoch}.$fileExt';

    final multipartFile = http.MultipartFile.fromBytes(
      'photo',
      file.readAsBytesSync(),
      filename: filename,
      contentType: MediaType('image', fileExt),
    );

    const query = r'''
mutation UploadFile($file: File) {
  uploadImage(file: $file) {
    imageId
  }
}''';

    final resp = await GraphQlConfig()
        .client
        .mutate(
          MutationOptions(
            document: gql(query),
            variables: {'file': multipartFile},
          ),
        )
        .timeout(const Duration(seconds: 30));
    return resp;
  }

  Future<QueryResult<Object?>> _getIdByUrl(String url) async {
    const query = r'''
mutation UploadFile($url: String) {
  uploadImage(url: $url) {
    imageId
  }
}''';

    final resp = await GraphQlConfig()
        .client
        .mutate(
          MutationOptions(
            document: gql(query),
            variables: {'url': url},
          ),
        )
        .timeout(const Duration(seconds: 30));
    return resp;
  }
}
