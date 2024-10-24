// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AlbumImage {
  File get file => throw _privateConstructorUsedError;
  Uint8List get thumb => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumImageCopyWith<AlbumImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumImageCopyWith<$Res> {
  factory $AlbumImageCopyWith(
          AlbumImage value, $Res Function(AlbumImage) then) =
      _$AlbumImageCopyWithImpl<$Res, AlbumImage>;
  @useResult
  $Res call({File file, Uint8List thumb});
}

/// @nodoc
class _$AlbumImageCopyWithImpl<$Res, $Val extends AlbumImage>
    implements $AlbumImageCopyWith<$Res> {
  _$AlbumImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? thumb = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumImageImplCopyWith<$Res>
    implements $AlbumImageCopyWith<$Res> {
  factory _$$AlbumImageImplCopyWith(
          _$AlbumImageImpl value, $Res Function(_$AlbumImageImpl) then) =
      __$$AlbumImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File file, Uint8List thumb});
}

/// @nodoc
class __$$AlbumImageImplCopyWithImpl<$Res>
    extends _$AlbumImageCopyWithImpl<$Res, _$AlbumImageImpl>
    implements _$$AlbumImageImplCopyWith<$Res> {
  __$$AlbumImageImplCopyWithImpl(
      _$AlbumImageImpl _value, $Res Function(_$AlbumImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? thumb = null,
  }) {
    return _then(_$AlbumImageImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$AlbumImageImpl extends _AlbumImage with DiagnosticableTreeMixin {
  const _$AlbumImageImpl({required this.file, required this.thumb}) : super._();

  @override
  final File file;
  @override
  final Uint8List thumb;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlbumImage(file: $file, thumb: $thumb)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlbumImage'))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('thumb', thumb));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumImageImpl &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality().equals(other.thumb, thumb));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, file, const DeepCollectionEquality().hash(thumb));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumImageImplCopyWith<_$AlbumImageImpl> get copyWith =>
      __$$AlbumImageImplCopyWithImpl<_$AlbumImageImpl>(this, _$identity);
}

abstract class _AlbumImage extends AlbumImage {
  const factory _AlbumImage(
      {required final File file,
      required final Uint8List thumb}) = _$AlbumImageImpl;
  const _AlbumImage._() : super._();

  @override
  File get file;
  @override
  Uint8List get thumb;
  @override
  @JsonKey(ignore: true)
  _$$AlbumImageImplCopyWith<_$AlbumImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
