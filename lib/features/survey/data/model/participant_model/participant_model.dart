import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_model.freezed.dart';
part 'participant_model.g.dart';

@freezed
class ParticipantModel with _$ParticipantModel {
  factory ParticipantModel({
    String? nik,
    String? name,
    String? departement,
    @JsonKey(name: 'departement_id') String? departementId,
    String? role,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'site_location') String? siteLocation,
    @JsonKey(name: 'site_location_id') String? siteLocationId,
    @JsonKey(name: 'total_assessment') int? totalAssessment,
    @JsonKey(name: 'last_assessment') String? lastAssessment,
    @JsonKey(name: 'image_profile') String? imageProfile,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);
}
