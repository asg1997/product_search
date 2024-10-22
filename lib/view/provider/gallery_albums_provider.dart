import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final galleryAlbumsPathsProvider =
    FutureProvider<List<AssetPathEntity>>((ref) async {
  final permission = await PhotoManager.requestPermissionExtend();
  if (!permission.isAuth) return [];
  final albums = await PhotoManager.getAssetPathList(
    type: RequestType.image,
  );
  return albums;
});
