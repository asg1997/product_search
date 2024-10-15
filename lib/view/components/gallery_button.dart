// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';

// class GalleryButton extends StatefulWidget {
//   const GalleryButton({super.key});

//   @override
//   State<GalleryButton> createState() => _GalleryButtonState();
// }

// class _GalleryButtonState extends State<GalleryButton> {
//   File? lastImage;
//   @override
//   void initState() {
//     super.initState();
//     _getLastGalleryImage();
//   }

//   Future<void> _getLastGalleryImage() async {
//     // Запрашиваем разрешение на доступ
//     final permission = await PhotoManager.requestPermissionExtend();
//     if (!permission.isAuth) {
//       print('Доступ к галерее не предоставлен');
//       return;
//     }

//     // Получаем список альбомов с фото
//     final albums = await PhotoManager.getAssetPathList(
//       type: RequestType.image, // Только изображения
//       onlyAll: true, // Получаем только "Все фотографии"
//     );

//     if (albums.isNotEmpty) {
//       // Получаем все фото из альбома
//       final images = await albums[0].getAssetListPaged(page: 0, size: 1);

//       if (images.isNotEmpty) {
//         // Получаем файл изображения
//         lastImage = await images[0].file;
//         setState(() {});
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.square(
//       dimension: 53,
//       child: lastImage != null ? Image.file(lastImage!) : const Placeholder(),
//     );
//   }
// }
