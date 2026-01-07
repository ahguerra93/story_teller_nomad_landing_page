// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_media_gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SingleMediaGalleryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleMediaGalleryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SingleMediaGalleryState()';
}


}

/// @nodoc
class $SingleMediaGalleryStateCopyWith<$Res>  {
$SingleMediaGalleryStateCopyWith(SingleMediaGalleryState _, $Res Function(SingleMediaGalleryState) __);
}


/// Adds pattern-matching-related methods to [SingleMediaGalleryState].
extension SingleMediaGalleryStatePatterns on SingleMediaGalleryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Error():
return error(_that);case _Success():
return success(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<MediaItem> mediaItems)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Success() when success != null:
return success(_that.mediaItems);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<MediaItem> mediaItems)  success,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Error():
return error(_that.message);case _Success():
return success(_that.mediaItems);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<MediaItem> mediaItems)?  success,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Success() when success != null:
return success(_that.mediaItems);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements SingleMediaGalleryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SingleMediaGalleryState.loading()';
}


}




/// @nodoc


class _Error implements SingleMediaGalleryState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of SingleMediaGalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SingleMediaGalleryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SingleMediaGalleryStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SingleMediaGalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Success implements SingleMediaGalleryState {
  const _Success(final  List<MediaItem> mediaItems): _mediaItems = mediaItems;
  

 final  List<MediaItem> _mediaItems;
 List<MediaItem> get mediaItems {
  if (_mediaItems is EqualUnmodifiableListView) return _mediaItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaItems);
}


/// Create a copy of SingleMediaGalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._mediaItems, _mediaItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mediaItems));

@override
String toString() {
  return 'SingleMediaGalleryState.success(mediaItems: $mediaItems)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $SingleMediaGalleryStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<MediaItem> mediaItems
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of SingleMediaGalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mediaItems = null,}) {
  return _then(_Success(
null == mediaItems ? _self._mediaItems : mediaItems // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,
  ));
}


}

// dart format on
