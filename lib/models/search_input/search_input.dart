import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_search/core/utils/image_source/image_source.dart';

part 'search_input.freezed.dart';

@freezed
sealed class SearchInput with _$SearchInput {
  const factory SearchInput.file(String filePath) = FileSearchInput;
  const factory SearchInput.url(String url) = UrlSearchInput;
  const SearchInput._();
  factory SearchInput.fromImageSource(ImageSource imageSource) {
    return switch (imageSource) {
      FileImageSource(path: final path) => SearchInput.file(path),
      NetworkImageSource(url: final url) => SearchInput.url(url),
      AssetImageSource() => throw UnimplementedError(),
    };
  }

  ImageSource imageSource() => switch (this) {
        FileSearchInput(filePath: final filePath) => ImageSource.file(filePath),
        UrlSearchInput(url: final url) => ImageSource.network(url),
      };
}
