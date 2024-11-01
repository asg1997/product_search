import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

final galleryAlbumsPathsProvider =
    FutureProvider<List<AssetPathEntity>>((ref) async {
  // Запрос разрешений на доступ к камере и фотографиям
  final cameraStatus = await Permission.camera.request();
  final photoStatus = await Permission.photos.request();

  // Проверяем, дали ли разрешения
  if (cameraStatus.isDenied || photoStatus.isDenied) {
    return [];
  }

  // Если разрешения предоставлены, получаем список альбомов
  final albums = await PhotoManager.getAssetPathList(
    type: RequestType.image,
  );

  return albums;
});
