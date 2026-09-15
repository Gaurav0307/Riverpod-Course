import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'collections.freezed.dart';

@freezed
abstract class ImmutableCollection with _$ImmutableCollection {
  factory ImmutableCollection({required List<int> list}) = _ImmutableCollection;
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class MutableCollection with _$MutableCollection {
  factory MutableCollection({required List<int> list}) = _MutableCollection;
}
