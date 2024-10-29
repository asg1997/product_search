import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class NetworkImageDownloader {
  const NetworkImageDownloader._();

  static Future<File> downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final tempDir = (await getTemporaryDirectory()).path;
      final newPath = '$tempDir/${Random().nextInt(100000)}';
      final file = File(newPath);
      final bytes = response.bodyBytes;
      file.writeAsBytesSync(bytes);

      return file;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
