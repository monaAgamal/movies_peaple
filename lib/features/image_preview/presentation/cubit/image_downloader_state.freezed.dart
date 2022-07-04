// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_downloader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageDownloaderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() downloading,
    required TResult Function(String errorMsg) error,
    required TResult Function(bool isSuccessful) imageDownloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Downloading value) downloading,
    required TResult Function(Error value) error,
    required TResult Function(ImageDownloaded value) imageDownloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDownloaderStateCopyWith<$Res> {
  factory $ImageDownloaderStateCopyWith(ImageDownloaderState value,
          $Res Function(ImageDownloaderState) then) =
      _$ImageDownloaderStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageDownloaderStateCopyWithImpl<$Res>
    implements $ImageDownloaderStateCopyWith<$Res> {
  _$ImageDownloaderStateCopyWithImpl(this._value, this._then);

  final ImageDownloaderState _value;
  // ignore: unused_field
  final $Res Function(ImageDownloaderState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ImageDownloaderStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ImageDownloaderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() downloading,
    required TResult Function(String errorMsg) error,
    required TResult Function(bool isSuccessful) imageDownloaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Downloading value) downloading,
    required TResult Function(Error value) error,
    required TResult Function(ImageDownloaded value) imageDownloaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ImageDownloaderState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$DownloadingCopyWith<$Res> {
  factory _$$DownloadingCopyWith(
          _$Downloading value, $Res Function(_$Downloading) then) =
      __$$DownloadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadingCopyWithImpl<$Res>
    extends _$ImageDownloaderStateCopyWithImpl<$Res>
    implements _$$DownloadingCopyWith<$Res> {
  __$$DownloadingCopyWithImpl(
      _$Downloading _value, $Res Function(_$Downloading) _then)
      : super(_value, (v) => _then(v as _$Downloading));

  @override
  _$Downloading get _value => super._value as _$Downloading;
}

/// @nodoc

class _$Downloading implements Downloading {
  const _$Downloading();

  @override
  String toString() {
    return 'ImageDownloaderState.downloading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Downloading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() downloading,
    required TResult Function(String errorMsg) error,
    required TResult Function(bool isSuccessful) imageDownloaded,
  }) {
    return downloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
  }) {
    return downloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Downloading value) downloading,
    required TResult Function(Error value) error,
    required TResult Function(ImageDownloaded value) imageDownloaded,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }
}

abstract class Downloading implements ImageDownloaderState {
  const factory Downloading() = _$Downloading;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  $Res call({String errorMsg});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$ImageDownloaderStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$Error(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'ImageDownloaderState.error(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() downloading,
    required TResult Function(String errorMsg) error,
    required TResult Function(bool isSuccessful) imageDownloaded,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Downloading value) downloading,
    required TResult Function(Error value) error,
    required TResult Function(ImageDownloaded value) imageDownloaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ImageDownloaderState {
  const factory Error({required final String errorMsg}) = _$Error;

  String get errorMsg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageDownloadedCopyWith<$Res> {
  factory _$$ImageDownloadedCopyWith(
          _$ImageDownloaded value, $Res Function(_$ImageDownloaded) then) =
      __$$ImageDownloadedCopyWithImpl<$Res>;
  $Res call({bool isSuccessful});
}

/// @nodoc
class __$$ImageDownloadedCopyWithImpl<$Res>
    extends _$ImageDownloaderStateCopyWithImpl<$Res>
    implements _$$ImageDownloadedCopyWith<$Res> {
  __$$ImageDownloadedCopyWithImpl(
      _$ImageDownloaded _value, $Res Function(_$ImageDownloaded) _then)
      : super(_value, (v) => _then(v as _$ImageDownloaded));

  @override
  _$ImageDownloaded get _value => super._value as _$ImageDownloaded;

  @override
  $Res call({
    Object? isSuccessful = freezed,
  }) {
    return _then(_$ImageDownloaded(
      isSuccessful: isSuccessful == freezed
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ImageDownloaded implements ImageDownloaded {
  const _$ImageDownloaded({required this.isSuccessful});

  @override
  final bool isSuccessful;

  @override
  String toString() {
    return 'ImageDownloaderState.imageDownloaded(isSuccessful: $isSuccessful)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDownloaded &&
            const DeepCollectionEquality()
                .equals(other.isSuccessful, isSuccessful));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isSuccessful));

  @JsonKey(ignore: true)
  @override
  _$$ImageDownloadedCopyWith<_$ImageDownloaded> get copyWith =>
      __$$ImageDownloadedCopyWithImpl<_$ImageDownloaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() downloading,
    required TResult Function(String errorMsg) error,
    required TResult Function(bool isSuccessful) imageDownloaded,
  }) {
    return imageDownloaded(isSuccessful);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
  }) {
    return imageDownloaded?.call(isSuccessful);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? downloading,
    TResult Function(String errorMsg)? error,
    TResult Function(bool isSuccessful)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (imageDownloaded != null) {
      return imageDownloaded(isSuccessful);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Downloading value) downloading,
    required TResult Function(Error value) error,
    required TResult Function(ImageDownloaded value) imageDownloaded,
  }) {
    return imageDownloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
  }) {
    return imageDownloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Downloading value)? downloading,
    TResult Function(Error value)? error,
    TResult Function(ImageDownloaded value)? imageDownloaded,
    required TResult orElse(),
  }) {
    if (imageDownloaded != null) {
      return imageDownloaded(this);
    }
    return orElse();
  }
}

abstract class ImageDownloaded implements ImageDownloaderState {
  const factory ImageDownloaded({required final bool isSuccessful}) =
      _$ImageDownloaded;

  bool get isSuccessful => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ImageDownloadedCopyWith<_$ImageDownloaded> get copyWith =>
      throw _privateConstructorUsedError;
}
