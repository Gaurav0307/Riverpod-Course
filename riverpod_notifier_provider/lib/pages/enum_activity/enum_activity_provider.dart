import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_notifier_provider/models/activity.dart';
import 'package:riverpod_notifier_provider/pages/enum_activity/enum_activity_state.dart';
import 'package:riverpod_notifier_provider/providers/dio_provider.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivity extends _$EnumActivity {
  @override
  EnumActivityState build() {
    print("[EnumActivityProvider] created");

    ref.onDispose(() {
      print("[EnumActivityProvider] disposed");
    });

    return EnumActivityState.initial();
  }

  Future<void> getActivities(String activityType) async {
    state = state.copyWith(status: ActivityStatus.loading);

    Response response;

    try {
      response = await ref.read(dioProvider).get("/filter?type=$activityType");

      final activities = (response.data as List)
          .map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList();

      final index = Random().nextInt(activities.length);

      if (index % 3 == 0) {
        throw Exception("Error while getting activity!");
      }

      final activity = activities[index];

      state = state.copyWith(
        status: ActivityStatus.success,
        activity: activity,
      );
    } catch (e) {
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
