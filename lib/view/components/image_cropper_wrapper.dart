import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageCropperWrapper extends ConsumerStatefulWidget {
  const ImageCropperWrapper({required this.child, super.key});
  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageCropperWrapperState();
}

class _ImageCropperWrapperState extends ConsumerState<ImageCropperWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
