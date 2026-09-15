import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mutable_person.freezed.dart';

// Mutable
@unfreezed
abstract class MutablePerson with _$MutablePerson {
  factory MutablePerson({
    required int id,
    required String name,
    required String email,
  }) = _MutablePerson;
}
