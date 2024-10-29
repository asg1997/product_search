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
    File inputFile, {
    Rect? rect,
  }) async {
    if (rect != null) {
      final croppedFile = await _cropImageAndResave(inputFile, rect);
      final webp = await _convertToWebP(croppedFile);
      return webp;
    } else {
      final webp = await _convertToWebP(inputFile);
      return webp;
    }
  }

  Future<File> _cropImageAndResave(File inputFile, Rect rect) async {
    final cropped = await _cropImage(inputFile, rect);
    final tempDir = (await getTemporaryDirectory()).path;
    final newName =
        '${path.basenameWithoutExtension(inputFile.path)}-${math.Random().nextInt(100000)}';
    final newPath = '$tempDir/$newName.jpg';

    await img.encodeImageFile(newPath, cropped);
    return File(newPath);
  }

  Future<img.Image> _cropImage(File inputFile, Rect rect) async {
    final image = await img.decodeImageFile(inputFile.path);
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
  }

  Future<File> _convertToWebP(File inputFile) async {
    final bytes = inputFile.readAsBytesSync();
    final outputBytes = await FlutterImageCompress.compressWithList(
      bytes,
      format: CompressFormat.webp,
    );
    final file = inputFile.writeAsBytes(outputBytes);
    return file;
  }
}
