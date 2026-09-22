import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_notifier_provider/models/activity.dart';

part 'enum_async_activity_state.freezed.dart';

@freezed
abstract class EnumAsyncActivityState with _$EnumAsyncActivityState {
  const factory EnumAsyncActivityState({
    required ActivityStatus status,
    required Activity activity,
    required String error,
  }) = _EnumAsyncActivityState;

  factory EnumAsyncActivityState.initial() => EnumAsyncActivityState(
    status: ActivityStatus.loading,
    activity: Activity.empty(),
    error: "",
  );
}

enum ActivityStatus { loading, success, failure }
