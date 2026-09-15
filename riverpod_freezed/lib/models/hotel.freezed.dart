// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hotel implements DiagnosticableTreeMixin {

 String get name; int get classification; String get city;@JsonKey(name: 'parking_lot_capacity') int? get parkingLotCapacity; List<Review> get reviews;
/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelCopyWith<Hotel> get copyWith => _$HotelCopyWithImpl<Hotel>(this as Hotel, _$identity);

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Hotel;
  properties
    ..add(DiagnosticsProperty('type', 'Hotel'))
    ..add(DiagnosticsProperty('name', _this.name))..add(DiagnosticsProperty('classification', _this.classification))..add(DiagnosticsProperty('city', _this.city))..add(DiagnosticsProperty('parkingLotCapacity', _this.parkingLotCapacity))..add(DiagnosticsProperty('reviews', _this.reviews));
}

@override
bool operator ==(Object other) {
  final _this = this as Hotel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hotel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.classification, _this.classification) || other.classification == _this.classification)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.parkingLotCapacity, _this.parkingLotCapacity) || other.parkingLotCapacity == _this.parkingLotCapacity)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Hotel;
  return Object.hash(runtimeType,_this.name,_this.classification,_this.city,_this.parkingLotCapacity,const DeepCollectionEquality().hash(_this.reviews));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Hotel;
  return 'Hotel(name: ${_this.name}, classification: ${_this.classification}, city: ${_this.city}, parkingLotCapacity: ${_this.parkingLotCapacity}, reviews: ${_this.reviews})';
}


}

/// @nodoc
abstract mixin class $HotelCopyWith<$Res>  {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) _then) = _$HotelCopyWithImpl;
@useResult
$Res call({
 String name, int classification, String city,@JsonKey(name: 'parking_lot_capacity') int? parkingLotCapacity, List<Review> reviews
});




}
/// @nodoc
class _$HotelCopyWithImpl<$Res>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._self, this._then);

  final Hotel _self;
  final $Res Function(Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? classification = null,Object? city = null,Object? parkingLotCapacity = freezed,Object? reviews = null,}) {
  return _then(Hotel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,parkingLotCapacity: freezed == parkingLotCapacity ? _self.parkingLotCapacity : parkingLotCapacity // ignore: cast_nullable_to_non_nullable
as int?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,
  ));
}

}


/// Adds pattern-matching-related methods to [Hotel].
extension HotelPatterns on Hotel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hotel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hotel value)  $default,){
final _that = this;
switch (_that) {
case _Hotel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hotel value)?  $default,){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int classification,  String city, @JsonKey(name: 'parking_lot_capacity')  int? parkingLotCapacity,  List<Review> reviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.name,_that.classification,_that.city,_that.parkingLotCapacity,_that.reviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int classification,  String city, @JsonKey(name: 'parking_lot_capacity')  int? parkingLotCapacity,  List<Review> reviews)  $default,) {final _that = this;
switch (_that) {
case _Hotel():
return $default(_that.name,_that.classification,_that.city,_that.parkingLotCapacity,_that.reviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int classification,  String city, @JsonKey(name: 'parking_lot_capacity')  int? parkingLotCapacity,  List<Review> reviews)?  $default,) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.name,_that.classification,_that.city,_that.parkingLotCapacity,_that.reviews);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Hotel with DiagnosticableTreeMixin implements Hotel {
   _Hotel({required this.name, required this.classification, required this.city, @JsonKey(name: 'parking_lot_capacity') this.parkingLotCapacity,  List<Review> reviews = const <Review>[]}): _reviews = reviews;
  factory _Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

@override final  String name;
@override final  int classification;
@override final  String city;
@override@JsonKey(name: 'parking_lot_capacity') final  int? parkingLotCapacity;
 final  List<Review> _reviews;
@override@JsonKey() List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}


/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelCopyWith<_Hotel> get copyWith => __$HotelCopyWithImpl<_Hotel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Hotel'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('classification', classification))..add(DiagnosticsProperty('city', city))..add(DiagnosticsProperty('parkingLotCapacity', parkingLotCapacity))..add(DiagnosticsProperty('reviews', reviews));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hotel&&(identical(other.name, name) || other.name == name)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.city, city) || other.city == city)&&(identical(other.parkingLotCapacity, parkingLotCapacity) || other.parkingLotCapacity == parkingLotCapacity)&&const DeepCollectionEquality().equals(other.reviews, _reviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,classification,city,parkingLotCapacity,const DeepCollectionEquality().hash(_reviews));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Hotel(name: $name, classification: $classification, city: $city, parkingLotCapacity: $parkingLotCapacity, reviews: $reviews)';
}


}

/// @nodoc
abstract mixin class _$HotelCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$HotelCopyWith(_Hotel value, $Res Function(_Hotel) _then) = __$HotelCopyWithImpl;
@override @useResult
$Res call({
 String name, int classification, String city,@JsonKey(name: 'parking_lot_capacity') int? parkingLotCapacity, List<Review> reviews
});




}
/// @nodoc
class __$HotelCopyWithImpl<$Res>
    implements _$HotelCopyWith<$Res> {
  __$HotelCopyWithImpl(this._self, this._then);

  final _Hotel _self;
  final $Res Function(_Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? classification = null,Object? city = null,Object? parkingLotCapacity = freezed,Object? reviews = null,}) {
  return _then(_Hotel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,parkingLotCapacity: freezed == parkingLotCapacity ? _self.parkingLotCapacity : parkingLotCapacity // ignore: cast_nullable_to_non_nullable
as int?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,
  ));
}


}


/// @nodoc
mixin _$Review implements DiagnosticableTreeMixin {

 double get score; String? get review;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Review;
  properties
    ..add(DiagnosticsProperty('type', 'Review'))
    ..add(DiagnosticsProperty('score', _this.score))..add(DiagnosticsProperty('review', _this.review));
}

@override
bool operator ==(Object other) {
  final _this = this as Review;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.review, _this.review) || other.review == _this.review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Review;
  return Object.hash(runtimeType,_this.score,_this.review);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Review;
  return 'Review(score: ${_this.score}, review: ${_this.review})';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 double score, String? review
});




}
/// @nodoc
class _$ReviewCopyWithImpl<$Res>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? review = freezed,}) {
  return _then(Review(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Review].
extension ReviewPatterns on Review {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Review value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Review value)  $default,){
final _that = this;
switch (_that) {
case _Review():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Review value)?  $default,){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double score,  String? review)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.score,_that.review);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double score,  String? review)  $default,) {final _that = this;
switch (_that) {
case _Review():
return $default(_that.score,_that.review);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double score,  String? review)?  $default,) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.score,_that.review);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Review with DiagnosticableTreeMixin implements Review {
  const _Review({required this.score, this.review});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

@override final  double score;
@override final  String? review;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Review'))
    ..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('review', review));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.score, score) || other.score == score)&&(identical(other.review, review) || other.review == review));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,score,review);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Review(score: $score, review: $review)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@override @useResult
$Res call({
 double score, String? review
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? review = freezed,}) {
  return _then(_Review(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
