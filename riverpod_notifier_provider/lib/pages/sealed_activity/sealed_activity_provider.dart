import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_notifier_provider/models/activity.dart';
import 'package:riverpod_notifier_provider/pages/sealed_activity/sealed_activity_state.dart';
import 'package:riverpod_notifier_provider/providers/dio_provider.dart';

part 'sealed_activity_provider.g.dart';

@riverpod
class SealedActivity extends _$SealedActivity {
  @override
  SealedActivityState build() {
    print("[SealedActivityProvider] created");

    ref.onDispose(() {
      print("[SealedActivityProvider] disposed");
    });

    return const SealedActivityInitial();
  }

  Future<void> getActivities(String activityType) async {
    state = const SealedActivityLoading();

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

      state = SealedActivitySuccess(activity: activity);
    } catch (e) {
      state = SealedActivityFailure(error: e.toString());
    }
  }
}
