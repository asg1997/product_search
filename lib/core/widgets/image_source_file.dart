import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/image_source/image_source.dart';

class ImageSourceWidget extends ConsumerWidget {
  const ImageSourceWidget({
    required this.source,
    this.width,
    this.height,
    this.fit,
    super.key,
  });
  final ImageSource source;
  final BoxFit? fit;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image(
      fit: fit,
      width: width,
      height: height,
      image: source.when(
        file: (path) => MemoryImage(File(path).readAsBytesSync()),
        network: NetworkImage.new,
        asset: AssetImage.new,
      ),
    );
  }
}
