import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_async_notifier_provider/models/activity.dart';
import 'package:riverpod_async_notifier_provider/providers/dio_provider.dart';

part 'async_activity_provider.g.dart';

@riverpod
class AsyncActivity extends _$AsyncActivity {
  @override
  FutureOr<Activity> build() async {
    print("[AsyncActivityProvider] created");

    ref.onDispose(() {
      print("[AsyncActivityProvider] disposed");
    });

    return initialData();
  }

  Future<Activity> initialData() async {
    try {
      final i = Random().nextInt(activityTypes.length);

      final activityType = activityTypes[i];

      Response response;

      response = await ref.read(dioProvider).get("/filter?type=$activityType");

      final activities = (response.data as List)
          .map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList();

      final index = Random().nextInt(activities.length);

      if (index % 3 == 0) {
        throw Exception("Error while getting activity!");
      }

      final activity = activities[index];

      return activity;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getActivities(String activityType) async {
    state = const AsyncLoading();

    Response response;

    /*
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

      state = AsyncData(activity);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
    */

    // with guard (better approach than above)
    state = await AsyncValue.guard(() async {
      response = await ref.read(dioProvider).get("/filter?type=$activityType");

      final activities = (response.data as List)
          .map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList();

      final index = Random().nextInt(activities.length);

      if (index % 3 == 0) {
        throw Exception("Error while getting activity!");
      }

      final activity = activities[index];

      return activity;
    });
  }
}
