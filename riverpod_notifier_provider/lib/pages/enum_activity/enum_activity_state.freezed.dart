// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enum_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnumActivityState implements DiagnosticableTreeMixin {

 ActivityStatus get status; Activity get activity; String get error;
/// Create a copy of EnumActivityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnumActivityStateCopyWith<EnumActivityState> get copyWith => _$EnumActivityStateCopyWithImpl<EnumActivityState>(this as EnumActivityState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as EnumActivityState;
  properties
    ..add(DiagnosticsProperty('type', 'EnumActivityState'))
    ..add(DiagnosticsProperty('status', _this.status))..add(DiagnosticsProperty('activity', _this.activity))..add(DiagnosticsProperty('error', _this.error));
}

@override
bool operator ==(Object other) {
  final _this = this as EnumActivityState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnumActivityState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.activity, _this.activity) || other.activity == _this.activity)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as EnumActivityState;
  return Object.hash(runtimeType,_this.status,_this.activity,_this.error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as EnumActivityState;
  return 'EnumActivityState(status: ${_this.status}, activity: ${_this.activity}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $EnumActivityStateCopyWith<$Res>  {
  factory $EnumActivityStateCopyWith(EnumActivityState value, $Res Function(EnumActivityState) _then) = _$EnumActivityStateCopyWithImpl;
@useResult
$Res call({
 ActivityStatus status, Activity activity, String error
});


$ActivityCopyWith<$Res> get activity;

}
/// @nodoc
class _$EnumActivityStateCopyWithImpl<$Res>
    implements $EnumActivityStateCopyWith<$Res> {
  _$EnumActivityStateCopyWithImpl(this._self, this._then);

  final EnumActivityState _self;
  final $Res Function(EnumActivityState) _then;

/// Create a copy of EnumActivityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? activity = null,Object? error = null,}) {
  return _then(EnumActivityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ActivityStatus,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as Activity,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of EnumActivityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityCopyWith<$Res> get activity {
  
  return $ActivityCopyWith<$Res>(_self.activity, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}


/// Adds pattern-matching-related methods to [EnumActivityState].
extension EnumActivityStatePatterns on EnumActivityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnumActivityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnumActivityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnumActivityState value)  $default,){
final _that = this;
switch (_that) {
case _EnumActivityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnumActivityState value)?  $default,){
final _that = this;
switch (_that) {
case _EnumActivityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivityStatus status,  Activity activity,  String error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnumActivityState() when $default != null:
return $default(_that.status,_that.activity,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivityStatus status,  Activity activity,  String error)  $default,) {final _that = this;
switch (_that) {
case _EnumActivityState():
return $default(_that.status,_that.activity,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivityStatus status,  Activity activity,  String error)?  $default,) {final _that = this;
switch (_that) {
case _EnumActivityState() when $default != null:
return $default(_that.status,_that.activity,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EnumActivityState with DiagnosticableTreeMixin implements EnumActivityState {
  const _EnumActivityState({required this.status, required this.activity, required this.error});
  

@override final  ActivityStatus status;
@override final  Activity activity;
@override final  String error;

/// Create a copy of EnumActivityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnumActivityStateCopyWith<_EnumActivityState> get copyWith => __$EnumActivityStateCopyWithImpl<_EnumActivityState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'EnumActivityState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('activity', activity))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnumActivityState&&(identical(other.status, status) || other.status == status)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,activity,error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'EnumActivityState(status: $status, activity: $activity, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EnumActivityStateCopyWith<$Res> implements $EnumActivityStateCopyWith<$Res> {
  factory _$EnumActivityStateCopyWith(_EnumActivityState value, $Res Function(_EnumActivityState) _then) = __$EnumActivityStateCopyWithImpl;
@override @useResult
$Res call({
 ActivityStatus status, Activity activity, String error
});


@override $ActivityCopyWith<$Res> get activity;

}
/// @nodoc
class __$EnumActivityStateCopyWithImpl<$Res>
    implements _$EnumActivityStateCopyWith<$Res> {
  __$EnumActivityStateCopyWithImpl(this._self, this._then);

  final _EnumActivityState _self;
  final $Res Function(_EnumActivityState) _then;

/// Create a copy of EnumActivityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? activity = null,Object? error = null,}) {
  return _then(_EnumActivityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ActivityStatus,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as Activity,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EnumActivityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityCopyWith<$Res> get activity {
  
  return $ActivityCopyWith<$Res>(_self.activity, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}

// dart format on
