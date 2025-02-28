// ignore_for_file: deprecated_member_use

import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirmation.freezed.dart';
part 'confirmation.g.dart';

@freezed
class ConfirmationData with _$ConfirmationData {
  const factory ConfirmationData({
    required String type,
    required String value,
  }) = _ConfirmationData;

  factory ConfirmationData.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationDataFromJson(json);
}

@freezed
class ConfirmationSchemaInput with _$ConfirmationSchemaInput {
  const factory ConfirmationSchemaInput({
    required int id,
    @JsonKey(nullable: true) bool? approved,
    required String createdAt,
    @JsonKey(nullable: true) String? approvedAt,
    required ConfirmationData data,
    @JsonKey(nullable: true) String? rejectReason,
    required bool share,
    required String userTgId,
    required int challengeId,
    @JsonKey(nullable: true) String? url,
  }) = _ConfirmationSchemaInput;

  factory ConfirmationSchemaInput.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationSchemaInputFromJson(json);
}

@freezed
class ConfirmationListResponse with _$ConfirmationListResponse {
  const factory ConfirmationListResponse({
    required List<ConfirmationSchemaInput> confirmations,
    int? lastReadId,
  }) = _ConfirmationListResponse;

  factory ConfirmationListResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationListResponseFromJson(json);
}
