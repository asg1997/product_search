import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final pickeImageFromGalleryProvider =
    FutureProvider.autoDispose<File?>((ref) async {
  final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (xFile == null) return null;
  final file = File(xFile.path);
  return file;
});
