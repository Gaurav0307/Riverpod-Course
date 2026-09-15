import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'method.freezed.dart';

@freezed
abstract class Method with _$Method {
  const Method._();
  factory Method(String method, {double? version}) = _Method;

  void printMethod() => print("$method ${version ?? 0.0}");
}
