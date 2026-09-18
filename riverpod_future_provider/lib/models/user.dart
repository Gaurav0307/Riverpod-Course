import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  User._();

  factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _User;

  @override
  String toString() => "User(id: $id)";

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
