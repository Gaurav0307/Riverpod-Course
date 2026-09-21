import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required String activity,
    required double availability,
    required String accessibility,
    required String type,
    required int participants,
    required double price,
    required String key,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  factory Activity.empty() => const Activity(
    activity: "",
    availability: 0.0,
    accessibility: "",
    type: "",
    participants: 0,
    price: 0.0,
    key: "",
  );
}

final activityTypes = [
  "education",
  "recreational",
  "social",
  "charity",
  "cooking",
  "relaxation",
  "busywork",
];
