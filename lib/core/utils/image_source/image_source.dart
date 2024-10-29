import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_source.freezed.dart';

@freezed
sealed class ImageSource with _$ImageSource {
  const factory ImageSource.file(String path) = FileImageSource;
  const factory ImageSource.network(String url) = NetworkImageSource;
  const factory ImageSource.asset(String path) = AssetImageSource;
}
