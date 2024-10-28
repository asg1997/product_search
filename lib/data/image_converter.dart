import 'dart:io';
import 'dart:ui';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;

class ImageConverter {
  Future<File> convertImage(
    File inputFile, {
    Rect? rect,
    Offset? position,
  }) async {
    final webp = await _convertToWebP(inputFile);
    if (rect == null && position == null) return webp;
    final image = await img.decodeImageFile(inputFile.path);
    if (image == null) throw Exception('Unable to compress image');
    assert(
      rect != null && position != null,
      'Both rect and position must be provided',
    );
    final cropped = img.copyCrop(
      image,
      x: position!.dx.toInt(),
      y: position.dy.toInt(),
      width: rect!.width.toInt(),
      height: rect.height.toInt(),
    );

    await img.encodeImageFile(inputFile.path, cropped);
    return inputFile;
  }

  Future<File> _convertToWebP(File inputFile) async {
    final outputBytes = await FlutterImageCompress.compressWithFile(
      inputFile.path,
      format: CompressFormat.webp,
    );
    if (outputBytes == null) {
      throw Exception('Unable to convert to webp format');
    }
    final file = inputFile.writeAsBytes(outputBytes);
    return file;
  }
}
