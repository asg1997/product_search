import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_stores.freezed.dart';
part 'filter_stores.g.dart';

typedef FilterStoresId = String;
typedef FilterStories = List<FilterStores>;

@freezed
class FilterStores with _$FilterStores {
  const factory FilterStores({
    required String title,
    required FilterStoresId id,
    required bool isSelected,
  }) = _FilterStores;

  factory FilterStores.fromJson(Map<String, dynamic> json) =>
      _$FilterStoresFromJson(json);
}
