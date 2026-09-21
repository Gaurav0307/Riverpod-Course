import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_notifier_provider/models/activity.dart';

part 'enum_activity_state.freezed.dart';

@freezed
abstract class EnumActivityState with _$EnumActivityState {
  const factory EnumActivityState({
    required ActivityStatus status,
    required Activity activity,
    required String error,
  }) = _EnumActivityState;

  factory EnumActivityState.initial() => EnumActivityState(
    status: ActivityStatus.initial,
    activity: Activity.empty(),
    error: "",
  );
}

enum ActivityStatus { initial, loading, success, failure }
