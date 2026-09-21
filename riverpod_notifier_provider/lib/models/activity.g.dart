// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Activity _$ActivityFromJson(Map<String, dynamic> json) => _Activity(
  activity: json['activity'] as String,
  availability: (json['availability'] as num).toDouble(),
  accessibility: json['accessibility'] as String,
  type: json['type'] as String,
  participants: (json['participants'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  key: json['key'] as String,
);

Map<String, dynamic> _$ActivityToJson(_Activity instance) => <String, dynamic>{
  'activity': instance.activity,
  'availability': instance.availability,
  'accessibility': instance.accessibility,
  'type': instance.type,
  'participants': instance.participants,
  'price': instance.price,
  'key': instance.key,
};
