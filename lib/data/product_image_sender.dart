// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:product_search/core/utils/consts/graph_ql_config.dart';

final productImageSenderProvider =
    Provider<ProductImageSender>(_ProductImageSenderImpl.new);
typedef ImageUrl = String;

/// Сохраняет фото на сервере
abstract class ProductImageSender {
  /// Отправляет фотографю на сервер.
  /// Сервер в ответ выдает id фотографии, по которому можно делать запрос
  Future<ImageUrl> saveImageToServer(File file);
}

class _ProductImageSenderImpl implements ProductImageSender {
  _ProductImageSenderImpl(this.ref);

  final Ref ref;

  @override
  Future<ImageUrl> saveImageToServer(File file) async {
    final fileBytes = file.readAsBytesSync();
    final mimeType = lookupMimeType(file.path, headerBytes: fileBytes) ?? '';

    final fileExt = mimeType.replaceAll('image/', '');
    final filename = '${DateTime.now().millisecondsSinceEpoch}.$fileExt';
    //path.basename(file.path);
    final uploadName = filename;
    // '$filename$fileExt';
    final multipartFile = http.MultipartFile.fromBytes(
      'photo',
      file.readAsBytesSync(),
      filename: uploadName,
      contentType: MediaType('image', fileExt),
    );
    // final multipartFile = await http.MultipartFile.fromPath('photo', file.path);

    const uploadImage = r'''
mutation UploadFile($file: File) {
  uploadImage(file: $file) {
    imageId
  }
}''';

    final resp = await GraphQlConfig().client.mutate(
          MutationOptions(
            document: gql(uploadImage),
            variables: {'file': multipartFile},
          ),
        );
    final data = resp.data;
    final ex = resp.exception;
    // Чтение и декодирование ответа

    // Отправляем запрос
    // final parsed = _parseResponse(response);

    throw Exception();
  }

  Future<ImageUrl> _parseResponse(StreamedResponse response) async {
    final code = response.statusCode;

    final responseBody = await response.stream.bytesToString();
    final jsonResponse = jsonDecode(responseBody) as Map<String, dynamic>;
    final errors = jsonResponse['errors'] as List<dynamic>?;
    if (errors != null && errors.isNotEmpty) {
      final error = errors.first;
    }
    throw UnimplementedError();
  }
}
