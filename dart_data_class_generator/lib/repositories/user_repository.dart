import 'package:dart_data_class_generator/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  Future<List<User>> getUser() async {
    try {
      var response = await Dio().get(
        'https://jsonplaceholder.typicode.com/users',
      );
      return (response.data as List).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      debugPrint("Exception:-> $e");
      return [];
    }
  }
}
