// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageTransformer {
  Future<File> convertImage(
    String inputFile, {
    Rect? cropRect,
  }) async {
    if (cropRect != null) {
      final croppedFile = await _cropImageAndResave(inputFile, cropRect);
      final webp = await _convertToWebP(croppedFile);
      return webp;
    } else {
      final webp = await _convertToWebP(inputFile);
      return webp;
    }
  }

  Future<String> _cropImageAndResave(String inputFile, Rect rect) async {
    final cropped = await _cropImage(inputFile, rect);
    final tempDir = (await getTemporaryDirectory()).path;
    final newName =
        '${path.basenameWithoutExtension(inputFile)}-${math.Random().nextInt(100000)}';
    final newPath = '$tempDir/$newName.jpg';

    await img.encodeImageFile(newPath, cropped);
    return newPath;
  }

  Future<img.Image> _cropImage(String inputFile, Rect rect) async {
    try {
      final bytes = await File(inputFile).readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) throw Exception('Unable to compress image');

      // final cropped = img.copyCrop(
      //   image,
      //   x: 0,
      //   y: 0,
      //   width: image.width,
      //   height: image.height,
      // );
      final cropped = img.copyCrop(
        image,
        x: rect.center.dx.toInt(),
        y: rect.center.dy.toInt(),
        width: rect.width.toInt(),
        height: rect.height.toInt(),
      );
      return cropped;
    } catch (e) {
      rethrow;
    }
  }

  Future<File> _convertToWebP(String inputFile) async {
    final bytes = File(inputFile).readAsBytesSync();
    final outputBytes = await FlutterImageCompress.compressWithList(
      bytes,
      format: CompressFormat.webp,
    );
    final file = File(inputFile).writeAsBytes(outputBytes);
    return file;
  }
}
