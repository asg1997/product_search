// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageSource {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) file,
    required TResult Function(String url) network,
    required TResult Function(String path) asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? file,
    TResult? Function(String url)? network,
    TResult? Function(String path)? asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? file,
    TResult Function(String url)? network,
    TResult Function(String path)? asset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileImageSource value) file,
    required TResult Function(NetworkImageSource value) network,
    required TResult Function(AssetImageSource value) asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileImageSource value)? file,
    TResult? Function(NetworkImageSource value)? network,
    TResult? Function(AssetImageSource value)? asset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileImageSource value)? file,
    TResult Function(NetworkImageSource value)? network,
    TResult Function(AssetImageSource value)? asset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSourceCopyWith<$Res> {
  factory $ImageSourceCopyWith(
          ImageSource value, $Res Function(ImageSource) then) =
      _$ImageSourceCopyWithImpl<$Res, ImageSource>;
}

/// @nodoc
class _$ImageSourceCopyWithImpl<$Res, $Val extends ImageSource>
    implements $ImageSourceCopyWith<$Res> {
  _$ImageSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FileImageSourceImplCopyWith<$Res> {
  factory _$$FileImageSourceImplCopyWith(_$FileImageSourceImpl value,
          $Res Function(_$FileImageSourceImpl) then) =
      __$$FileImageSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$FileImageSourceImplCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res, _$FileImageSourceImpl>
    implements _$$FileImageSourceImplCopyWith<$Res> {
  __$$FileImageSourceImplCopyWithImpl(
      _$FileImageSourceImpl _value, $Res Function(_$FileImageSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$FileImageSourceImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FileImageSourceImpl implements FileImageSource {
  const _$FileImageSourceImpl(this.path);

  @override
  final String path;

  @override
  String toString() {
    return 'ImageSource.file(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileImageSourceImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileImageSourceImplCopyWith<_$FileImageSourceImpl> get copyWith =>
      __$$FileImageSourceImplCopyWithImpl<_$FileImageSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) file,
    required TResult Function(String url) network,
    required TResult Function(String path) asset,
  }) {
    return file(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? file,
    TResult? Function(String url)? network,
    TResult? Function(String path)? asset,
  }) {
    return file?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? file,
    TResult Function(String url)? network,
    TResult Function(String path)? asset,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileImageSource value) file,
    required TResult Function(NetworkImageSource value) network,
    required TResult Function(AssetImageSource value) asset,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileImageSource value)? file,
    TResult? Function(NetworkImageSource value)? network,
    TResult? Function(AssetImageSource value)? asset,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileImageSource value)? file,
    TResult Function(NetworkImageSource value)? network,
    TResult Function(AssetImageSource value)? asset,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }
}

abstract class FileImageSource implements ImageSource {
  const factory FileImageSource(final String path) = _$FileImageSourceImpl;

  String get path;
  @JsonKey(ignore: true)
  _$$FileImageSourceImplCopyWith<_$FileImageSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkImageSourceImplCopyWith<$Res> {
  factory _$$NetworkImageSourceImplCopyWith(_$NetworkImageSourceImpl value,
          $Res Function(_$NetworkImageSourceImpl) then) =
      __$$NetworkImageSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$NetworkImageSourceImplCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res, _$NetworkImageSourceImpl>
    implements _$$NetworkImageSourceImplCopyWith<$Res> {
  __$$NetworkImageSourceImplCopyWithImpl(_$NetworkImageSourceImpl _value,
      $Res Function(_$NetworkImageSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$NetworkImageSourceImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkImageSourceImpl implements NetworkImageSource {
  const _$NetworkImageSourceImpl(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'ImageSource.network(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImageSourceImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImageSourceImplCopyWith<_$NetworkImageSourceImpl> get copyWith =>
      __$$NetworkImageSourceImplCopyWithImpl<_$NetworkImageSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) file,
    required TResult Function(String url) network,
    required TResult Function(String path) asset,
  }) {
    return network(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? file,
    TResult? Function(String url)? network,
    TResult? Function(String path)? asset,
  }) {
    return network?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? file,
    TResult Function(String url)? network,
    TResult Function(String path)? asset,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileImageSource value) file,
    required TResult Function(NetworkImageSource value) network,
    required TResult Function(AssetImageSource value) asset,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileImageSource value)? file,
    TResult? Function(NetworkImageSource value)? network,
    TResult? Function(AssetImageSource value)? asset,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileImageSource value)? file,
    TResult Function(NetworkImageSource value)? network,
    TResult Function(AssetImageSource value)? asset,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkImageSource implements ImageSource {
  const factory NetworkImageSource(final String url) = _$NetworkImageSourceImpl;

  String get url;
  @JsonKey(ignore: true)
  _$$NetworkImageSourceImplCopyWith<_$NetworkImageSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssetImageSourceImplCopyWith<$Res> {
  factory _$$AssetImageSourceImplCopyWith(_$AssetImageSourceImpl value,
          $Res Function(_$AssetImageSourceImpl) then) =
      __$$AssetImageSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$AssetImageSourceImplCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res, _$AssetImageSourceImpl>
    implements _$$AssetImageSourceImplCopyWith<$Res> {
  __$$AssetImageSourceImplCopyWithImpl(_$AssetImageSourceImpl _value,
      $Res Function(_$AssetImageSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$AssetImageSourceImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AssetImageSourceImpl implements AssetImageSource {
  const _$AssetImageSourceImpl(this.path);

  @override
  final String path;

  @override
  String toString() {
    return 'ImageSource.asset(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImageSourceImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImageSourceImplCopyWith<_$AssetImageSourceImpl> get copyWith =>
      __$$AssetImageSourceImplCopyWithImpl<_$AssetImageSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) file,
    required TResult Function(String url) network,
    required TResult Function(String path) asset,
  }) {
    return asset(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? file,
    TResult? Function(String url)? network,
    TResult? Function(String path)? asset,
  }) {
    return asset?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? file,
    TResult Function(String url)? network,
    TResult Function(String path)? asset,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileImageSource value) file,
    required TResult Function(NetworkImageSource value) network,
    required TResult Function(AssetImageSource value) asset,
  }) {
    return asset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileImageSource value)? file,
    TResult? Function(NetworkImageSource value)? network,
    TResult? Function(AssetImageSource value)? asset,
  }) {
    return asset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileImageSource value)? file,
    TResult Function(NetworkImageSource value)? network,
    TResult Function(AssetImageSource value)? asset,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this);
    }
    return orElse();
  }
}

abstract class AssetImageSource implements ImageSource {
  const factory AssetImageSource(final String path) = _$AssetImageSourceImpl;

  String get path;
  @JsonKey(ignore: true)
  _$$AssetImageSourceImplCopyWith<_$AssetImageSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
