import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

/// Магазин где может поисходить поиск товара
@freezed
class Store with _$Store {
  const factory Store({
    required String name,
    required String geo,
  }) = _Store;
  const Store._();

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
