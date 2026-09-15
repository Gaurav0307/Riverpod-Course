// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Method implements DiagnosticableTreeMixin {

 String get method; double? get version;
/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MethodCopyWith<Method> get copyWith => _$MethodCopyWithImpl<Method>(this as Method, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Method;
  properties
    ..add(DiagnosticsProperty('type', 'Method'))
    ..add(DiagnosticsProperty('method', _this.method))..add(DiagnosticsProperty('version', _this.version));
}

@override
bool operator ==(Object other) {
  final _this = this as Method;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Method&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.version, _this.version) || other.version == _this.version));
}


@override
int get hashCode {
  final _this = this as Method;
  return Object.hash(runtimeType,_this.method,_this.version);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Method;
  return 'Method(method: ${_this.method}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $MethodCopyWith<$Res>  {
  factory $MethodCopyWith(Method value, $Res Function(Method) _then) = _$MethodCopyWithImpl;
@useResult
$Res call({
 String method, double? version
});




}
/// @nodoc
class _$MethodCopyWithImpl<$Res>
    implements $MethodCopyWith<$Res> {
  _$MethodCopyWithImpl(this._self, this._then);

  final Method _self;
  final $Res Function(Method) _then;

/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? version = freezed,}) {
  return _then(Method(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Method].
extension MethodPatterns on Method {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Method value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Method() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Method value)  $default,){
final _that = this;
switch (_that) {
case _Method():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Method value)?  $default,){
final _that = this;
switch (_that) {
case _Method() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  double? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Method() when $default != null:
return $default(_that.method,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  double? version)  $default,) {final _that = this;
switch (_that) {
case _Method():
return $default(_that.method,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  double? version)?  $default,) {final _that = this;
switch (_that) {
case _Method() when $default != null:
return $default(_that.method,_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _Method extends Method with DiagnosticableTreeMixin {
   _Method(this.method, {this.version}): super._();
  

@override final  String method;
@override final  double? version;

/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MethodCopyWith<_Method> get copyWith => __$MethodCopyWithImpl<_Method>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Method'))
    ..add(DiagnosticsProperty('method', method))..add(DiagnosticsProperty('version', version));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Method&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode {
    return Object.hash(runtimeType,method,version);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Method(method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class _$MethodCopyWith<$Res> implements $MethodCopyWith<$Res> {
  factory _$MethodCopyWith(_Method value, $Res Function(_Method) _then) = __$MethodCopyWithImpl;
@override @useResult
$Res call({
 String method, double? version
});




}
/// @nodoc
class __$MethodCopyWithImpl<$Res>
    implements _$MethodCopyWith<$Res> {
  __$MethodCopyWithImpl(this._self, this._then);

  final _Method _self;
  final $Res Function(_Method) _then;

/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? version = freezed,}) {
  return _then(_Method(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
