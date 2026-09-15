// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImmutableCollection implements DiagnosticableTreeMixin {

 List<int> get list;
/// Create a copy of ImmutableCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImmutableCollectionCopyWith<ImmutableCollection> get copyWith => _$ImmutableCollectionCopyWithImpl<ImmutableCollection>(this as ImmutableCollection, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as ImmutableCollection;
  properties
    ..add(DiagnosticsProperty('type', 'ImmutableCollection'))
    ..add(DiagnosticsProperty('list', _this.list));
}

@override
bool operator ==(Object other) {
  final _this = this as ImmutableCollection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImmutableCollection&&const DeepCollectionEquality().equals(other.list, _this.list));
}


@override
int get hashCode {
  final _this = this as ImmutableCollection;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.list));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as ImmutableCollection;
  return 'ImmutableCollection(list: ${_this.list})';
}


}

/// @nodoc
abstract mixin class $ImmutableCollectionCopyWith<$Res>  {
  factory $ImmutableCollectionCopyWith(ImmutableCollection value, $Res Function(ImmutableCollection) _then) = _$ImmutableCollectionCopyWithImpl;
@useResult
$Res call({
 List<int> list
});




}
/// @nodoc
class _$ImmutableCollectionCopyWithImpl<$Res>
    implements $ImmutableCollectionCopyWith<$Res> {
  _$ImmutableCollectionCopyWithImpl(this._self, this._then);

  final ImmutableCollection _self;
  final $Res Function(ImmutableCollection) _then;

/// Create a copy of ImmutableCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(ImmutableCollection(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ImmutableCollection].
extension ImmutableCollectionPatterns on ImmutableCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImmutableCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImmutableCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImmutableCollection value)  $default,){
final _that = this;
switch (_that) {
case _ImmutableCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImmutableCollection value)?  $default,){
final _that = this;
switch (_that) {
case _ImmutableCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImmutableCollection() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> list)  $default,) {final _that = this;
switch (_that) {
case _ImmutableCollection():
return $default(_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> list)?  $default,) {final _that = this;
switch (_that) {
case _ImmutableCollection() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc


class _ImmutableCollection with DiagnosticableTreeMixin implements ImmutableCollection {
   _ImmutableCollection({required  List<int> list}): _list = list;
  

 final  List<int> _list;
@override List<int> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of ImmutableCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImmutableCollectionCopyWith<_ImmutableCollection> get copyWith => __$ImmutableCollectionCopyWithImpl<_ImmutableCollection>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ImmutableCollection'))
    ..add(DiagnosticsProperty('list', list));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImmutableCollection&&const DeepCollectionEquality().equals(other.list, _list));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ImmutableCollection(list: $list)';
}


}

/// @nodoc
abstract mixin class _$ImmutableCollectionCopyWith<$Res> implements $ImmutableCollectionCopyWith<$Res> {
  factory _$ImmutableCollectionCopyWith(_ImmutableCollection value, $Res Function(_ImmutableCollection) _then) = __$ImmutableCollectionCopyWithImpl;
@override @useResult
$Res call({
 List<int> list
});




}
/// @nodoc
class __$ImmutableCollectionCopyWithImpl<$Res>
    implements _$ImmutableCollectionCopyWith<$Res> {
  __$ImmutableCollectionCopyWithImpl(this._self, this._then);

  final _ImmutableCollection _self;
  final $Res Function(_ImmutableCollection) _then;

/// Create a copy of ImmutableCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_ImmutableCollection(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
mixin _$MutableCollection implements DiagnosticableTreeMixin {

 List<int> get list;
/// Create a copy of MutableCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MutableCollectionCopyWith<MutableCollection> get copyWith => _$MutableCollectionCopyWithImpl<MutableCollection>(this as MutableCollection, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as MutableCollection;
  properties
    ..add(DiagnosticsProperty('type', 'MutableCollection'))
    ..add(DiagnosticsProperty('list', _this.list));
}

@override
bool operator ==(Object other) {
  final _this = this as MutableCollection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutableCollection&&const DeepCollectionEquality().equals(other.list, _this.list));
}


@override
int get hashCode {
  final _this = this as MutableCollection;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.list));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as MutableCollection;
  return 'MutableCollection(list: ${_this.list})';
}


}

/// @nodoc
abstract mixin class $MutableCollectionCopyWith<$Res>  {
  factory $MutableCollectionCopyWith(MutableCollection value, $Res Function(MutableCollection) _then) = _$MutableCollectionCopyWithImpl;
@useResult
$Res call({
 List<int> list
});




}
/// @nodoc
class _$MutableCollectionCopyWithImpl<$Res>
    implements $MutableCollectionCopyWith<$Res> {
  _$MutableCollectionCopyWithImpl(this._self, this._then);

  final MutableCollection _self;
  final $Res Function(MutableCollection) _then;

/// Create a copy of MutableCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(MutableCollection(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MutableCollection].
extension MutableCollectionPatterns on MutableCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MutableCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MutableCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MutableCollection value)  $default,){
final _that = this;
switch (_that) {
case _MutableCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MutableCollection value)?  $default,){
final _that = this;
switch (_that) {
case _MutableCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MutableCollection() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> list)  $default,) {final _that = this;
switch (_that) {
case _MutableCollection():
return $default(_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> list)?  $default,) {final _that = this;
switch (_that) {
case _MutableCollection() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc


class _MutableCollection with DiagnosticableTreeMixin implements MutableCollection {
   _MutableCollection({required this.list});
  

@override final  List<int> list;

/// Create a copy of MutableCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MutableCollectionCopyWith<_MutableCollection> get copyWith => __$MutableCollectionCopyWithImpl<_MutableCollection>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'MutableCollection'))
    ..add(DiagnosticsProperty('list', list));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MutableCollection&&const DeepCollectionEquality().equals(other.list, list));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(list));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'MutableCollection(list: $list)';
}


}

/// @nodoc
abstract mixin class _$MutableCollectionCopyWith<$Res> implements $MutableCollectionCopyWith<$Res> {
  factory _$MutableCollectionCopyWith(_MutableCollection value, $Res Function(_MutableCollection) _then) = __$MutableCollectionCopyWithImpl;
@override @useResult
$Res call({
 List<int> list
});




}
/// @nodoc
class __$MutableCollectionCopyWithImpl<$Res>
    implements _$MutableCollectionCopyWith<$Res> {
  __$MutableCollectionCopyWithImpl(this._self, this._then);

  final _MutableCollection _self;
  final $Res Function(_MutableCollection) _then;

/// Create a copy of MutableCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_MutableCollection(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
