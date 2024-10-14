import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_stores.freezed.dart';
part 'select_stores.g.dart';

typedef SelectStoresId = String;
typedef SelectStories = List<SelectStores>;

@freezed
class SelectStores with _$SelectStores {
  const factory SelectStores({
    required String title,
  }) = _SelectStores;

  factory SelectStores.fromJson(Map<String, dynamic> json) =>
      _$SelectStoresFromJson(json);
}
