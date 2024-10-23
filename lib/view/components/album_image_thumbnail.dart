import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumImageThumbnail extends ConsumerWidget {
  const AlbumImageThumbnail({
    required this.image,
    required this.onTap,
    super.key,
  });
  final Uint8List image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SizedBox.expand(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
