// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagginated_album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PagginatedAlbum {
  AssetPathEntity get path => throw _privateConstructorUsedError;
  int get countPerPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagginatedAlbumCopyWith<PagginatedAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagginatedAlbumCopyWith<$Res> {
  factory $PagginatedAlbumCopyWith(
          PagginatedAlbum value, $Res Function(PagginatedAlbum) then) =
      _$PagginatedAlbumCopyWithImpl<$Res, PagginatedAlbum>;
  @useResult
  $Res call({AssetPathEntity path, int countPerPage});
}

/// @nodoc
class _$PagginatedAlbumCopyWithImpl<$Res, $Val extends PagginatedAlbum>
    implements $PagginatedAlbumCopyWith<$Res> {
  _$PagginatedAlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? countPerPage = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as AssetPathEntity,
      countPerPage: null == countPerPage
          ? _value.countPerPage
          : countPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagginatedAlbumImplCopyWith<$Res>
    implements $PagginatedAlbumCopyWith<$Res> {
  factory _$$PagginatedAlbumImplCopyWith(_$PagginatedAlbumImpl value,
          $Res Function(_$PagginatedAlbumImpl) then) =
      __$$PagginatedAlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AssetPathEntity path, int countPerPage});
}

/// @nodoc
class __$$PagginatedAlbumImplCopyWithImpl<$Res>
    extends _$PagginatedAlbumCopyWithImpl<$Res, _$PagginatedAlbumImpl>
    implements _$$PagginatedAlbumImplCopyWith<$Res> {
  __$$PagginatedAlbumImplCopyWithImpl(
      _$PagginatedAlbumImpl _value, $Res Function(_$PagginatedAlbumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? countPerPage = null,
  }) {
    return _then(_$PagginatedAlbumImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as AssetPathEntity,
      countPerPage: null == countPerPage
          ? _value.countPerPage
          : countPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PagginatedAlbumImpl implements _PagginatedAlbum {
  const _$PagginatedAlbumImpl({required this.path, required this.countPerPage});

  @override
  final AssetPathEntity path;
  @override
  final int countPerPage;

  @override
  String toString() {
    return 'PagginatedAlbum(path: $path, countPerPage: $countPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagginatedAlbumImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.countPerPage, countPerPage) ||
                other.countPerPage == countPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, countPerPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagginatedAlbumImplCopyWith<_$PagginatedAlbumImpl> get copyWith =>
      __$$PagginatedAlbumImplCopyWithImpl<_$PagginatedAlbumImpl>(
          this, _$identity);
}

abstract class _PagginatedAlbum implements PagginatedAlbum {
  const factory _PagginatedAlbum(
      {required final AssetPathEntity path,
      required final int countPerPage}) = _$PagginatedAlbumImpl;

  @override
  AssetPathEntity get path;
  @override
  int get countPerPage;
  @override
  @JsonKey(ignore: true)
  _$$PagginatedAlbumImplCopyWith<_$PagginatedAlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
