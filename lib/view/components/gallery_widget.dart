import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GalleryWidget extends ConsumerWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Gallery',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
