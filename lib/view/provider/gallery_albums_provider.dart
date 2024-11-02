import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final galleryAlbumsPathsProvider =
    FutureProvider<List<AssetPathEntity>>((ref) async {
  // Запрос разрешений на доступ к камере и фотографиям
  final status = await PhotoManager.requestPermissionExtend(
    requestOption: const PermissionRequestOption(
      androidPermission: AndroidPermission(
        type: RequestType.image,
        mediaLocation: false,
      ),
    ),
  );

  // Проверяем, дали ли разрешения
  if (status == PermissionState.denied) {
    return [];
  }

  // Если разрешения предоставлены, получаем список альбомов
  final albums = await PhotoManager.getAssetPathList(
    type: RequestType.image,
  );

  return albums;
});
