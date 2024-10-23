import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/models/album/album.dart';
import 'package:product_search/view/provider/gallery_album_thumbnails_provider.dart';
import 'package:product_search/view/provider/gallery_albums_provider.dart';

class GalleryWidget extends ConsumerWidget {
  const GalleryWidget({required this.onImageSelected, super.key});
  final void Function(Uint8List image) onImageSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(galleryAlbumsPathsProvider).value ?? [];
    return Column(
      children: [
        const _ShapeContainerWidget(),
        Expanded(
          child: ColoredBox(
            color: AppColors.mainLightGrey,
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: albums.length,
              itemBuilder: (_, index) {
                final albumPath = albums[index];
                return AlbumWidget(
                  albumPath: albumPath,
                  onImageSelected: onImageSelected,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AlbumWidget extends ConsumerWidget {
  const AlbumWidget({
    required this.onImageSelected,
    required this.albumPath,
    super.key,
  });
  final AssetPathEntity albumPath;
  final void Function(Uint8List image) onImageSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagginatedAlbum = PagginatedAlbum(path: albumPath, page: 1);
    final files =
        ref.watch(galleryAlbumThumbnaimsProvider(pagginatedAlbum)).value ?? [];
    if (files.isEmpty) return Container();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    pagginatedAlbum.path.name,
                    style: AppFonts.extraBold16.copyWith(
                      color: AppColors.mainBlack,
                      height: 1,
                    ),
                  ),
                ),
                if (files.length > 8)
                  TextButton(
                    // TODO: Перейти на страницу со всеми фотографиями
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      'Show all',
                      style: AppFonts.medium14
                          .copyWith(color: const Color(0xFF5F6B71)),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(6),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: files.length > 8 ? 8 : files.length,
            itemBuilder: (_, index) {
              final item = files[index];
              return _AlbumImage(
                image: item,
                onTap: () => onImageSelected(item),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AlbumImage extends ConsumerWidget {
  const _AlbumImage({
    required this.image,
    required this.onTap,
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

class _ShapeContainerWidget extends ConsumerWidget {
  const _ShapeContainerWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomPaint(
      painter: _ShapeContainerPaint(),
      size: const Size(double.infinity, 24),
    );
  }
}

class _ShapeContainerPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.mainLightGrey;
    final path = Path()
      ..arcToPoint(
        Offset(size.height, size.height),
        radius: Radius.circular(size.height),
        clockwise: false,
      )
      ..lineTo(size.width - size.height, size.height)
      ..arcToPoint(
        Offset(size.width, 0),
        radius: Radius.circular(size.height),
        clockwise: false,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
