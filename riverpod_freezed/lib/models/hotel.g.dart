// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hotel _$HotelFromJson(Map<String, dynamic> json) => _Hotel(
  name: json['name'] as String,
  classification: (json['classification'] as num).toInt(),
  city: json['city'] as String,
  parkingLotCapacity: (json['parking_lot_capacity'] as num?)?.toInt(),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Review>[],
);

Map<String, dynamic> _$HotelToJson(_Hotel instance) => <String, dynamic>{
  'name': instance.name,
  'classification': instance.classification,
  'city': instance.city,
  'parking_lot_capacity': instance.parkingLotCapacity,
  'reviews': instance.reviews.map((e) => e.toJson()).toList(),
};

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  score: (json['score'] as num).toDouble(),
  review: json['review'] as String?,
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'score': instance.score,
  'review': instance.review,
};
