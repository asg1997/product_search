// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchInput {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filePath) file,
    required TResult Function(String url) url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filePath)? file,
    TResult? Function(String url)? url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filePath)? file,
    TResult Function(String url)? url,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileSearchInput value) file,
    required TResult Function(UrlSearchInput value) url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileSearchInput value)? file,
    TResult? Function(UrlSearchInput value)? url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileSearchInput value)? file,
    TResult Function(UrlSearchInput value)? url,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchInputCopyWith<$Res> {
  factory $SearchInputCopyWith(
          SearchInput value, $Res Function(SearchInput) then) =
      _$SearchInputCopyWithImpl<$Res, SearchInput>;
}

/// @nodoc
class _$SearchInputCopyWithImpl<$Res, $Val extends SearchInput>
    implements $SearchInputCopyWith<$Res> {
  _$SearchInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FileSearchInputImplCopyWith<$Res> {
  factory _$$FileSearchInputImplCopyWith(_$FileSearchInputImpl value,
          $Res Function(_$FileSearchInputImpl) then) =
      __$$FileSearchInputImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$FileSearchInputImplCopyWithImpl<$Res>
    extends _$SearchInputCopyWithImpl<$Res, _$FileSearchInputImpl>
    implements _$$FileSearchInputImplCopyWith<$Res> {
  __$$FileSearchInputImplCopyWithImpl(
      _$FileSearchInputImpl _value, $Res Function(_$FileSearchInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$FileSearchInputImpl(
      null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FileSearchInputImpl extends FileSearchInput {
  const _$FileSearchInputImpl(this.filePath) : super._();

  @override
  final String filePath;

  @override
  String toString() {
    return 'SearchInput.file(filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileSearchInputImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileSearchInputImplCopyWith<_$FileSearchInputImpl> get copyWith =>
      __$$FileSearchInputImplCopyWithImpl<_$FileSearchInputImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filePath) file,
    required TResult Function(String url) url,
  }) {
    return file(filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filePath)? file,
    TResult? Function(String url)? url,
  }) {
    return file?.call(filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filePath)? file,
    TResult Function(String url)? url,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileSearchInput value) file,
    required TResult Function(UrlSearchInput value) url,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileSearchInput value)? file,
    TResult? Function(UrlSearchInput value)? url,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileSearchInput value)? file,
    TResult Function(UrlSearchInput value)? url,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }
}

abstract class FileSearchInput extends SearchInput {
  const factory FileSearchInput(final String filePath) = _$FileSearchInputImpl;
  const FileSearchInput._() : super._();

  String get filePath;
  @JsonKey(ignore: true)
  _$$FileSearchInputImplCopyWith<_$FileSearchInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UrlSearchInputImplCopyWith<$Res> {
  factory _$$UrlSearchInputImplCopyWith(_$UrlSearchInputImpl value,
          $Res Function(_$UrlSearchInputImpl) then) =
      __$$UrlSearchInputImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$UrlSearchInputImplCopyWithImpl<$Res>
    extends _$SearchInputCopyWithImpl<$Res, _$UrlSearchInputImpl>
    implements _$$UrlSearchInputImplCopyWith<$Res> {
  __$$UrlSearchInputImplCopyWithImpl(
      _$UrlSearchInputImpl _value, $Res Function(_$UrlSearchInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$UrlSearchInputImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UrlSearchInputImpl extends UrlSearchInput {
  const _$UrlSearchInputImpl(this.url) : super._();

  @override
  final String url;

  @override
  String toString() {
    return 'SearchInput.url(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UrlSearchInputImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UrlSearchInputImplCopyWith<_$UrlSearchInputImpl> get copyWith =>
      __$$UrlSearchInputImplCopyWithImpl<_$UrlSearchInputImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filePath) file,
    required TResult Function(String url) url,
  }) {
    return url(this.url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filePath)? file,
    TResult? Function(String url)? url,
  }) {
    return url?.call(this.url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filePath)? file,
    TResult Function(String url)? url,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this.url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileSearchInput value) file,
    required TResult Function(UrlSearchInput value) url,
  }) {
    return url(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileSearchInput value)? file,
    TResult? Function(UrlSearchInput value)? url,
  }) {
    return url?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileSearchInput value)? file,
    TResult Function(UrlSearchInput value)? url,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this);
    }
    return orElse();
  }
}

abstract class UrlSearchInput extends SearchInput {
  const factory UrlSearchInput(final String url) = _$UrlSearchInputImpl;
  const UrlSearchInput._() : super._();

  String get url;
  @JsonKey(ignore: true)
  _$$UrlSearchInputImplCopyWith<_$UrlSearchInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
