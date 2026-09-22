import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio (Ref ref) {
  print("[DioProvider] created");

  ref.onDispose(() {
    print("[DioProvider] disposed");
  });

  /// URL: "https://bored-api.appbrewery.com/filter?type=recreational"
  return Dio(BaseOptions(baseUrl: "https://bored-api.appbrewery.com/"));
}
