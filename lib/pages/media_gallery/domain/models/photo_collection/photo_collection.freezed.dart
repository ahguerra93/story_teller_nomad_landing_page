// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoCollection {

 List<MediaItem> get commercial; List<MediaItem> get personal;
/// Create a copy of PhotoCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCollectionCopyWith<PhotoCollection> get copyWith => _$PhotoCollectionCopyWithImpl<PhotoCollection>(this as PhotoCollection, _$identity);

  /// Serializes this PhotoCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoCollection&&const DeepCollectionEquality().equals(other.commercial, commercial)&&const DeepCollectionEquality().equals(other.personal, personal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(commercial),const DeepCollectionEquality().hash(personal));

@override
String toString() {
  return 'PhotoCollection(commercial: $commercial, personal: $personal)';
}


}

/// @nodoc
abstract mixin class $PhotoCollectionCopyWith<$Res>  {
  factory $PhotoCollectionCopyWith(PhotoCollection value, $Res Function(PhotoCollection) _then) = _$PhotoCollectionCopyWithImpl;
@useResult
$Res call({
 List<MediaItem> commercial, List<MediaItem> personal
});




}
/// @nodoc
class _$PhotoCollectionCopyWithImpl<$Res>
    implements $PhotoCollectionCopyWith<$Res> {
  _$PhotoCollectionCopyWithImpl(this._self, this._then);

  final PhotoCollection _self;
  final $Res Function(PhotoCollection) _then;

/// Create a copy of PhotoCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commercial = null,Object? personal = null,}) {
  return _then(_self.copyWith(
commercial: null == commercial ? _self.commercial : commercial // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,personal: null == personal ? _self.personal : personal // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoCollection].
extension PhotoCollectionPatterns on PhotoCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoCollection value)  $default,){
final _that = this;
switch (_that) {
case _PhotoCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoCollection value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MediaItem> commercial,  List<MediaItem> personal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoCollection() when $default != null:
return $default(_that.commercial,_that.personal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MediaItem> commercial,  List<MediaItem> personal)  $default,) {final _that = this;
switch (_that) {
case _PhotoCollection():
return $default(_that.commercial,_that.personal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MediaItem> commercial,  List<MediaItem> personal)?  $default,) {final _that = this;
switch (_that) {
case _PhotoCollection() when $default != null:
return $default(_that.commercial,_that.personal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoCollection extends PhotoCollection {
  const _PhotoCollection({final  List<MediaItem> commercial = const [], final  List<MediaItem> personal = const []}): _commercial = commercial,_personal = personal,super._();
  factory _PhotoCollection.fromJson(Map<String, dynamic> json) => _$PhotoCollectionFromJson(json);

 final  List<MediaItem> _commercial;
@override@JsonKey() List<MediaItem> get commercial {
  if (_commercial is EqualUnmodifiableListView) return _commercial;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commercial);
}

 final  List<MediaItem> _personal;
@override@JsonKey() List<MediaItem> get personal {
  if (_personal is EqualUnmodifiableListView) return _personal;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personal);
}


/// Create a copy of PhotoCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCollectionCopyWith<_PhotoCollection> get copyWith => __$PhotoCollectionCopyWithImpl<_PhotoCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoCollection&&const DeepCollectionEquality().equals(other._commercial, _commercial)&&const DeepCollectionEquality().equals(other._personal, _personal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_commercial),const DeepCollectionEquality().hash(_personal));

@override
String toString() {
  return 'PhotoCollection(commercial: $commercial, personal: $personal)';
}


}

/// @nodoc
abstract mixin class _$PhotoCollectionCopyWith<$Res> implements $PhotoCollectionCopyWith<$Res> {
  factory _$PhotoCollectionCopyWith(_PhotoCollection value, $Res Function(_PhotoCollection) _then) = __$PhotoCollectionCopyWithImpl;
@override @useResult
$Res call({
 List<MediaItem> commercial, List<MediaItem> personal
});




}
/// @nodoc
class __$PhotoCollectionCopyWithImpl<$Res>
    implements _$PhotoCollectionCopyWith<$Res> {
  __$PhotoCollectionCopyWithImpl(this._self, this._then);

  final _PhotoCollection _self;
  final $Res Function(_PhotoCollection) _then;

/// Create a copy of PhotoCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commercial = null,Object? personal = null,}) {
  return _then(_PhotoCollection(
commercial: null == commercial ? _self._commercial : commercial // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,personal: null == personal ? _self._personal : personal // ignore: cast_nullable_to_non_nullable
as List<MediaItem>,
  ));
}


}

// dart format on
