import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_future_provider/models/user.dart';
import 'package:riverpod_future_provider/providers/dio_provider.dart';

part 'users_providers.g.dart';

/*
final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  print("[UserListProvider] created");

  ref.onDispose(() {
    print("[UserListProvider] disposed");
  });

  final dio = ref.watch(dioProvider);

  Response response;

  try {
    response = await dio.get("/users");
  } catch (e) {
    throw Exception("Failed to load users!");
  }

  return List<User>.from(response.data.map((x) => User.fromJson(x)));
});

final userDetailProvider = FutureProvider.autoDispose.family<User, int>((
  ref,
  id,
) async {
  print("[UserDetailProvider($id)] created");

  ref.onDispose(() {
    print("[UserDetailProvider($id)] disposed");
  });

  final dio = ref.watch(dioProvider);

  Response response;

  try {
    response = await dio.get("/users/$id");
  } catch (e) {
    throw Exception("Failed to load user!");
  }

  return User.fromJson(response.data);
});

*/

@riverpod
FutureOr<List<User>> userList(Ref ref) async {
  print("[UserListProvider] created");

  ref.onDispose(() {
    print("[UserListProvider] disposed");
  });

  final dio = ref.watch(dioProvider);

  Response response;

  try {
    response = await dio.get("/users");
  } catch (e) {
    throw Exception("Failed to load users!");
  }

  return List<User>.from(response.data.map((x) => User.fromJson(x)));
}

@riverpod
FutureOr<User> userDetail(Ref ref, int id) async {
  print("[UserDetailProvider($id)] created");

  ref.onDispose(() {
    print("[UserDetailProvider($id)] disposed");
  });

  final dio = ref.watch(dioProvider);

  ref.keepAlive(); // keep the provider alive

  Response response;

  try {
    response = await dio.get("/users/$id");
  } catch (e) {
    throw Exception("Failed to load user!");
  }

  return User.fromJson(response.data);
}
