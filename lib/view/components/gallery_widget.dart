import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/models/pagginated_album/pagginated_album.dart';
import 'package:product_search/view/components/album_image_thumbnail.dart';
import 'package:product_search/view/provider/gallery_album_thumbnails_provider.dart';
import 'package:product_search/view/provider/gallery_albums_provider.dart';
import 'package:product_search/view/provider/pick_image_from_gallery_provider.dart';
import 'package:product_search/view/provider/save_file_to_temporary_provider.dart';

class GalleryWidget extends ConsumerWidget {
  const GalleryWidget({required this.onImageSelected, super.key});
  final void Function(File image) onImageSelected;
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
  final void Function(File image) onImageSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagginatedAlbum = PagginatedAlbum(
      path: albumPath,
      countPerPage: 9,
    );

    final images =
        ref.watch(galleryAlbumThumbnailsProvider(pagginatedAlbum)).whenOrNull(
                  data: (items) => items,
                ) ??
            [];
    if (images.isEmpty) return Container();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: images.length > 8
                  ? () async {
                      final selectedImage =
                          await ref.read(pickeImageFromGalleryProvider.future);
                      if (selectedImage != null) onImageSelected(selectedImage);
                    }
                  : null,
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
                  if (images.length > 8)
                    Text(
                      'Show all',
                      style: AppFonts.medium14
                          .copyWith(color: const Color(0xFF5F6B71)),
                    ),
                ],
              ),
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
            itemCount: images.length > 8 ? 8 : images.length,
            itemBuilder: (_, index) {
              final image = images[index];

              return AlbumImageThumbnail(
                image: image.thumb,
                onTap: () async {
                  final newFile = await ref
                      .read(saveFileToTemporaryProvider(image.file).future);
                  onImageSelected(newFile);
                },
              );
            },
          ),
        ],
      ),
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
