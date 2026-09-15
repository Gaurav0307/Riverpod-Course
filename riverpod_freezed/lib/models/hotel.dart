import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
abstract class Hotel with _$Hotel {
  @JsonSerializable(explicitToJson: true)
  factory Hotel({
    required String name,
    required int classification,
    required String city,
    @JsonKey(name: 'parking_lot_capacity') int? parkingLotCapacity,
    @Default(<Review>[]) List<Review> reviews,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, Object?> json) => _$HotelFromJson(json);
}

@freezed
abstract class Review with _$Review {
  const factory Review({required double score, String? review}) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);
}
