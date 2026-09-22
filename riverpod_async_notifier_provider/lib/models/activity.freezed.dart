// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Activity implements DiagnosticableTreeMixin {

 String get activity; double get availability; String get type; int get participants; double get price; String get accessibility; String get duration; bool get kidFriendly; String get link; String get key;
/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityCopyWith<Activity> get copyWith => _$ActivityCopyWithImpl<Activity>(this as Activity, _$identity);

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Activity;
  properties
    ..add(DiagnosticsProperty('type', 'Activity'))
    ..add(DiagnosticsProperty('activity', _this.activity))..add(DiagnosticsProperty('availability', _this.availability))..add(DiagnosticsProperty('type', _this.type))..add(DiagnosticsProperty('participants', _this.participants))..add(DiagnosticsProperty('price', _this.price))..add(DiagnosticsProperty('accessibility', _this.accessibility))..add(DiagnosticsProperty('duration', _this.duration))..add(DiagnosticsProperty('kidFriendly', _this.kidFriendly))..add(DiagnosticsProperty('link', _this.link))..add(DiagnosticsProperty('key', _this.key));
}

@override
bool operator ==(Object other) {
  final _this = this as Activity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Activity&&(identical(other.activity, _this.activity) || other.activity == _this.activity)&&(identical(other.availability, _this.availability) || other.availability == _this.availability)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.participants, _this.participants) || other.participants == _this.participants)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.accessibility, _this.accessibility) || other.accessibility == _this.accessibility)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.kidFriendly, _this.kidFriendly) || other.kidFriendly == _this.kidFriendly)&&(identical(other.link, _this.link) || other.link == _this.link)&&(identical(other.key, _this.key) || other.key == _this.key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Activity;
  return Object.hash(runtimeType,_this.activity,_this.availability,_this.type,_this.participants,_this.price,_this.accessibility,_this.duration,_this.kidFriendly,_this.link,_this.key);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Activity;
  return 'Activity(activity: ${_this.activity}, availability: ${_this.availability}, type: ${_this.type}, participants: ${_this.participants}, price: ${_this.price}, accessibility: ${_this.accessibility}, duration: ${_this.duration}, kidFriendly: ${_this.kidFriendly}, link: ${_this.link}, key: ${_this.key})';
}


}

/// @nodoc
abstract mixin class $ActivityCopyWith<$Res>  {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) _then) = _$ActivityCopyWithImpl;
@useResult
$Res call({
 String activity, double availability, String type, int participants, double price, String accessibility, String duration, bool kidFriendly, String link, String key
});




}
/// @nodoc
class _$ActivityCopyWithImpl<$Res>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._self, this._then);

  final Activity _self;
  final $Res Function(Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activity = null,Object? availability = null,Object? type = null,Object? participants = null,Object? price = null,Object? accessibility = null,Object? duration = null,Object? kidFriendly = null,Object? link = null,Object? key = null,}) {
  return _then(Activity(
activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,accessibility: null == accessibility ? _self.accessibility : accessibility // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,kidFriendly: null == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Activity].
extension ActivityPatterns on Activity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Activity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Activity value)  $default,){
final _that = this;
switch (_that) {
case _Activity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Activity value)?  $default,){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String activity,  double availability,  String type,  int participants,  double price,  String accessibility,  String duration,  bool kidFriendly,  String link,  String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.activity,_that.availability,_that.type,_that.participants,_that.price,_that.accessibility,_that.duration,_that.kidFriendly,_that.link,_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String activity,  double availability,  String type,  int participants,  double price,  String accessibility,  String duration,  bool kidFriendly,  String link,  String key)  $default,) {final _that = this;
switch (_that) {
case _Activity():
return $default(_that.activity,_that.availability,_that.type,_that.participants,_that.price,_that.accessibility,_that.duration,_that.kidFriendly,_that.link,_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String activity,  double availability,  String type,  int participants,  double price,  String accessibility,  String duration,  bool kidFriendly,  String link,  String key)?  $default,) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.activity,_that.availability,_that.type,_that.participants,_that.price,_that.accessibility,_that.duration,_that.kidFriendly,_that.link,_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Activity with DiagnosticableTreeMixin implements Activity {
  const _Activity({required this.activity, required this.availability, required this.type, required this.participants, required this.price, required this.accessibility, required this.duration, required this.kidFriendly, required this.link, required this.key});
  factory _Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

@override final  String activity;
@override final  double availability;
@override final  String type;
@override final  int participants;
@override final  double price;
@override final  String accessibility;
@override final  String duration;
@override final  bool kidFriendly;
@override final  String link;
@override final  String key;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityCopyWith<_Activity> get copyWith => __$ActivityCopyWithImpl<_Activity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Activity'))
    ..add(DiagnosticsProperty('activity', activity))..add(DiagnosticsProperty('availability', availability))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('participants', participants))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('accessibility', accessibility))..add(DiagnosticsProperty('duration', duration))..add(DiagnosticsProperty('kidFriendly', kidFriendly))..add(DiagnosticsProperty('link', link))..add(DiagnosticsProperty('key', key));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Activity&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.type, type) || other.type == type)&&(identical(other.participants, participants) || other.participants == participants)&&(identical(other.price, price) || other.price == price)&&(identical(other.accessibility, accessibility) || other.accessibility == accessibility)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.link, link) || other.link == link)&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,activity,availability,type,participants,price,accessibility,duration,kidFriendly,link,key);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Activity(activity: $activity, availability: $availability, type: $type, participants: $participants, price: $price, accessibility: $accessibility, duration: $duration, kidFriendly: $kidFriendly, link: $link, key: $key)';
}


}

/// @nodoc
abstract mixin class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) _then) = __$ActivityCopyWithImpl;
@override @useResult
$Res call({
 String activity, double availability, String type, int participants, double price, String accessibility, String duration, bool kidFriendly, String link, String key
});




}
/// @nodoc
class __$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(this._self, this._then);

  final _Activity _self;
  final $Res Function(_Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activity = null,Object? availability = null,Object? type = null,Object? participants = null,Object? price = null,Object? accessibility = null,Object? duration = null,Object? kidFriendly = null,Object? link = null,Object? key = null,}) {
  return _then(_Activity(
activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,accessibility: null == accessibility ? _self.accessibility : accessibility // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,kidFriendly: null == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
