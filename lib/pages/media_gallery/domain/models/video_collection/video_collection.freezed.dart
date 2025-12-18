// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoCollection {

 List<MediaItem> get videos;
/// Create a copy of VideoCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoCollectionCopyWith<VideoCollection> get copyWith => _$VideoCollectionCopyWithImpl<VideoCollection>(this as VideoCollection, _$identity);

  /// Serializes this VideoCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoCollection&&const DeepCollectionEquality().equals(other.videos, videos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(videos));

@override
String toString() {
  return 'VideoCollection(videos: $videos)';
}


}

/// @nodoc
abstract mixin class $VideoCollectionCopyWith<$Res>  {
  factory $VideoCollectionCopyWith(VideoCollection value, $Res Function(VideoCollection) _then) = _$VideoCollectionCopyWithImpl;
@useResult
$Res call({
 List<MediaItem> videos
});




}
/// @nodoc
class _$VideoCollectionCopyWithImpl<$Res>
    implements $VideoCollectionCopyWith<$Res> {
  _$VideoCollectionCopyWithImpl(this._self, this._then);

  final VideoCollection _self;
  final $Res Function(VideoCollection) _then;

/// Create a copy of VideoCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videos = null,}) {
  return _then(_self.copyWith(
videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoCollection].
extension VideoCollectionPatterns on VideoCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoCollection() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoCollection value)  $default,){
final _that = this;
switch (_that) {
case _VideoCollection():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoCollection value)?  $default,){
final _that = this;
switch (_that) {
case _VideoCollection() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MediaItem> videos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoCollection() when $default != null:
return $default(_that.videos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MediaItem> videos)  $default,) {final _that = this;
switch (_that) {
case _VideoCollection():
return $default(_that.videos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MediaItem> videos)?  $default,) {final _that = this;
switch (_that) {
case _VideoCollection() when $default != null:
return $default(_that.videos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoCollection implements VideoCollection {
   _VideoCollection({final  List<MediaItem> videos = const []}): _videos = videos;
  factory _VideoCollection.fromJson(Map<String, dynamic> json) => _$VideoCollectionFromJson(json);

 final  List<MediaItem> _videos;
@override@JsonKey() List<MediaItem> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}


/// Create a copy of VideoCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoCollectionCopyWith<_VideoCollection> get copyWith => __$VideoCollectionCopyWithImpl<_VideoCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoCollection&&const DeepCollectionEquality().equals(other._videos, _videos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videos));

@override
String toString() {
  return 'VideoCollection(videos: $videos)';
}


}

/// @nodoc
abstract mixin class _$VideoCollectionCopyWith<$Res> implements $VideoCollectionCopyWith<$Res> {
  factory _$VideoCollectionCopyWith(_VideoCollection value, $Res Function(_VideoCollection) _then) = __$VideoCollectionCopyWithImpl;
@override @useResult
$Res call({
 List<MediaItem> videos
});




}
/// @nodoc
class __$VideoCollectionCopyWithImpl<$Res>
    implements _$VideoCollectionCopyWith<$Res> {
  __$VideoCollectionCopyWithImpl(this._self, this._then);

  final _VideoCollection _self;
  final $Res Function(_VideoCollection) _then;

/// Create a copy of VideoCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videos = null,}) {
  return _then(_VideoCollection(
videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,
  ));
}


}

// dart format on
