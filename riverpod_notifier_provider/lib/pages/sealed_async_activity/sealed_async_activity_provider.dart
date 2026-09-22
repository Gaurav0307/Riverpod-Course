import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_notifier_provider/models/activity.dart';
import 'package:riverpod_notifier_provider/pages/sealed_async_activity/sealed_async_activity_state.dart';
import 'package:riverpod_notifier_provider/providers/dio_provider.dart';

part 'sealed_async_activity_provider.g.dart';

@riverpod
class SealedAsyncActivity extends _$SealedAsyncActivity {
  SealedAsyncActivity() {
    print("[SealedAsyncActivityProvider] constructor called");
  }

  @override
  SealedAsyncActivityState build() {
    print("[SealedAsyncActivityProvider] created");

    ref.onDispose(() {
      print("[SealedAsyncActivityProvider] disposed");
    });

    state = const SealedAsyncActivityLoading();

    final index = Random().nextInt(activityTypes.length);

    getActivities(activityTypes[index]);

    return const SealedAsyncActivityLoading();
  }

  Future<void> getActivities(String activityType) async {
    state = const SealedAsyncActivityLoading();

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

      state = SealedAsyncActivitySuccess(activity: activity);
    } catch (e) {
      state = SealedAsyncActivityFailure(error: e.toString());
    }
  }
}
