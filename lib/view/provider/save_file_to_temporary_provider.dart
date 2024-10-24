import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

final saveFileToTemporaryProvider =
    FutureProvider.autoDispose.family<File, File>((ref, tempFile) async {
  final tempDir = (await getTemporaryDirectory()).path;

  final newPath = path.join(
    tempDir,
    Random().nextInt(100000).toString(),
  );
  final bytes = tempFile.readAsBytesSync();
  final newFile = File(newPath)..writeAsBytesSync(bytes);

  return newFile;
});
