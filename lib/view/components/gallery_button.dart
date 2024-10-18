import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:product_search/resources/resources.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({super.key});

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  File? lastImage;
  @override
  void initState() {
    super.initState();
    _getLastGalleryImage();
  }

  Future<void> _getLastGalleryImage() async {
    // Запрашиваем разрешение на доступ
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      print('Доступ к галерее не предоставлен');
      return;
    }

    // Получаем список альбомов с фото
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image, // Только изображения
      onlyAll: true, // Получаем только "Все фотографии"
    );

    if (albums.isNotEmpty) {
      // Получаем все фото из альбома
      final images = await albums[0].getAssetListPaged(page: 0, size: 1);

      if (images.isNotEmpty) {
        // Получаем файл изображения
        lastImage = await images[0].file;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return lastImage != null
        ? SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImages.gallery),
                Align(
                  alignment: const Alignment(0.6, -0.4),
                  child: Transform.rotate(
                    angle: 20 *
                        (3.1415926535897932 / 180), // Поворот на 30 градусов
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        lastImage!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const Placeholder();
  }
}
