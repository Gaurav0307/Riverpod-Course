// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemListState {

 List<String> get items;
/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemListStateCopyWith<ItemListState> get copyWith => _$ItemListStateCopyWithImpl<ItemListState>(this as ItemListState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ItemListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListState&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as ItemListState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as ItemListState;
  return 'ItemListState(items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $ItemListStateCopyWith<$Res>  {
  factory $ItemListStateCopyWith(ItemListState value, $Res Function(ItemListState) _then) = _$ItemListStateCopyWithImpl;
@useResult
$Res call({
 List<String> items
});




}
/// @nodoc
class _$ItemListStateCopyWithImpl<$Res>
    implements $ItemListStateCopyWith<$Res> {
  _$ItemListStateCopyWithImpl(this._self, this._then);

  final ItemListState _self;
  final $Res Function(ItemListState) _then;

/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(ItemListState(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemListState].
extension ItemListStatePatterns on ItemListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemListState value)  $default,){
final _that = this;
switch (_that) {
case _ItemListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemListState value)?  $default,){
final _that = this;
switch (_that) {
case _ItemListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemListState() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> items)  $default,) {final _that = this;
switch (_that) {
case _ItemListState():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> items)?  $default,) {final _that = this;
switch (_that) {
case _ItemListState() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ItemListState implements ItemListState {
  const _ItemListState({required  List<String> items}): _items = items;
  

 final  List<String> _items;
@override List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemListStateCopyWith<_ItemListState> get copyWith => __$ItemListStateCopyWithImpl<_ItemListState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemListState&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'ItemListState(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ItemListStateCopyWith<$Res> implements $ItemListStateCopyWith<$Res> {
  factory _$ItemListStateCopyWith(_ItemListState value, $Res Function(_ItemListState) _then) = __$ItemListStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> items
});




}
/// @nodoc
class __$ItemListStateCopyWithImpl<$Res>
    implements _$ItemListStateCopyWith<$Res> {
  __$ItemListStateCopyWithImpl(this._self, this._then);

  final _ItemListState _self;
  final $Res Function(_ItemListState) _then;

/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ItemListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
